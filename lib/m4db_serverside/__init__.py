r"""
Global variables.
"""


class global_vars:
    r"""
    Dummy class to define some global variables.
    """
    model_directory_name = "model"
    geometry_directory_name = "geometry"
    neb_directory_name = "neb"

    geometry_patran_file_name = "geometry.pat"
    geometry_stdout_file_name = "geometry.stdout"
    geometry_script_file_name = "geometry.cubit"

    energy_log_file_name = "energy"

    magnetization_dat_file_name = "magnetization.dat"
    magnetization_tecplot_file_name = "magnetization.tec"
    magnetization_tecplot_zip_file_name = "magnetization.zip"
    magnetization_json_file_name = "magnetization.json"
    magnetization_json_zip_file_name = "magnetization_json.zip"
    magnetization_mult_tecplot_file_name = "magnetization_mult.tec"
    magnetization_output_file_name = "magnetization"

    model_merrill_script_file_name = "model_script.merrill"
    model_stdout_file_name = "model_stdout.txt"
    model_stderr_file_name = "model_stderr.txt"

    neb_merrill_script_file_name = "neb_script.merrill"
    neb_stdout_file_name = "neb_stdout.txt"
    neb_stderr_file_name = "neb_stderr.txt"

    neb_tecplot_file_name = "neb.tec"

    running_status_not_run = "not-run"
    running_status_re_run = "re-run"
    running_status_running = "running"
    running_status_finished = "finished"
    running_status_crashed = "crashed"
    running_status_scheduled = "scheduled"
    running_status_failed = "failed"

    m4db_serverside_config_environment_variable = "M4DB_SERVERSIDE_CONFIG"

    default_db_user_ticket_length = 3600

    geometry_default_size_unit = "um"
    geometry_default_size_convention = "ESVD"
