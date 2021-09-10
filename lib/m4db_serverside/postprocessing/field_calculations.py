import sys

import vtk

import numpy as np

from m4db_serverside.file_io.tecplot import read_tecplot


def formatFloat(flt):
    strFlt = "{:20.15E}".format(flt)
    if strFlt[0] != '-':
        return ' ' + strFlt
    return strFlt


def pathIdNameM(pathId):
    return 'm_{}'.format(pathId)


def pathIdNameH(pathId):
    return 'h_{}'.format(pathId)


def pathIdNameV(pathId):
    return 'v_{}'.format(pathId)


def pathIdNameADM(pathId):
    return 'adm_{}'.format(pathId)


def tec_to_unstructured_grid(absFileName, adm_fun='0.5*(1-(({M}.iHat)^4 + ({M}.jHat)^4 + ({M}.kHat)^4))'):
    tec_raw = read_tecplot(absFileName)

    mag = tec_raw['fields']
    vert = tec_raw['vertices']
    conn = tec_raw['elements']

    nmag = tec_raw['nfields']
    nvert = tec_raw['nvert']
    nconn = tec_raw['nelem']

    # print("len(mag): {}".format(len(mag)))

    # The unstructured grid
    ug = vtk.vtkUnstructuredGrid()

    # Vertices.
    # print("Adding vertices")
    points = vtk.vtkPoints()
    points.SetNumberOfPoints(nvert)
    for i in range(nvert):
        points.SetPoint(i, vert[i, 0], vert[i, 1], vert[i, 2])
    ug.SetPoints(points)
    # print("...done!")

    # Connectivity
    # print("Adding elements")
    for i in range(nconn):
        element = vtk.vtkIdList()

        element.InsertNextId(conn[i][0])
        element.InsertNextId(conn[i][1])
        element.InsertNextId(conn[i][2])
        element.InsertNextId(conn[i][3])

        ug.InsertNextCell(vtk.VTK_TETRA, element)
    # print("...done!")

    # Magnetizations in all the zone
    for zone in range(nmag):

        # print("Adding magnetizations (name {})".format(pathIdNameM(zone)))
        field = vtk.vtkDoubleArray()
        field.SetName(pathIdNameM(zone))
        field.SetNumberOfComponents(3)
        field.SetNumberOfTuples(nvert)

        for i in range(nvert):
            field.SetTuple3(i, mag[zone][i][0], mag[zone][i][1], mag[zone][i][2])

        ug.GetPointData().AddArray(field)
        # print("...done!")

        # print("Computing vorticity field")
        vorticity = vtk.vtkGradientFilter()
        vorticity.ComputeVorticityOn()
        vorticity.SetInputArrayToProcess(0, 0, 0, 0, pathIdNameM(zone))
        # vorticity.SetResultArrayName('V')
        vorticity.SetVorticityArrayName('V')
        vorticity.SetInputData(ug)
        vorticity.Update()
        # print("...done!")

        # print("Adding vorticities (name {})".format(pathIdNameV(zone)))
        vfield = vtk.vtkDoubleArray()
        vfield.SetName(pathIdNameV(zone))
        vfield.SetNumberOfComponents(3)
        vfield.SetNumberOfTuples(nvert)

        vdata = vorticity.GetOutput().GetPointData().GetArray('V')
        for i in range(nvert):
            vfield.SetTuple3(i, vdata.GetTuple(i)[0],
                             vdata.GetTuple(i)[1],
                             vdata.GetTuple(i)[2])
        ug.GetPointData().AddArray(vfield)
        # print("..done!")

        # print("Computing helicity field")
        helicity = vtk.vtkArrayCalculator()
        # helicity.SetAttributeModeToUsePointData()
        helicity.AddVectorArrayName(pathIdNameM(zone))
        helicity.AddVectorArrayName('V')
        helicity.SetResultArrayName('H')
        helicity.SetFunction('{}.V'.format(pathIdNameM(zone)))
        helicity.SetInputData(vorticity.GetOutput())
        helicity.Update()
        # print("...done!")

        # print("Adding helicities (name {})".format(pathIdNameH(zone)))
        # helicities = []
        hfield = vtk.vtkDoubleArray()
        hfield.SetName(pathIdNameH(zone))
        hfield.SetNumberOfComponents(1)
        hfield.SetNumberOfTuples(nvert)

        hdata = helicity.GetOutput().GetPointData().GetArray('H')
        for i in range(nvert):
            hfield.SetValue(i, hdata.GetValue(i))
        ug.GetPointData().AddArray(hfield)
        # print("...done!")

        # print("Computing ADM field")
        adm = vtk.vtkArrayCalculator()
        adm.AddVectorArrayName(pathIdNameM(zone))
        adm.SetResultArrayName('ADM')
        adm.SetFunction(adm_fun.format(M=pathIdNameM(zone)))
        adm.SetInputData(vorticity.GetOutput())
        adm.Update()
        # print("...done!")

        # print("Adding ADM (name {})".format(pathIdNameADM(zone)))
        # adms = []
        adm_field = vtk.vtkDoubleArray()
        adm_field.SetName(pathIdNameADM(zone))
        adm_field.SetNumberOfComponents(1)
        adm_field.SetNumberOfTuples(nvert)

        adm_data = adm.GetOutput().GetPointData().GetArray('ADM')
        for i in range(nvert):
            adm_field.SetValue(i, adm_data.GetValue(i))
        ug.GetPointData().AddArray(adm_field)
        # print("...done!")

    return ug


