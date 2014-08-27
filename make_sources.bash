#!/bin/dash

sourcesmk=Sources.mk

rm -vf $sourcesmk

alias prepro='sed -r -e '\''s/^/    /;s/$/ \\/'\'
alias append='tee -a '"$sourcesmk"

printf 'Sources = \\\n' | tee -a $sourcesmk
ls -1     \
          Delta/Common/Src/*.cpp \
          Delta/DebugBreakPointHolder/Src/*.cpp \
          Delta/DebugClient/Src/*.cpp \
          Delta/DebugExprEvaluator/Src/*.cpp \
          Delta/DebugLib/Src/*.cpp \
          Delta/DebugServer/Src/*.cpp \
          Delta/DebugWatchValueInfo/Src/*.cpp \
          Delta/DeltaCompiler/Src/*.cpp \
          Delta/DeltaDebugMessageEncoding/Src/*.cpp \
          Delta/DeltaDebuggedVMFacade/Src/*.cpp \
          Delta/DeltaPureVMFacade/Src/*.cpp \
          Delta/DeltaStdLib/Src/*.cpp \
          Delta/DeltaSyntaxTree/Source/*.cpp \
          Delta/DeltaVirtualMachine/Src/*.cpp \
          Delta/DeltaVirtualMachineDebugExtensions/Src/*.cpp \
          Delta/FileReadersLib/Src/*.cpp \
          Delta/ResourceLoaderLib/Src/*.cpp \
          Delta/SocketLib/Src/*.cpp \
          Delta/UtilLib/Src/*.cpp \
| sort \
| prepro \
| append



printf '\n\nSourcesWx = \\\n' | append
ls -1    Delta/DeltaExtraLibraries/wxWidgets/Src/*.cpp \
| sort \
| prepro \
| append



printf '\n\nSourcesXML = \\\n' | append
ls -1    Delta/DeltaExtraLibraries/XMLParser/Src/*.cpp \
| sort \
| prepro \
| append



printf '\n\nSourcesJSON = \\\n' | append
ls -1 Delta/DeltaExtraLibraries/JSONParser/Src/*.cpp \
| sort \
| prepro \
| append

printf '\n\nSourcesDeltaCompiler = \\\n' | append
printf 'DeltaAnsiCompiler/Source/main.cpp
DeltaAnsiCompiler/Source/DeltaCompilerInvoker.cpp
' \
| sort \
| prepro \
| append



printf '\n\nSourcesDeltaVM = \\\n' | append
printf 'DeltaAnsiVMDebug/Source/CommandLineArguments.cpp
DeltaAnsiVMDebug/Source/main.cpp
DeltaAnsiVMDebug/Source/CommandLineArgumentsFactory.cpp
' \
| sort \
| prepro \
| append



printf '\n\nSourcesDisco = \\\n' | append
ls -1 Delta/DeltaConsoleDebugger/Src/*.cpp | sort | prepro | append

