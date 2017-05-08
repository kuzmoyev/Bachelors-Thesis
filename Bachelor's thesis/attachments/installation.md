# Installation guide

###### This is the guide on how to setup, run and deploy ElateMe back-end server on Ubuntu OS.

### Requirements
To be able to setup and run project you need

* python3
* pip
* virtualenv

To install run:

    sudo apt-get update
    sudo apt-get install python3
    sudo apt-get install python-pip
    pip install virtualenv

### Setup

Clone repository:

    git clone git@repo.micman.cz:allmywishes/server-api.git ElateMe

Go to `ElateMe` folder and create virtual environment:

    cd ElateMe
    virtualenv -p /usr/bin/python3.5 venv

To begin using the virtual environment, it needs to be activated:

    source venv/bin/activate

Install requirements inside virtual environment:

    pip install -r requirements.txt

Migrate Django models:

    python manage.py makemigrations
    python manage.py migrate

By default project runs with `DEBUG=True` and sqlite database.
How to setup PostgreSQL and run project without `DEBUG` see [Deploy](#deploy) section.

Run tests:

    python manage.py test

Now you should be able to run project locally:

    python manage.py runserver

Server should be running on [localhost:8000](http://localhost:8000)

### Deploy