#!/bin/bash

# Create a virtual environment and activate it
if ! python3 -m venv ./venv; then
    echo "Failed to create virtual environment."
    exit 1
fi

if ! source ./venv/bin/activate; then
    echo "Failed to activate virtual environment."
    exit 1
fi

# Install dependencies from requirements.txt
if ! pip install -r requirements.txt; then
    echo "Failed to install dependencies."
    exit 1
fi

# build the docs
if ! mkdocs build; then
  echo "Failed to build the docs"
  exit 1
fi