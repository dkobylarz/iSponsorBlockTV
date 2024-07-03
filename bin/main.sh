#!/bin/bash
BASE_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/../"
PYTHON_BIN_NAME=python3.9
VENV_DIR_NAME=".venv"

echo "BASE_DIR: $BASE_DIR"

cd "$BASE_DIR"

if [ -d "$VENV_DIR_NAME" ] ; then
    echo "venv dir already exists: $VENV_DIR_NAME"
else
    echo "venv dir does not exist, setting up: $VENV_DIR_NAME"
    $PYTHON_BIN_NAME -m venv $VENV_DIR_NAME
fi

echo "Activating python venv"
source "./$VENV_DIR_NAME/bin/activate"

echo "Refreshing dependencies"
$PYTHON_BIN_NAME -m pip install -r requirements.txt

echo "Starting main process"
$PYTHON_BIN_NAME src/main.py "$@"

