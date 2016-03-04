# syncFolders.sh ---
#
# Filename: syncFolders.sh
# Description: Sync all the problem folders with the template folder
# Author: Carlos Montilla
# Maintainer:
# Created: jeu. mars  3 18:45:08 2016 (+0100)
# Version:
# Package-Requires: ()
# Last-Updated:
#           By:
#     Update #: 0
# URL:
# Doc URL:
# Keywords:
# Compatibility:
#
#

# Commentary:
#
#
#
#

# Change Log:
#
#
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
#
#

# Code:

function readTemplate {
    EXTENSIONS=()
    for file in  $TEMPLATE_FOLDER/$PROBLEM_FILE.*
    do
        filename=`basename $file`
        extension="${filename##*.}"
        filename="${filename%.*}"
        EXTENSIONS+=($extension)
    done
}

function syncFolder {

    echo "Sync $1 Folder..."
    for problem in $1/*/
    do
        syncProblem $problem
    done

}

function syncProblem {

    echo -e "\tSync problem $1"

    cp $TEMPLATE_FOLDER/$TEST_FILE $1

    if [ ! -f $1/$IN_FILE ]; then
       cp $TEMPLATE_FOLDER/$IN_FILE $1
    fi

    if [ ! -f $1/$OUT_FILE ]; then
        echo "Copying in file"
        cp $TEMPLATE_FOLDER/$OUT_FILE $1
    fi

    if [ ! -f $1/$SCORE_FILE ]; then
        cp $TEMPLATE_FOLDER/$SCORE_FILE $1
    fi

    for ext in ${EXTENSIONS[*]}
    do
        if [ -f $1/*.$ext ]; then
            filename=`find $1/ -maxdepth 1 -name "*.$ext"`
            filename=`basename $filename`
            filename="${filename%.*}"
            if [ $filename != $PROBLEM_FILE ]; then
                mv $1/$filename.$ext $1/$PROBLEM_FILE.$ext
            fi

        else
            cp $TEMPLATE_FOLDER/$PROBLEM_FILE.$ext $1/
        fi

    done

}

readonly TEMPLATE_FOLDER=./templateFolder
readonly TEST_FILE=testcode
readonly PROBLEM_FILE=main
readonly IN_FILE=in
readonly OUT_FILE=out
readonly SCORE_FILE=score.org


readTemplate $TEMPLATE_FOLDER


syncProblem "./easy/rollerCoaster"
# levels=(easy medium hard)
# for folder in ${levels[*]}
# do
#     syncFolder $folder
# done


#
# syncFolders.sh ends here