def tec_to_unstructured_grid_visualize(absFileName, adm_fun='0.5*(1-(({M}.iHat)^4 + ({M}.jHat)^4 + ({M}.kHat)^4))'):
    class UGGridVizOutput:
        def __init__(self):
            self.ug = None
            self.hel_mins = None  # One for each zone (if multi-zone)
            self.hel_maxs = None  # One for each zone (if multi-zone)
            self.hel_mids = None  # One for each zone (if multi-zone)
            self.adm_mins = None  # One for each zone (if multi-zone)
            self.adm_maxs = None  # One for each zone (if multi-zone)
            self.adm_mids = None  # One for each zone (if multi-zone)

    tec_raw = read_tecplot(absFileName)

    mag = tec_raw['fields']
    vert = tec_raw['vertices']
    conn = tec_raw['elements']

    nmag = tec_raw['nfields']
    nvert = tec_raw['nvert']
    nconn = tec_raw['nelem']

    # print("len(mag): {}".format(len(mag)))

    # The unstructured grid
    ug = vtk.vtkUnstructuredGrid()

    # Vertices.
    # print("Adding vertices")
    points = vtk.vtkPoints()
    points.SetNumberOfPoints(nvert)
    for i in range(nvert):
        points.SetPoint(i, vert[i, 0], vert[i, 1], vert[i, 2])
    ug.SetPoints(points)
    # print("...done!")

    # Connectivity
    # print("Adding elements")
    for i in range(nconn):
        element = vtk.vtkIdList()

        element.InsertNextId(conn[i][0])
        element.InsertNextId(conn[i][1])
        element.InsertNextId(conn[i][2])
        element.InsertNextId(conn[i][3])

        ug.InsertNextCell(vtk.VTK_TETRA, element)
    # print("...done!")

    # Work on all the zones
    hel_mins = []
    hel_maxs = []
    hel_mids = []

    adm_mins = []
    adm_maxs = []
    adm_mids = []

    for zone in range(nmag):

        hel_min = 1E100
        hel_max = -1E100

        adm_min = 1E100
        adm_max = -1E100

        # print("Adding magnetizations (name {})".format(pathIdNameM(zone)))
        field = vtk.vtkDoubleArray()
        field.SetName(pathIdNameM(zone))
        field.SetNumberOfComponents(3)
        field.SetNumberOfTuples(nvert)

        for i in range(nvert):
            field.SetTuple3(i, mag[zone][i][0], mag[zone][i][1], mag[zone][i][2])

        ug.GetPointData().AddArray(field)
        # print("...done!")

        # print("Computing vorticity field")
        vorticity = vtk.vtkGradientFilter()
        vorticity.ComputeVorticityOn()
        vorticity.SetInputArrayToProcess(0, 0, 0, 0, pathIdNameM(zone))
        # vorticity.SetResultArrayName('V')
        vorticity.SetVorticityArrayName('V')
        vorticity.SetInputData(ug)
        vorticity.Update()
        # print("...done!")

        # print("Adding vorticities (name {})".format(pathIdNameV(zone)))
        vfield = vtk.vtkDoubleArray()
        vfield.SetName(pathIdNameV(zone))
        vfield.SetNumberOfComponents(3)
        vfield.SetNumberOfTuples(nvert)

        vdata = vorticity.GetOutput().GetPointData().GetArray('V')
        for i in range(nvert):
            vfield.SetTuple3(i, vdata.GetTuple(i)[0],
                             vdata.GetTuple(i)[1],
                             vdata.GetTuple(i)[2])
        ug.GetPointData().AddArray(vfield)
        # print("..done!")

        # print("Computing helicity field")
        helicity = vtk.vtkArrayCalculator()
        # helicity.SetAttributeModeToUsePointData()
        helicity.AddVectorArrayName(pathIdNameM(zone))
        helicity.AddVectorArrayName('V')
        helicity.SetResultArrayName('H')
        helicity.SetFunction('{}.V'.format(pathIdNameM(zone)))
        helicity.SetInputData(vorticity.GetOutput())
        helicity.Update()
        # print("...done!")

        # print("Adding helicities (name {})".format(pathIdNameH(zone)))
        # helicities = []
        hfield = vtk.vtkDoubleArray()
        hfield.SetName(pathIdNameH(zone))
        hfield.SetNumberOfComponents(1)
        hfield.SetNumberOfTuples(nvert)

        hdata = helicity.GetOutput().GetPointData().GetArray('H')
        for i in range(nvert):
            hel = hdata.GetValue(i)

            if hel < hel_min:
                hel_min = hel
            if hel > hel_max:
                hel_max = hel

            hfield.SetValue(i, hel)

        hel_mid = (hel_min + hel_max) / 2.0

        ug.GetPointData().AddArray(hfield)
        # print("...done!")

        # print("Computing ADM field")
        adm = vtk.vtkArrayCalculator()
        adm.AddVectorArrayName(pathIdNameM(zone))
        adm.SetResultArrayName('ADM')
        adm.SetFunction(adm_fun.format(M=pathIdNameM(zone)))
        adm.SetInputData(vorticity.GetOutput())
        adm.Update()
        # print("...done!")

        # print("Adding ADM (name {})".format(pathIdNameADM(zone)))
        # adms = []
        adm_field = vtk.vtkDoubleArray()
        adm_field.SetName(pathIdNameADM(zone))
        adm_field.SetNumberOfComponents(1)
        adm_field.SetNumberOfTuples(nvert)

        adm_data = adm.GetOutput().GetPointData().GetArray('ADM')
        for i in range(nvert):

            adm = adm_data.GetValue(i)

            if adm < adm_min:
                adm_min = adm
            if adm > adm_max:
                adm_max = adm

            adm_field.SetValue(i, adm)

        adm_mid = (adm_min + adm_max) / 2.0

        ug.GetPointData().AddArray(adm_field)
        # print("...done!")

        hel_mins.append(hel_min)
        hel_maxs.append(hel_max)
        hel_mids.append(hel_mid)

        adm_mins.append(adm_min)
        adm_maxs.append(adm_max)
        adm_mids.append(adm_mid)

    output = UGGridVizOutput()
    output.ug = ug
    output.hel_mins = hel_mins
    output.hel_maxs = hel_maxs
    output.hel_mids = hel_mids
    output.adm_mins = hel_mins
    output.adm_maxs = hel_maxs
    output.adm_mids = hel_mids

    return output


