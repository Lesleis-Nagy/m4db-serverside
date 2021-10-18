r"""
A set of utilities that check whether an neb path with the given start/end model unique_ids exists.
"""

from sqlalchemy.orm import aliased

from m4db_database.orm.latest import Model
from m4db_database.orm.latest import NEB


def path_with_models_exists(session, model_unique_id_one, model_unique_id_two):
    r"""
    Check to see whether a model with the given start/end unique IDs already exists in the NEB table.
    :param session: the database session object.
    :param model_unique_id_one: a model unique ID.
    :param model_unique_id_two: a second model unique ID.
    :return: True if there is an NEB path with a model that has either `model_unique_id_one` as its first unique ID and
             `model_unique_id_two` as its second unique iD (or vice versa), otherwise False.
    """

    StartModel = aliased(Model, name="StartModel")
    EndModel = aliased(Model, name="EndModel")

    # Check that `model_unique_id_one` and `model_unique_id_two` are not the start/end respectively.
    result = session.query(NEB).\
        join(StartModel, StartModel.id == NEB.start_model_id).\
        join(EndModel, EndModel.id == NEB.end_model_id).\
        filter(StartModel.unique_id == model_unique_id_one).\
        filter(EndModel.unique_id == model_unique_id_two).\
        one_or_none()

    if result:
        return True

    # Check that `model_unique_id_two` and `model_unique_id_one` are not the start/end respectively.
    result = session.query(NEB). \
        join(StartModel, StartModel.id == NEB.start_model_id). \
        join(EndModel, EndModel.id == NEB.end_model_id). \
        filter(StartModel.unique_id == model_unique_id_two). \
        filter(EndModel.unique_id == model_unique_id_one). \
        one_or_none()

    if result:
        return True
    else:
        return False
