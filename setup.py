#!/usr/scripts/envs python

from distutils.core import setup

NAME = "m4db_serverside"
VERSION = "1.2.0"

setup(
    name=NAME,
    version=VERSION,
    license="MIT",
    description="M4DB server side utiltiles",
    url="https://github.com/Lesleis-Nagy/{name:}".format(name=NAME),
    download_url="https://github.com/Lesleis-Nagy/{name:}/archive/{version:}.zip".format(name=NAME, version=VERSION),
    keywords=["micromagnetics", "database"],
    author="L. Nagy, W. Williams",
    author_email="lnagy2@ed.ac.uk",
    packages=[
        "m4db_serverside",
        "m4db_serverside.db",
        "m4db_serverside.db.db_user",
        "m4db_serverside.db.external_field",
        "m4db_serverside.db.geometry",
        "m4db_serverside.db.initial_magnetization",
        "m4db_serverside.db.model",
        "m4db_serverside.db.model_material_associations",
        "m4db_serverside.db.model_materials_text",
        "m4db_serverside.db.project",
        "m4db_serverside.db.running_status",
        "m4db_serverside.db.size_convention",
        "m4db_serverside.db.software",
        "m4db_serverside.db.unit",

        "m4db_serverside.file_io",

        "m4db_serverside.postprocessing",

        "m4db_serverside.rest",
        "m4db_serverside.rest.m4db_runner_web",
        "m4db_serverside.rest.m4db_readonly_web",

        "m4db_serverside.rest_api",
        "m4db_serverside.rest_api.m4db_runner_web",

        "m4db_serverside.runner",
        "m4db_serverside.runner.model",

        "m4db_serverside.scripts",
        "m4db_serverside.scripts.m4db_assay",
        "m4db_serverside.scripts.m4db_geometry",
        "m4db_serverside.scripts.m4db_model",
        "m4db_serverside.scripts.m4db_project",
        "m4db_serverside.scripts.m4db_run_model",
        "m4db_serverside.scripts.m4db_schedule_model",
        "m4db_serverside.scripts.m4db_software",
        "m4db_serverside.scripts.m4db_user",

        "m4db_serverside.templates",

        "m4db_serverside.utilities"
    ],
    package_dir={
        "m4db_serverside": "lib/m4db_serverside"
    },
    package_data={
        "m4db_serverside.templates": ["merrill/*.jinja2", "slurm/*.jinja2"]
    },
    scripts=[
        "scripts/m4db_assay",
        "scripts/m4db_geometry",
        "scripts/m4db_model",
        "scripts/m4db_project",
        "scripts/m4db_run_model",
        "scripts/m4db_schedule_model",
        "scripts/m4db_software",
        "scripts/m4db_user",

        "rest/m4db_start_runner_web",
        "rest/m4db_start_readonly_web"
    ],
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Database",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9"
    ]),
