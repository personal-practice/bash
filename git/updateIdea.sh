#!/bin/bash
find . -mindepth 1 -maxdepth 1 -type d -exec make idea -C {} \;