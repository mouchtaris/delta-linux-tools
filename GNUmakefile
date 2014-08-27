# vim: ts=4
ifeq (${WXCONFIG},)
WXCONFIG=$(shell which wx-config)
endif
ifeq ($(XZ),)
XZ=xz
endif

include Sources.mk

OutBinDir             := bin
OutLibDir             := lib
OutBuildDir           := _build

Objects               := $(foreach Source, $(Sources), ${OutBuildDir}/$(Source).o)
ObjectsWx             := $(foreach Source, $(SourcesWx), ${OutBuildDir}/$(Source).o)
ObjectsXML            := $(foreach Source, $(SourcesXML), ${OutBuildDir}/$(Source).o)
ObjectsDeltaCompiler  := $(foreach Source, $(SourcesDeltaCompiler), ${OutBuildDir}/$(Source).o)
ObjectsDeltaVM        := $(foreach Source, $(SourcesDeltaVM), ${OutBuildDir}/$(Source).o)

ObjectsD              := $(foreach Source, $(Sources), ${OutBuildDir}/$(Source)_d.o)
ObjectsWxD            := $(foreach Source, $(SourcesWx), ${OutBuildDir}/$(Source)_d.o)
ObjectsXMLD           := $(foreach Source, $(SourcesXML), ${OutBuildDir}/$(Source)_d.o)
ObjectsDeltaCompilerD := $(foreach Source, $(SourcesDeltaCompiler), ${OutBuildDir}/$(Source)_d.o)
ObjectsDeltaVMD       := $(foreach Source, $(SourcesDeltaVM), ${OutBuildDir}/$(Source)_d.o)

Preprocessed               := $(foreach source, ${Sources}, ${OutBuildDir}/${source}.ii.xz)
PreprocessedWx             := $(foreach source, ${SourcesWx}, ${OutBuildDir}/${source}.ii.xz)
PreprocessedXML            := $(foreach source, ${SourcesXML}, ${OutBuildDir}/${source}.ii.xz)
PreprocessedDeltaCompiler  := $(foreach source, ${SourcesDeltaCompiler}, ${OutBuildDir}/${source}.ii.xz)
PreprocessedDeltaVM        := $(foreach source, ${SourcesDeltaVM}, ${OutBuildDir}/${source}.ii.xz)

PreprocessedD              := $(foreach source, ${Sources}, ${OutBuildDir}/${source}_d.ii.xz)
PreprocessedWxD            := $(foreach source, ${SourcesWx}, ${OutBuildDir}/${source}_d.ii.xz)
PreprocessedXMLD           := $(foreach source, ${SourcesXML}, ${OutBuildDir}/${source}_d.ii.xz)
PreprocessedDeltaCompilerD := $(foreach source, ${SourcesDeltaCompiler}, ${OutBuildDir}/${source}_d.ii.xz)
PreprocessedDeltaVMD       := $(foreach source, ${SourcesDeltaVM}, ${OutBuildDir}/${source}_d.ii.xz)

AllPreprocessed := \
	${Preprocessed} \
	${PreprocessedWx} \
	${PreprocessedXML} \
	${PreprocessedDeltaCompiler} \
	${PreprocessedDeltaVM} \
	${PreprocessedD} \
	${PreprocessedWxD} \
	${PreprocessedXMLD} \
	${PreprocessedDeltaCompilerD} \
	${PreprocessedDeltaVMD} \

AllObjects := \
	${Objects} \
	${ObjectsWx} \
	${ObjectsXML} \
	${ObjectsDeltaCompiler} \
	${ObjectsDeltaVM} \
	${ObjectsD} \
	${ObjectsWxD} \
	${ObjectsXMLD} \
	${ObjectsDeltaCompilerD} \
	${ObjectsDeltaVMD} \

Dirs                  := $(foreach object, ${Objects}, $(dir ${object}))
DirsWx                := $(foreach object, ${ObjectsWx}, $(dir ${object}))
DirsXML               := $(foreach object, ${ObjectsXML}, $(dir ${object}))
DirsDeltaCompiler     := $(foreach object, ${ObjectsDeltaCompiler}, $(dir ${object}))
DirsDeltaVM           := $(foreach object, ${ObjectsDeltaVM}, $(dir ${object}))
AllDirs               := $(sort ${Dirs} ${DirsWx} ${DirsXML} ${DirsDeltaCompiler} ${DirsDeltaVM} \
                           ${OutBinDir} ${OutLibDir} )

Depends := \
			$(Objects:.o=.d) $(ObjectsWx:.o=.d) $(ObjectsXML:.o=.d) $(ObjectsDeltaCompiler:.o=.d) $(ObjectsDeltaVM:.o=.d)	\
			$(ObjectsD:.o=.d) $(ObjectsWxD:.o=.d) $(ObjectsXMLD:.o=.d) $(ObjectsDeltaCompilerD:.o=.d) $(ObjectsDeltaVMD:.o=.d)

