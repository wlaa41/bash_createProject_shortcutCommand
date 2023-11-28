#!/bin/bash

# createproject.sh
# This script creates a new project directory, and optionally sets up a Python virtual environment,
# initializes a Git repository with a .gitignore file, and creates a Dockerfile.
#
# Usage:
#   ./createproject.sh <project-name> [options]
#
# Options:
#   -p, --python-venv   Create a Python virtual environment inside the project.
#   -g, --git           Initialize a Git repository and create a .gitignore file.
#   -d, --docker        Create a Dockerfile in the project directory.
#   -h, --help          Display this help and exit.

# Function to display help
show_help() {
    grep '^#' "$0" | cut -c 4- # Display all lines in the script starting with '#'
    exit 0
}

# Check if project name is provided
if [ -z "$1" ]; then
    echo "Please specify a project name."
    exit 1
fi

# Initialize flags
python_venv=false
git_init=false
docker_file=false

# Function to handle individual flag
process_flag() {
    case "$1" in
        p) python_venv=true ;;
        g) git_init=true ;;
        d) docker_file=true ;;
        h) show_help ;;
        *) echo "Error: Unsupported flag $1" >&2; exit 1 ;;
    esac
}

# Process combined flags
while (( "$#" )); do
    case "$1" in
        -*)
            # Loop over each character in the argument
            for (( i=1; i<${#1}; i++ )); do
                process_flag "${1:i:1}"
            done
            shift
            ;;
        *)
            project_name="$1"
            shift
            ;;
    esac
done

# Create and enter the project directory
mkdir "$project_name"
cd "$project_name" || exit

# Apply actions based on flags
if [ "$python_venv" = true ]; then
    python3 -m venv "${project_name}venv"
fi

if [ "$git_init" = true ]; then
    git init
    cat > .gitignore << EOF
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
# Usually these files are written by a python script from a template
# before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/

# Jupyter Notebook
.ipynb_checkpoints

# pyenv
.python-version

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# pytype static type analyzer
.pytype/

# Cython debug symbols
cython_debug/
EOF
fi

if [ "$docker_file" = true ]; then
    touch Dockerfile
fi
