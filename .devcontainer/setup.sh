#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
python -c 'import sys, platform; assert sys.version_info[:2] == (3, 12), sys.version; assert platform.machine() == "x86_64", platform.machine()'
python -m venv .venv
.venv/bin/python -m pip install --upgrade pip==25.0.1
.venv/bin/python -m pip install -r requirements.txt
.venv/bin/python -m pip check
.venv/bin/python -m ipykernel install --user --name cps-tutorial --display-name "CPS Tutorial (Python 3.12)"
.venv/bin/python scripts/check_environment.py
echo 'Ready: open CPS Tutorial - Concrete.ipynb and select CPS Tutorial (Python 3.12).'
