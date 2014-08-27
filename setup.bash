#!/bin/bash

build="$1"
delta="$2"
tools="$( cd "$(dirname "$0")" && pwd )"

mkdir -pv ${delta} &&
cd ${delta}/.. &&
git clone https://github.com/mouchtaris/delta-linux.git ${delta} &&
cd ${delta} && git checkout linux &&
cd ${tools} && bash make_workdir.bash ${build} ${delta} &&
cd ${build} && source env.bash
