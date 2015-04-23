#!/bin/bash -e

if [ ! -d "venv" ] ;  then
  virtualenv venv
fi

source ./venv/bin/activate && pip install -q --upgrade -r requirements.txt

rm -rf target
mkdir target

nosetests --with-xunit --xunit-file=target/nosetests.xml --with-xcover --xcoverage-file=target/coverage/coverage.xml --cover-package=hello_flask --cover-erase --cover-html-dir=target/coverage --cover-html

deactivate
