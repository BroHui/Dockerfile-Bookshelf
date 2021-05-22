#!/bin/bash
# This script will group all requirements.txt in your project folder.
# PLEASE MIND! If requirement duplicate in two files, YOU SHOULD REMOVE ONE MANUALLY.
find . -name 'requirements.txt' -exec cat {} \; -exec echo \;
