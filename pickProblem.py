#! /usr/bin/env python
import random
import os

def main():

    languages = ["Ruby",
                 "Python 2",
                 "Python 3",
                 "C",
                 "C++",
                 "Java",
                 "Haskell",
                 "Fortran",
                 "R",
                 "Shell"]


    levels = ["easy", "medium", "hard"]

    print "Select difficulty"
    print "1. Easy"
    print "2. Medium"
    print "3. Hard"


    difficulty = input();
    lstProblems = [x[0] for x in os.walk("./" + levels[difficulty - 1])]

    language = random.choice(languages)
    problem = random.choice(lstProblems)


    print "Problem:", problem, "in:", language


if __name__ == "__main__":
    main()
