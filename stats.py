"""
This file generates all the statistics for the codeeval's problems
Programmed by: Carlos Montilla
"""

import os


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

    return data
def main():
    testDir = "./easy/findHighestScore/"
    print getData(testDir)

if __name__ == "__main__":
    main()
