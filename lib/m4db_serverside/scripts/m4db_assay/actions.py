r"""
Perform actions for the 'm4db_assay' scripts.
"""
import pandas as pd
from tabulate import tabulate


from m4db_database.sessions import get_session

from m4db_database.orm.latest import RunningStatus
from m4db_database.orm.latest import Model


def general_action():
    r"""
    Display general m4db assay statistics.
    :return: None
    """
    session = get_session(nullpool=True)

    # Retrieve all running statuses.
    statuses = session.query(RunningStatus).all()

    # For each running status do a count.
    tot_nmodels = 0

    model_stats = {
        "Running status": [],
        "No. of models": []
    }
    for status in statuses:
        nmodels = session.query(Model).filter(Model.running_status_id == status.id).count()
        tot_nmodels += nmodels

        model_stats["Running status"].append(status.name)
        model_stats["No. of models"].append(nmodels)

    df = pd.DataFrame.from_dict(model_stats)
    print("Model data")
    print(tabulate(df, headers='keys', tablefmt='psql'))
    print("Total no. of models: {}".format(tot_nmodels))




