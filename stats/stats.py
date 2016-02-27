"""
This file generates all the statistics for the codeeval's problems
Programmed by: Carlos Montilla
"""

import os


def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False

def convertToFloat(s):
    if is_number(s):
        return float(s)
    else:
        return s

def convertListToFloat(lst):
    return [convertToFloat(elem) for elem in lst]

def getData(pathdir):
    f = open(pathdir + "score.org")
    name = f.readline()
    url = f.readline()

    # Skipping header
    for dummy in range(3):
        f.next()

    data = []
    for line in f:
        data.append(line.rstrip().replace(" ","").split("|")[1:-1])


    return [convertListToFloat(ls) for ls in data]
def main():
    testDir = "../easy/findHighestScore/"
    print getData(testDir)

if __name__ == "__main__":
    main()
