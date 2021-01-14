import json
import argparse
from datetime import datetime
from pwd import getpwuid
import os
from os import stat

#checks if arg is a valid dir
def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise NotADirectoryError(path)

#takes directory as argument
p=argparse.ArgumentParser(description="Enter a Directory: ")
p.add_argument('dir', type=dir_path)
args = p.parse_args()

def mod_date(timestamp):
    d = datetime.utcfromtimestamp(timestamp)
    date_format = d.strftime('%d %b %Y')
    return date_format

def get_owner(filename):
    return getpwuid(stat(filename).st_uid).pw_name

#create/opens JSON file in current dir
def py_to_json():
    with open('data.json', 'w') as f:
        with os.scandir(args.dir) as files:
            for entry in files:
                #excludes directories
                if not entry.name.startswith('.') and entry.is_file(): 
                    info = entry.stat()
                    last_modified = mod_date(info.st_mtime)
                    file_name = entry.name
                    owner = get_owner(entry)

                    #converting python obj to JSON
                    array = {'name': entry.name, 'owner': owner, 'date': last_modified}
                    #writes to JSON file
                    json.dump(array,f)

