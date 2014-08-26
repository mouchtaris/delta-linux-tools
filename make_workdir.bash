#!/bin/bash

target="$1"
[ -z "$target" ] && printf 'First argument "target": where to set up the working dir\n' && exit 1

delta="$2"
[ -z "$delta" ] && printf 'Second argument "delta": where is the delta-linux root dir\n' && exit 1

mydir="$( cd "$(dirname "$0" )" && pwd )"
mkdir -pv "$target" &&
cd "$target" &&
ln -sv "$delta"/Tools/Delta{,AnsiCompiler,AnsiVMDebug} . &&
ln -sv "$mydir"/{GNUmakefile,make_sources.bash} . &&
printf 'export CXX='\''ccache g++'\''
export CCACHE_DIR='\'"$target"'/_ccache'\''
export WX_WIDGETS=/usr
export WXCONFIG=$(which wx-config32-2.8)
' > "$target"/env.bash


