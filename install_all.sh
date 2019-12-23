#!/usr/bin/env bash

set -e

./bootstrap.sh

./osxprep.sh

./brew.sh

./osx.sh

./pydata.sh