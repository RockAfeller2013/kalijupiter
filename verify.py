#jupyter nbconvert filename.ipynb --clear-output

import json
    with open("your_corrupted_notebook.ipynb") as pynb:
 try:
report = json.load(pynb)
except Exception as e:
print(str(e))
