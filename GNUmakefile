# vim: ts=4
ifeq ($(WX_WIDGETS),)
$(error 'WX_WIDGETS not set')
endif

include Sources.mk

Objects = $(foreach Source, $(Sources), _build/$(Source).o)
ObjectsWx = $(foreach Source, $(SourcesWx), _build/$(Source).o)
ObjectsXML = $(foreach Source, $(SourcesXML), _build/$(Source).o)
ObjectsDeltaCompiler = $(foreach Source, $(SourcesDeltaCompiler), _build/$(Source).o)
ObjectsDeltaVM = $(foreach Source, $(SourcesDeltaVM), _build/$(Source).o)

ObjectsD = $(foreach Source, $(Sources), _build/$(Source)_d.o)
ObjectsWxD = $(foreach Source, $(SourcesWx), _build/$(Source)_d.o)
ObjectsXMLD = $(foreach Source, $(SourcesXML), _build/$(Source)_d.o)
ObjectsDeltaCompilerD = $(foreach Source, $(SourcesDeltaCompiler), _build/$(Source)_d.o)
ObjectsDeltaVMD = $(foreach Source, $(SourcesDeltaVM), _build/$(Source)_d.o)

Depends =	\
			$(Objects:.o=.d) $(ObjectsWx:.o=.d) $(ObjectsXML:.o=.d) $(ObjectsDeltaCompiler:.o=.d) $(ObjectsDeltaVM:.o=.d)	\
			$(ObjectsD:.o=.d) $(ObjectsWxD:.o=.d) $(ObjectsXMLD:.o=.d) $(ObjectsDeltaCompilerD:.o=.d) $(ObjectsDeltaVMD:.o=.d)

LDFLAGS_COMMON = -m32 -Xlinker --rpath -Xlinker $(PWD)/lib -rdynamic -L$(PWD)/lib
CXXFLAGS_COMMON = -std=c++1y -pedantic -pthread -m32
CPPFLAGS_COMMON =	\
					-I./Delta/FileReadersLib/Include \
					-I./Delta/DebugLib/Include \
					-I./Delta/DeltaDebugLoader/Include \
					-I./Delta/DebugWatchValueInfo/Include \
					-I./Delta/Common/Include \
					-I./Delta/UtilLib/Include \
					-I./Delta/DeltaCompiler/Include \
					-I./Delta/DeltaDebuggedVMFacade/Include \
					-I./Delta/ResourceLoaderLib/Include \
					-I./Delta/DeltaVirtualMachine/Include \
					-I./Delta/DeltaConsoleDebugger/Include \
					-I./Delta/DebugClient/Include \
					-I./Delta/DeltaDebugMessageEncoding/Include \
					-I./Delta/DebugExprEvaluator/Include \
					-I./Delta/DeltaStdLib/Include \
					-I./Delta/DeltaVirtualMachineDebugExtensions/Include \
					-I./Delta/DeltaPureVMFacade/Include \
					-I./Delta/DebugBreakPointHolder/Include \
					-I./Delta/SocketLib/Include \
					-I./Delta/DebugServer/Include \
					-I./Delta/DeltaSyntaxTree/Include \
					-I./Delta/DeltaExtraLibraries/XMLParser/Include \
					-I./DeltaAnsiCompiler/Include \
					-I./DeltaAnsiVMDebug/Include \
					-I./Delta/DeltaExtraLibraries/wxWidgets/Include \
					-I./Delta/DeltaExtraLibraries/JSONParser/Include \
					-D_UNIX_ \
					-DwxSIZE_T_IS_UINT \

LDFLAGS_RELEASE		= $(LDFLAGS_COMMON)
CXXFLAGS_RELEASE	= $(CXXFLAGS_COMMON) -O2
CPPFLAGS_RELEASE	= $(CPPFLAGS_COMMON) $(shell $(WX_WIDGETS)/bin/wx-config --debug=no --unicode=yes --cppflags)

LDFLAGS_DEBUG		= $(LDFLAGS_COMMON)
CXXFLAGS_DEBUG		= $(CXXFLAGS_COMMON) -g -O0
CPPFLAGS_DEBUG		= $(CPPFLAGS_COMMON) -D_DEBUG $(shell $(WX_WIDGETS)/bin/wx-config --debug=yes --unicode=yes --cppflags)

_build/%.cpp.o : %.cpp
	if ! [ -d $(dir $@) ] ; then mkdir --verbose --parent $(dir $@) ; fi
	$(CXX) $(CXXFLAGS_RELEASE) $(CPPFLAGS_RELEASE) -c -MD -MF _build/$*.cpp.d -o $@ $<
_build/%.cpp_d.o : %.cpp
	if ! [ -d $(dir $@) ] ; then mkdir --verbose --parent $(dir $@) ; fi
	$(CXX) $(CXXFLAGS_DEBUG) $(CPPFLAGS_DEBUG) -c -MD -MF _build/$*.cpp_d.d -o $@ $<

all: lib/libdelta.so lib/libxml.so bin/nmdc bin/nmdvm bin/nmdisco lib/libdeltad.so lib/libxmld.so bin/nmdcd bin/nmdvmd bin/nmdiscod lib/libwx.so lib/libwxd.so
clean:
	for d in _build bin lib ; do if [ -d "$$d" ] ; then rm -rv "$$d" ; fi ; done ;
.PHONY: all clean

lib/libdelta.so: $(Objects)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(Objects) $(LDFLAGS_RELEASE)
lib/libxml.so: $(ObjectsXML)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(ObjectsXML) $(LDFLAGS_RELEASE)
lib/libwx.so: $(ObjectsWx)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(ObjectsWx) $(LDFLAGS_RELEASE) -Xlinker --rpath -Xlinker $(shell $(WX_WIDGETS)/bin/wx-config --debug=no --unicode --prefix)/lib $(shell $(WX_WIDGETS)/bin/wx-config --debug=no --unicode --libs)

bin/nmdc: $(ObjectsDeltaCompiler) lib/libdelta.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) $(ObjectsDeltaCompiler) -ldelta -ldl
bin/nmdvm: $(ObjectsDeltaVM) lib/libdelta.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) $(ObjectsDeltaVM) -ldelta -ldl
bin/nmdisco: lib/libdelta.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) -ldelta -ldl



lib/libdeltad.so: $(ObjectsD)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsD) $(LDFLAGS_DEBUG)
lib/libxmld.so: $(ObjectsXMLD)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsXMLD) $(LDFLAGS_DEBUG)
lib/libwxd.so: $(ObjectsWxD)
	if ! [ -d lib ] ; then mkdir --verbose lib ; fi
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsWxD) $(LDFLAGS_DEBUG) -Xlinker --rpath -Xlinker $(shell $(WX_WIDGETS)/bin/wx-config --debug --unicode --prefix)/lib $(shell $(WX_WIDGETS)/bin/wx-config --debug --unicode --libs)

bin/nmdcd: $(ObjectsDeltaCompilerD) lib/libdeltad.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) $(ObjectsDeltaCompilerD) -ldeltad -ldl
bin/nmdvmd: $(ObjectsDeltaVMD) lib/libdeltad.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFLAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) $(ObjectsDeltaVMD) -ldeltad -ldl
bin/nmdiscod: lib/libdeltad.so
	if ! [ -d bin ] ; then mkdir --verbose bin ; fi
	$(CXX) $(CXXFlAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) -ldeltad -ldl


Sources.mk: make_sources.bash
	$(SHELL) make_sources.bash

-include $(Depends)