def write_vorticity_helicity_adm_to_tecplot(ug, file_name):
    r"""
    Write the vorticity field to a tecplot file.

    Arguments:
        file_name : the name of the file to write the vorticity field.
    """
    vertices = ug.GetPoints().GetData()
    cells = ug.GetCells()
    cellData = cells.GetData()

    nzones = int(ug.GetPointData().GetNumberOfArrays() / 3)
    # print("nzones {}".format(nzones))

    nvert = vertices.GetNumberOfTuples()
    nelem = int(float(cellData.GetNumberOfTuples()) / 5.0)

    isFirstZone = True

    with open(file_name, 'w') as fout:
        fout.write(' TITLE = "mag_vort_hel"\n')
        fout.write(' VARIABLES = "X","Y","Z","Mx","My","Mz","Vx","Vy","Vz","H","ADM"\n')

        for zone in range(nzones):
            magnetization = ug.GetPointData().GetArray(pathIdNameM(zone))
            vorticity = ug.GetPointData().GetArray(pathIdNameV(zone))
            helicity = ug.GetPointData().GetArray(pathIdNameH(zone))
            adm = ug.GetPointData().GetArray(pathIdNameADM(zone))

            # Sanity check, make sure no. of vertex/vorticity tuples are same
            if vertices.GetNumberOfTuples() != vorticity.GetNumberOfTuples():
                raise AssertionError("Vorticity and vertex count mismatch")

            # Sanity check, make sure no. of vertex/helicity tuples are same
            if vertices.GetNumberOfTuples() != helicity.GetNumberOfTuples():
                raise AssertionError("Helicity and vertex count mismatch")

            if isFirstZone:
                isFirstZone = False

                fout.write(
                    ' ZONE T = "{}" N={}, E={}, F=FEPOINT, ET=TETRAHEDRON\n'.format(
                        zone,
                        nvert,
                        nelem
                    )
                )

                for i in range(vertices.GetNumberOfTuples()):
                    fout.write(
                        " {} {} {} {} {} {} {} {} {} {} {}\n".format(
                            formatFloat(vertices.GetTuple(i)[0]),
                            formatFloat(vertices.GetTuple(i)[1]),
                            formatFloat(vertices.GetTuple(i)[2]),
                            formatFloat(magnetization.GetTuple(i)[0]),
                            formatFloat(magnetization.GetTuple(i)[1]),
                            formatFloat(magnetization.GetTuple(i)[2]),
                            formatFloat(vorticity.GetTuple(i)[0]),
                            formatFloat(vorticity.GetTuple(i)[1]),
                            formatFloat(vorticity.GetTuple(i)[2]),
                            formatFloat(helicity.GetValue(i)),
                            formatFloat(adm.GetValue(i))
                        )
                    )

                # cellData is of type vtkIdTypeArray, this array has the layout
                # [cell0_npts cell0_pt0 cell0_pt1 ... cell1_npts cell1_pt0 cell1_pt1 ...] (see ref. 1)
                for i in range(int(cellData.GetNumberOfTuples() / 5)):
                    fout.write(
                        " {:9d} {:9d} {:9d} {:9d}\n".format(
                            cellData.GetValue(5 * i + 1) + 1,  # WARNING!! Note how the offsets for the index
                            cellData.GetValue(5 * i + 2) + 1,  # arithmetic begin at 1 (and not 0), this is because the
                            cellData.GetValue(5 * i + 3) + 1,  # 0th offset is the number of points
                            cellData.GetValue(5 * i + 4) + 1  # please see ref. 1 for details.
                        )
                    )
            else:
                fout.write(
                    ' ZONE T="{}" N={} ,E={} F=FEPOINT, ET=TETRAHEDRON, VARSHARELIST =([1-3]=1), CONNECTIVITYSHAREZONE = 1\n'.format(
                        zone,
                        nvert,
                        nelem
                    )
                )
                for i in range(vertices.GetNumberOfTuples()):
                    fout.write(
                        " {} {} {} {} {} {} {} {}\n".format(
                            formatFloat(magnetization.GetTuple(i)[0]),
                            formatFloat(magnetization.GetTuple(i)[1]),
                            formatFloat(magnetization.GetTuple(i)[2]),
                            formatFloat(vorticity.GetTuple(i)[0]),
                            formatFloat(vorticity.GetTuple(i)[1]),
                            formatFloat(vorticity.GetTuple(i)[2]),
                            formatFloat(helicity.GetValue(i)),
                            formatFloat(adm.GetValue(i))
                        )
                    )


