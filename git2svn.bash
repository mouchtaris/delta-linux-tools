#!/bin/bash

sparrow=https://139.91.186.186/svn/sparrow

CHEKO () {
local directoryName="$1"; shift;

	local svnpath="$sparrow/trunk/Tools/$directoryName"
	echo Cloning $svnpath ...
	svn2git --nobranches --notags --rootistrunk "$svnpath"
}


paths="Delta DeltaAnsiCompiler DeltaAnsiVMDebug"

for path in $paths
do
	CHEKO "$path"
done
