# New virtual environments

mkdir <virtual environment>

python3 -m venv <venv_name> # may be python3.5
source myvenv/bin/activate
pip install --upgrade pip
pip install django
pip install -r requirements.txt

django-admin startproject <projectname> .

# add ability to do "workon"