LDFLAGS_COMMON  := -m32 -Xlinker --rpath -Xlinker $(PWD)/lib -rdynamic -L$(PWD)/lib
CXXFLAGS_COMMON := -std=c++1y -pedantic -pthread -m32 -pipe
CPPFLAGS_COMMON :=	$(foreach Module, \
					FileReadersLib \
					DebugLib \
					DeltaDebugLoader \
					DebugWatchValueInfo \
					Common \
					UtilLib \
					DeltaCompiler \
					DeltaDebuggedVMFacade \
					ResourceLoaderLib \
					DeltaVirtualMachine \
					DeltaConsoleDebugger \
					DebugClient \
					DeltaDebugMessageEncoding \
					DebugExprEvaluator \
					DeltaStdLib \
					DeltaVirtualMachineDebugExtensions \
					DeltaPureVMFacade \
					DebugBreakPointHolder \
					SocketLib \
					DebugServer \
					DeltaSyntaxTree \
					, -IDelta/${Module}/Include ) \
					 \
					-IDeltaAnsiCompiler/Include \
					-IDeltaAnsiVMDebug/Include \
					\
					$(foreach extra, \
					wxWidgets \
					JSONParser \
					XMLParser \
					, -IDelta/DeltaExtraLibraries/${extra}/Include ) \
					\
					-D_UNIX_ \

LDFLAGS_RELEASE		:= $(LDFLAGS_COMMON)
CXXFLAGS_RELEASE	:= $(CXXFLAGS_COMMON) -O2
CPPFLAGS_RELEASE	:= $(CPPFLAGS_COMMON) $(shell ${WXCONFIG} --debug=no --unicode=yes --cppflags)

LDFLAGS_DEBUG		:= $(LDFLAGS_COMMON)
CXXFLAGS_DEBUG		:= $(CXXFLAGS_COMMON) -g -O0
CPPFLAGS_DEBUG		:= $(CPPFLAGS_COMMON) -D_DEBUG $(shell ${WXCONFIG} --unicode=yes --cppflags)

${OutBuildDir}/%.cpp.ii.xz : %.cpp
	$(CXX) $(CXXFLAGS_RELEASE) $(CPPFLAGS_RELEASE) -E -MD -MF ${OutBuildDir}/$*.cpp.d -o- $< | \
	$(XZ) > $@
${OutBuildDir}/%.cpp.o : %.cpp
	$(CXX) $(CXXFLAGS_RELEASE) $(CPPFLAGS_RELEASE) -c -MD -MF ${OutBuildDir}/$*.cpp.d -o $@ $<
${OutBuildDir}/%.cpp_d.ii.xz : %.cpp
	$(CXX) $(CXXFLAGS_DEBUG) $(CPPFLAGS_DEBUG) -E -MD -MF ${OutBuildDir}/$*.cpp_d.d -o- $< | \
	$(XZ) > $@
${OutBuildDir}/%.cpp_d.o : %.cpp
	$(CXX) $(CXXFLAGS_DEBUG) $(CPPFLAGS_DEBUG) -c -MD -MF ${OutBuildDir}/$*.cpp_d.d -o $@ $<

all: dirs \
     bin/nmdc \
     bin/nmdvm \
     bin/nmdisco \
     lib/libwx.so \
     lib/libxml.so \
     \
     bin/nmdcd \
     bin/nmdvmd \
     bin/nmdiscod \
     lib/libwxd.so \
     lib/libxmld.so \

dirs: ${AllDirs}
preprocessed: _allprepro.tar
	tar xvf _allprepro.tar
_allprepro.tar: ${AllPreprocessed}
	tar cvf $@ $^
objects: ${AllObjects}
clean: _allprepro.tar
	rm -rvf ${OutBuildDir} ${OutBinDir} ${OutLibDir}
.PHONY: all dirs preprocessed clean objects


lib/libdelta.so: $(Objects)
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(Objects) $(LDFLAGS_RELEASE)
lib/libxml.so: $(ObjectsXML)
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(ObjectsXML) $(LDFLAGS_RELEASE)
lib/libwx.so: $(ObjectsWx)
	$(CXX) $(CXXFLAGS_RELEASE) --shared -o $@ $(ObjectsWx) $(LDFLAGS_RELEASE) -Xlinker --rpath -Xlinker $(shell ${WXCONFIG} --unicode --prefix)/lib $(shell ${WXCONFIG} --unicode --libs)

bin/nmdc: $(ObjectsDeltaCompiler) lib/libdelta.so
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) $(ObjectsDeltaCompiler) -ldelta -ldl
bin/nmdvm: $(ObjectsDeltaVM) lib/libdelta.so
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) $(ObjectsDeltaVM) -ldelta -ldl
bin/nmdisco: lib/libdelta.so
	$(CXX) $(CXXFLAGS_RELEASE) -o $@ $(LDFLAGS_RELEASE) -ldelta -ldl



lib/libdeltad.so: $(ObjectsD)
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsD) $(LDFLAGS_DEBUG)
lib/libxmld.so: $(ObjectsXMLD)
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsXMLD) $(LDFLAGS_DEBUG)
lib/libwxd.so: $(ObjectsWxD)
	$(CXX) $(CXXFLAGS_DEBUG) --shared -o $@ $(ObjectsWxD) $(LDFLAGS_DEBUG) -Xlinker --rpath -Xlinker $(shell ${WXCONFIG} --unicode --prefix)/lib $(shell ${WXCONFIG} --unicode --libs)

bin/nmdcd: $(ObjectsDeltaCompilerD) lib/libdeltad.so
	$(CXX) $(CXXFLAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) $(ObjectsDeltaCompilerD) -ldeltad -ldl
bin/nmdvmd: $(ObjectsDeltaVMD) lib/libdeltad.so
	$(CXX) $(CXXFLAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) $(ObjectsDeltaVMD) -ldeltad -ldl
bin/nmdiscod: lib/libdeltad.so
	$(CXX) $(CXXFlAGS_DEBUG) -o $@ $(LDFLAGS_DEBUG) -ldeltad -ldl



Sources.mk: make_sources.bash
	$(SHELL) make_sources.bash

${AllDirs}:
	mkdir --verbose --parent $@

-include $(Depends)
