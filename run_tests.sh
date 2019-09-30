#!/bin/bash
# Core pieces

# Python before 2.7

python2.7 -c 'import sys; exit(sys.version_info[0:2] < (2,7))'  # Return exit code 1 if before python 2.7
if [ $? -ne 0 ]; then  # Module discover pip-installed for test discovery
    python2.7 -m discover
else
    python2.7 -m unittest discover
fi



if [ $? -ne 0 ]; then
    exit 1
fi

# Command-line call tests (use github API)
python2.7 -m unittest pyresttest.functionaltest

if [ $? -ne 0 ]; then
    exit 1
fi

# Extensions test
sh test_use_extension.sh

if [ $? -ne 0 ]; then
    exit 1
fi

