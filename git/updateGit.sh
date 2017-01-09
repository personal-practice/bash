#!/bin/bash
find . -mindepth 1 -maxdepth 1 -type d -exec git -C {} pull origin master \;