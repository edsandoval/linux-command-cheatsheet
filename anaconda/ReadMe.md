# Anaconda 

## Creating a new clean enviroment with conda
```bash
conda create -n {enviroment_name} python=3.6
```

## Activate enviroment using yours name
```bash
source activate {enviroment_name}
```

## Install RASA and sklearn
```bash
pip install rasa_core
pip install sklearn_crfsuite
```

## Generate the requirement file
```bash
pip freeze > requirements_new.txt
```

## Desactivate the enviroment
```bash
source deactivate {enviroment_name}
```