def write_vorticity_helicity_adm_to_vtk(ug, file_name):
    writer = vtk.vtkXMLUnstructuredGridWriter()
    writer.SetFileName(file_name)
    writer.SetInputData(ug)
    writer.Write()


def net_quantities(ug):
    r"""
    Integrate each component
    """

    vertices = ug.GetPoints().GetData()
    cells = ug.GetCells()
    cellData = cells.GetData()

    nzones = int(ug.GetPointData().GetNumberOfArrays() / 3)
    # print("nzones {}".format(nzones))

    # nvert = vertices.GetNumberOfTuples()
    # nelem = int(float(cellData.GetNumberOfTuples())/5.0)

    tmx = np.zeros(nzones)
    tmy = np.zeros(nzones)
    tmz = np.zeros(nzones)

    tvx = np.zeros(nzones)
    tvy = np.zeros(nzones)
    tvz = np.zeros(nzones)

    th = np.zeros(nzones)

    tadm = np.zeros(nzones)

    vol = 0.0

    for zone in range(nzones):

        # print("Processing zone: {}".format(zone))

        magnetization = ug.GetPointData().GetArray(pathIdNameM(zone))
        vorticity = ug.GetPointData().GetArray(pathIdNameV(zone))
        helicity = ug.GetPointData().GetArray(pathIdNameH(zone))
        adm = ug.GetPointData().GetArray(pathIdNameADM(zone))

        vol = 0.0

        for cid in range(int(cellData.GetNumberOfTuples() / 5)):
            cvid1 = cellData.GetValue(5 * cid + 1)  # WARNING!! These offsets are correct
            cvid2 = cellData.GetValue(5 * cid + 2)  # since the 0th offset refers to
            cvid3 = cellData.GetValue(5 * cid + 3)  # the number of indices
            cvid4 = cellData.GetValue(5 * cid + 4)  # please see ref 1 below!

            # First vertex
            x1 = vertices.GetTuple(cvid1)[0]
            y1 = vertices.GetTuple(cvid1)[1]
            z1 = vertices.GetTuple(cvid1)[2]
            mx1 = magnetization.GetTuple(cvid1)[0]
            my1 = magnetization.GetTuple(cvid1)[1]
            mz1 = magnetization.GetTuple(cvid1)[2]
            vx1 = vorticity.GetTuple(cvid1)[0]
            vy1 = vorticity.GetTuple(cvid1)[1]
            vz1 = vorticity.GetTuple(cvid1)[2]
            h1 = helicity.GetValue(cvid1)
            adm1 = adm.GetValue(cvid1)

            # Second vertex
            x2 = vertices.GetTuple(cvid2)[0]
            y2 = vertices.GetTuple(cvid2)[1]
            z2 = vertices.GetTuple(cvid2)[2]
            mx2 = magnetization.GetTuple(cvid2)[0]
            my2 = magnetization.GetTuple(cvid2)[1]
            mz2 = magnetization.GetTuple(cvid2)[2]
            vx2 = vorticity.GetTuple(cvid2)[0]
            vy2 = vorticity.GetTuple(cvid2)[1]
            vz2 = vorticity.GetTuple(cvid2)[2]
            h2 = helicity.GetValue(cvid2)
            adm2 = adm.GetValue(cvid2)

            # Third vertex
            x3 = vertices.GetTuple(cvid3)[0]
            y3 = vertices.GetTuple(cvid3)[1]
            z3 = vertices.GetTuple(cvid3)[2]
            mx3 = magnetization.GetTuple(cvid3)[0]
            my3 = magnetization.GetTuple(cvid3)[1]
            mz3 = magnetization.GetTuple(cvid3)[2]
            vx3 = vorticity.GetTuple(cvid3)[0]
            vy3 = vorticity.GetTuple(cvid3)[1]
            vz3 = vorticity.GetTuple(cvid3)[2]
            h3 = helicity.GetValue(cvid3)
            adm3 = adm.GetValue(cvid3)

            # Fourth vertex
            x4 = vertices.GetTuple(cvid4)[0]
            y4 = vertices.GetTuple(cvid4)[1]
            z4 = vertices.GetTuple(cvid4)[2]
            mx4 = magnetization.GetTuple(cvid4)[0]
            my4 = magnetization.GetTuple(cvid4)[1]
            mz4 = magnetization.GetTuple(cvid4)[2]
            vx4 = vorticity.GetTuple(cvid4)[0]
            vy4 = vorticity.GetTuple(cvid4)[1]
            vz4 = vorticity.GetTuple(cvid4)[2]
            h4 = helicity.GetValue(cvid4)
            adm4 = adm.GetValue(cvid4)

            dxdydz = abs(np.linalg.det(
                np.array([
                    [x1, y1, z1, 1.0],
                    [x2, y2, z2, 1.0],
                    [x3, y3, z3, 1.0],
                    [x4, y4, z4, 1.0]
                ])
            ) / 6.0)

            tmx[zone] += ((mx1 + mx2 + mx3 + mx4) / 4.0) * dxdydz
            tmy[zone] += ((my1 + my2 + my3 + my4) / 4.0) * dxdydz
            tmz[zone] += ((mz1 + mz2 + mz3 + mz4) / 4.0) * dxdydz

            tvx[zone] += ((vx1 + vx2 + vx3 + vx4) / 4.0) * dxdydz
            tvy[zone] += ((vy1 + vy2 + vy3 + vy4) / 4.0) * dxdydz
            tvz[zone] += ((vz1 + vz2 + vz3 + vz4) / 4.0) * dxdydz

            th[zone] += ((h1 + h2 + h3 + h4) / 4.0) * dxdydz

            tadm[zone] += ((adm1 + adm2 + adm3 + adm4) / 4.0) * dxdydz

            vol += dxdydz

    return {
        'total_mx': tmx,
        'total_my': tmy,
        'total_mz': tmz,
        'total_vx': tvx,
        'total_vy': tvy,
        'total_vz': tvz,
        'total_h': th,
        'total_adm': tadm,
        'total_vol': vol
    }


if __name__ == '__main__':

    if len(sys.argv) != 2:
        print("Must provide a file name")
        sys.exit(1)

    ug = tec_to_unstructured_grid(sys.argv[1])

    write_vorticity_helicity_adm_to_tecplot(ug, "vorticity.tec")
    write_vorticity_helicity_adm_to_vtk(ug, "vorticity.vtk")

    tots = net_quantities(ug)

    for key, value in tots.items():
        print(key)
        print(value)
        print("")

#
# References
#
# (1) http://vtk.1045678.n5.nabble.com/vtkCellArray-in-python-td3348424.html
#
