#!/bin/bash

username=muhtaris
password="$(<credentials_password)"
sparrow=https://139.91.186.186/svn/sparrow
svnflags='' #"--username=$username --password=$password --non-interactive"

echo username=$username password=$password sprrow=$sparrow

CHEKO () {
local directoryName="$1"; shift;

	local svnpath="$sparrow/trunk/Tools/$directoryName"

	if [ -d "$directoryName" ]
	then
		echo "updting $path ..."
		pushd "$directoryName" >/dev/null && { svn up ; popd >/dev/null ; }
	else
		echo "checking out $path ... "
		svn co $svnpath
	fi	
}


paths="Delta DeltaAnsiCompiler DeltaAnsiVMDebug"

for path in $paths
do
	CHEKO "$path"
done

find . -iname unistd.h -print0 | xargs -0 rm -v 


