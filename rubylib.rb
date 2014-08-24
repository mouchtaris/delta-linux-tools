require 'pp'
require 'find'
require 'fileutils'

module Isi
module LibFuncParser

def self.diagnose_nothing
end
def self.diagnose_something(*args)
	printf('[DIAGNOSTIC] ')
	printf(*args)
	puts
end
def self.diagnose(*args)
	self.diagnose_nothing
end

class Scanner

	def initialize(str)
		@str = str
		@i = 0
	end

	def next_
		skipSpace
		start = @i
		
		while (@i < @str.length && !space?(c = @str[@i .. @i])) do
			@i += 1 
		end
		
		end_ = space?(c)? @i - 1 : @i
		end_ = start if end_ < start
		
		result = @i >= @str.length()? nil : @str[start .. end_]
		result
	end

	def each(&b)
		enum = enum_for(:each_token)
		if block_given?
			enum.each(&b)
		else
			enum
		end
	end

	def each_token
		while (n = next_) != nil do yield n end
	end

	private
	def space?(c)
		c == ' ' || c == "\t" || c== "\n"
	end

	def skipSpace
		done = false
		while !done && @i < @str.length
			c = @str[@i .. @i]
			
			if space?(c)
				@i += 1
			elsif c == '#'
				@i += 1 while @i < @str.length && @str[@i .. @i] != "\n"
			else
				done = true
			end
		end
	end

end # class Scanner

class Namespace
	def initialize; initialize_with([]) end
	def enter(ns); @ns.push(ns) end
	def exit
		raise 'Exiting from the global namespace' if @ns.empty?
		@ns.pop
	end
	def global?; @ns.empty? end
	def initialize_copy(source); @ns = @ns.clone end
	def to_s; @ns.join('::') end
	private
	def initialize_with(ns); @ns = ns end
end # class Namespace

class Symbol
	def initialize(name, value)
		@name = name
		@value = value
	end
	attr_accessor :name, :value, :namespace
end # class Symbol

class SymbolTable
	def initialize
		@symbols = {}
		@namespace = Namespace.new
	end

	def enter (ns); @namespace.enter(ns) end
	def exit; @namespace.exit end

	def insert(name, value)
		symbol = Symbol.new(name, value)
		symbol.namespace = @namespace.clone
		@symbols[symbol] = true
		symbol
	end

	def in_global?; @namespace.global? end
	def namespace; @namespace.to_s end
	def each(&b); @symbols.each(&b) end
	def contains?(id); @symbols.has_key?(id) end
end # class SymbolTable

class Parser
	def initialize
	end

	def parse(str)
		enum = Scanner.new(str).each
		st = SymbolTable.new()
		done = false
		begin
			while !done
				token = enum.next()
				case token
				when '@enter' then
					ns = enum.next()
					Isi::LibFuncParser.diagnose('entering %s', ns)
					st.enter(ns)
				when '@exit' then
					ns = st.exit()
					Isi::LibFuncParser.diagnose('exiting %s', ns)
				when '@const' then
					name = enum.next()
					val = enum.next()
					Isi::LibFuncParser.diagnose('found %s = %s', name, val)
					symbol = st.insert(name, val)
				else
					raise "what the hell? #{token}"
				end
			end
		rescue StopIteration
			done = false
		end
		
		raise "In namespace #{st.namespace} when exiting" if !st.in_global?

		st
	end
end # class Parser

end # module LibFuncParser






###############################################################################
###############################################################################
###############################################################################
###############################################################################
###############################################################################
###############################################################################






module Build

class << self
	def log(who, what)	; puts("[#{who}]: #{what}")	end
	def logsf(what)		; log('Source File', what)	end
end # Build:: self methods

module RX
	Using = /using[\t ]+(\#)?.*;/
	Namespace = /(([ \t\()]|^)(([\w_]+::)+[\w_]+))/
end # module RX

module PathManager
	SRC = 'src'
	DBC = '/tmp/dbc'

	DSC_EXT_NAME = 'dsc'
	DBC_EXT_NAME = 'dbc'

	DSC_EXT = '.' + DSC_EXT_NAME
	DBC_EXT = '.' + DBC_EXT_NAME

	GeneratedMakefileName = 'GeneratedMakefile.mk'
	StandardMakefileName = 'GNUmakefile'
	ExtractApiFilename = 'extractApi.bash'
end # module PathManager

module Consts
	SedColoriserScript = <<'EOS'
		s/^(Started compiling ')([^']+)('.)$$/\1\x1b[1;4m\2\x1b[0m\3/g;
		s/^(Warning)(, file ')([^']+)(', )(line [[:digit:]]+)(.*)$$/\x1b[33;1m\1\x1b[0m\2\x1b[4m\3\x1b[0m\4\x1b[4m\5\x1b[0m\6/g;
		s/^(Finished compiling '[^']+', )([[:digit:]]+ WARNINGS)( reported)$$/\1\x1b[1;33m\2\\x1b[0m\3/g;
		s/^(Error)(, file ')([^']+)(', )(line [[:digit:]]+)(.*)$$/\x1b[31;1m\1\x1b[0m\2\x1b[4m\3\x1b[0m\4\x1b[4m\5\x1b[0m\6/g;
		s/^(Finished compiling '[^']+', )([[:digit:]]+ ERRORS)( reported)$$/\1\x1b[1;31m\2\\x1b[0m\3/g;
EOS

	#SedColoriser = "| sed -r -e '#{SedColoriserScript.gsub('\'', '\'\\\\\'\'').gsub("\n", '')}'"
	#SedColoriser = '| cat'
	SedColoriser = ''

	raise '$DELTA environment variable must be set' unless ENV['DELTA']
	Nmdc = ENV['NMDC'] || ENV['DELTA'] + '/bin/nmdcd'
	Nmdvm = ENV['NMDVM'] || ENV['DELTA'] + '/bin/nmdvmd'
	Del = ENV['DELTA']
	Delex = Del + '/Delta/DeltaExtraLibraries'
	Delexwx = Delex + '/wxWidgets'
	Delexxml = Delex + '/XMLParser'
	Delexcorba = Delex + '/CORBAGateway'

	Nmdccomm = "#{Nmdc} --bytecode-path=#{PathManager::DBC} --debug --functions=./AaduigLibFuncs.txt --functions=#{Delexwx}/WxWidgetsLibFuncs.txt --functions=#{Delexxml}/XMLParserLibFuncs.txt --functions=#{Delexcorba}/CorbaLibfuncs.txt --output-directory=#{PathManager::DBC}"
	Nmdvmcom = "#{Nmdvm} --bytecode-path=#{PathManager::DBC} --dllimport-path=#{Del}/lib "

	MakefileParallelisation = begin if ENV['NUMCPUS'] then "-j #{ENV['NUMCPUS']}" else '' end end
end # module Consts

class Namespaces
	class << self
		def lib?(namespace)
			case namespace
			when 'std'
				true
			when 'wx'
				true
			when 'xml'
				true
			else
				false
			end
		end

		def get_dbc_name(id)
			id.split('::').first
		end
	end # self methods

	def initialize(symbol_table)
		@st = symbol_table
	end

	def dbc?(id)
		id.split('::').length == 2 && !@st.contains?(id)
	end
end # class Namespaces

class SourceFile
	def self.extract_deps(namespaces, text)
		text.
			scan(RX::Namespace).
			map { |el| el[2] }.
			reject { |id| !namespaces.dbc?(id) }.
			map { |id| Namespaces.get_dbc_name(id) }.
			reject { |id| Namespaces.lib?(id) }.
			sort.
			uniq
	end

	def initialize(dir, name)
		@dir = dir
		@name = name
		@deps = []
		Build.logsf "new source file: #{name}"
	end
	attr_reader :deps, :name

	def add_dep(dep)
		@deps << dep
		Build.logsf "added dependency: #{dep}"
	end

	def sourcepath
		@dir + '/' + @name + PathManager::DSC_EXT
	end

	def dbcpath
		PathManager::DBC + '/' + @name + PathManager::DBC_EXT
	end

	def read
		fullpath = @dir + '/' + @name + '.dsc'

		text = File.read(fullpath)
	end

	def rewrite(namespaces)
		fullpath = @dir + '/' + @name + '.dsc'

		text = File.read(fullpath)
		@deps = SourceFile.extract_deps(namespaces, text)
		text.gsub!(RX::Using, '')
		text.strip!

		using = 'using #'
		usingLength = using.length

		File.open(fullpath, File::WRONLY | File::TRUNC) { |fout|
			unless @deps.empty? then 
				len = @deps.map(&:length).max + usingLength
				mod = len.modulo(4)
				len += mod == 0? 0 : 4 - mod

				for dep in @deps do
					lendiff = len - dep.length - usingLength
					fulltabs = lendiff / 4
					extratab = lendiff.modulo(4) > 0? 1 : 0
					fout.puts(sprintf('using #%s%s;', dep, "\t" * (fulltabs + extratab)))
					Build.log("File-rewriting(#{@name})", dep)
				end

				fout.puts
			end
			fout.puts(text)
		}
	end
end # class SourceFile

class Main
	include FileUtils::Verbose

	def initialize
		@sources = nil
		@namespaces = nil
		@sources_rewritten = false
		@directories_setup = false
	end
	attr_reader :sources

	def parse_libfuncs
		if @namespaces.nil? then
			@namespaces = Namespaces.new(LibFuncParser::Parser.new.parse(File.read('AaduigLibFuncs.txt')))
		end
		@namespaces
	end

	def find_sources
		if @sources.nil? then
			@sources = {}
			sourceadder = lambda { |file|
				if (File.lstat(file).symlink?)
					Find.find(file + '/', &sourceadder)
				elsif file.end_with? '.dsc' then
					dirname = File.dirname(file)
					symbolic = File.basename(file, PathManager::DSC_EXT)

					source = SourceFile.new(dirname, symbolic)
					@sources[source.name] = source
				end
			}
			Find.find('.', &sourceadder)
		end
		@sources
	end # find_sources()

	def rewrite_sources
		find_sources
		parse_libfuncs

		unless @sources_rewritten then
			@sources_rewritten = true
			for name, source in @sources do
				source.rewrite(@namespaces)
			end
		end
	end # reqrite_sources()

	def setup_directories
		unless @directories_setup then
			@directories_setup = true
			rm_r PathManager::DBC if File.directory? PathManager::DBC
			mkdir PathManager::DBC
		end
	end # setup_directories()

	def generate_generated_makefile
		rewrite_sources
		setup_directories

		File.open(PathManager::GeneratedMakefileName, IO::WRONLY | IO::TRUNC | IO::CREAT) { |fout|
			# all: (nothing)
			fout.puts('all:')

			for source in @sources.each_value do
				fout.printf('%s: %s %s', source.dbcpath, (false ? PathManager::DBC : ''), source.sourcepath)
				for dep in source.deps do
					raise "what is this? #{dep}" unless @sources[dep]
					fout.printf(' %s', @sources[dep].dbcpath)
				end
				fout.printf('%1$s	@%2$s --symbolic-name=\'%3$s\' --icode --text %3$s 2>&1%4$s%1$s',
						"\n", Consts::Nmdccomm, source.sourcepath, Consts::SedColoriser)
			end

			fout.printf('%1$s:%2$s	mkdir -v %1$s%2$s', PathManager::DBC, "\n")
		}
	end # generate_generated_makefile()

	def generate_standard_makefile
		File.open(PathManager::StandardMakefileName, IO::CREAT | IO::WRONLY | IO::TRUNC) { |fout|
			# all: GeneratedMakefile
			fout.printf('all: %1$s%2$s	${MAKE} %3$s --no-keep-going --makefile %1$s %4$s/test.dbc%2$s', PathManager::GeneratedMakefileName, "\n", Consts::MakefileParallelisation, PathManager::DBC)

			# GeneratedMakefile: thisScript
			fout.printf('%1$s: %2$s%3$s	ruby -I. -r rubylib -e \'m=Isi::Build::Main.new;Isi::Scripts::Generator.new(m).write_extractApi(File.open("extractApi.bash", File::WRONLY|File::TRUNC|File::CREAT));m.generate_makefiles\'%3$s', PathManager::GeneratedMakefileName, __FILE__, "\n")
			#
			# clean:
			#	remove _build, lib, bin and scripts
			fout.printf('clean:%1$s	if [ -f %2$s ]; then rm -v %2$s; fi;   if [ -d bin ]; then rm -rv bin; fi;   if [ -d lib ]; then rm -rv lib; fi;   if [ -d \'%3$s\' ] ; then rm -rv \'%3$s\' ; fi;    if [ -f %3$s ] ; then rm -rv %3$s ; fi    %1$s', "\n", PathManager::GeneratedMakefileName, PathManager::DBC, PathManager::ExtractApiFilename)

			# run: main_runner.dbc
			fout.printf('run: %1$s	${MAKE} %2$s --no-keep-going --makefile %3$s %4$s/main_runner.dbc%1$s	%5$s --main=%4$s/main_runner.dbc%1$s', "\n", Consts::MakefileParallelisation, PathManager::GeneratedMakefileName, PathManager::DBC, Consts::Nmdvmcom);
			# test: test.dbc
			fout.printf('test: %1$s	${MAKE} %2$s --no-keep-going --makefile %3$s %4$s/test.dbc%1$s	%5$s --main=%4$s/test.dbc%1$s', "\n", Consts::MakefileParallelisation, PathManager::GeneratedMakefileName, PathManager::DBC, Consts::Nmdvmcom);
			# bugs: bugs.dbc
			fout.printf('bugs: %1$s	${MAKE} %2$s --no-keep-going --makefile %3$s %4$s/bugs.dbc%1$s	%5$s --main=%4$s/bugs.dbc%1$s', "\n", Consts::MakefileParallelisation, PathManager::GeneratedMakefileName, PathManager::DBC, Consts::Nmdvmcom);
			# api: api.dbc
			fout.printf('api: %1$s	${MAKE} %2$s --no-keep-going --makefile %3$s %4$s/api.dbc%1$s	%5$s --main=%4$s/api.dbc%1$s', "\n", Consts::MakefileParallelisation, PathManager::GeneratedMakefileName, PathManager::DBC, Consts::Nmdvmcom);

			# regen
			#	make Generated
			fout.printf('regen: clean %1$s%2$s', PathManager::GeneratedMakefileName, "\n")

			# PHONY
			fout.printf('.PHONY: all clean run regen api test%s', "\n")
		}
	end # generate_standard_makefile

	def generate_makefiles
		generate_generated_makefile
		generate_standard_makefile
	end # generate_makefiles()
end # class Main

end # module Build






###############################################################################
###############################################################################
###############################################################################
###############################################################################
###############################################################################
###############################################################################






module Scripts
	ExtractApi = <<'EOS2'

cat >src/api.dsc <<'EOS'
using #aaduig_u_objects	;
using #aaduig_u_linq	;
using #aaduig_u_vectors	;

const PRE = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"
   \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">
<html>
	<head>
		<meta http-equiv=\"Content-type\" content=\"application/xhtml+xml;charset=UTF-8\" />
		<title> yo </title>
		<style type=\"text/css\" media=\"all\">
		<!--
			body {
				background-color: #101010;
				font-family: sans-serif;
				font-size: 11px;
				color: #a0a0a0;
			}

			#index,
			.functions,
			.constants {
				padding: 0;
				margin: 1em;
			}

			#index { width: 15%; }
			.functions,
			.constants {
				width: 80%;
				left: 16%;
				position: relative;
			}

			#index {
				list-style-type: none;
				direction: rtl;
				position: fixed;
				height: 80%;
				overflow-y: auto;
			}
			#index > li {
				margin: .3em 0;
				width: 90%;
				position: relative;
			}
			#index > li > a {
				display: block;
				width: 100%;
				border: .1em solid #281828;
				background-color: #180818;
				color: #581858;
				text-decoration: none;
				padding: .3em;
				overflow: hidden;
				position: relative;
			}
			#index > li > a:hover {
				background-color: #181018;
				color: #731F73;
			}

			.functions,
			.constants {
				font-family: monospace;
				border-collapse: collapse;
				border: 1px solid #505050;
			}

			.functions td,
			.functions th,
			.constants td,
			.constants th {
				padding: .3em;
				border-width: 1px;
				border-style: solid;
				border-color: #404040;
			}

			.name {
				background-color: #181810;
			}

			.args {
				font-size: .8em;
			}

			.constants > tbody > tr > td.name > span.namespace {
				font-size: .8em;
			}

			.constants > tbody > tr > td.name > span.name {
				font-weight: bold;
				font-size: 1.2em;
				letter-spacing: .1em;
			}

			.constants > tbody > tr > td.value {
				font-size: .7em;
			}

			.constants > tbody > tr > td.name {
			}
		-->
		</style>
	</head>
";

const AFTER = "
	</body>
</html>
";

print = [
	method @operator () (...) {
		foreach (local arg, arguments) {
			local strarg = std::tostring(arg);
			@buffer += strarg;
			std::print(strarg);
		}
	},
	method init {
		@buffer = "";
	},
	method cleanup {
		std::strsavetofile(@buffer, "API.html");
		@buffer = nil;
	}
];

function local toTable (modules) {
	local funcs =
		aaduig_u_vectors::exchangeDimensions(
			aaduig_u_linq::cache(
				aaduig_u_linq::select(modules, lambda (module) { aaduig_u_linq::cache(module.funcs, aaduig_u_vectors::vector_new(0)) }),
				aaduig_u_vectors::vector_new(0)
				)
			);

	return [
		@modules: modules,
		@funcs: funcs
	];
}

function local renderFuncs (funcsVector, modules) {
	foreach (local funcs, funcsVector) {
		::print("\n<tr>");
		foreach (local pair, aaduig_u_linq::parallel(funcs, modules)) {
			local func = pair[0];
			local module = pair[1];
			local moduleName = module..name;
			local name = "";
			local args = "";
			if (not std::isundefined(func) and not std::isnil(func)) {
				name = func.name;
				args = func.args;
			}
			::print(
				"\n\t<td class=\"name module_", moduleName, "\">",
				name,
				"</td><td class=\"args module_", moduleName, "\">",
				args, "</td>");
		}
		::print("\n</tr>");
	}
}

function local render (table) {
	::print("<tr>");
	foreach (local head, table..modules)
		::print("\n\t<th colspan=\"2\" id=\"", head..name ,"\" class=\"module_", head..name ,"\">", head..name, "</th>");
	::print("\n</tr>");

	::renderFuncs(table..funcs, table..modules);
}

function local renderIndex (modules) {
	::print("\n\t<ul id=\"index\">");
	foreach (local module, modules)
		::print("\n\t\t<li><a href=\"#", module..name ,"\">", module..name, "</a></li>");
	::print("\n\t</ul>");
}

function local renderTables (modules) {
	::print("\n\t<table class=\"functions\">\n\t\t<tbody>");
	foreach (local modules, aaduig_u_linq::slice(modules, 4))
		::render(::toTable(modules));
	::print("\n\t\t</tbody>\n\t</table>");
}

function Const (ns, name, value) {
	return [
		@ns: ns,
		@name: name,
		@value: value
	];
}

function renderConsts (consts) {
	::print("\n\t<table class=\"constants\">\n\t\t<tbody>");
	foreach (local konst, consts)
		if (konst)
			::print("\n\t\t\t<tr>",
				"\n\t\t\t\t<td class=\"name\">",
				"\n\t\t\t\t\t<span class=\"namespace\">", konst.ns, "</span>",
				"\n\t\t\t\t\t<span class=\"name\">", konst.name, "</span>",
				"\n\t\t\t\t</td>",
				"\n\t\t\t\t<td class=\"value\">", konst.value, "</td>",
				"\n\t\t\t</tr>");
	::print("\n\t\t</tbody>\n\t</table>");
}

function main {

	moduleManager = [
		@modules: std::list_new(),
		method Module (name) {
			local funcs = std::list_new();

			local result = [
				@funcs: funcs,
				.name: name,
				method addFunction (func) {
					std::list_push_back(@funcs, func);
				}
			];
			std::list_push_back(@modules, result);
			return result;
		}
	];
	local Module = moduleManager.Module;
EOS

for file in "${sources[@]}"
do
	printf '\n\t{\n\t\tlocal module = Module("%s");\n' $file >>src/api.dsc
	sed -r -n -e 's/^function[[:space:]]+([a-zA-Z0-9_]+)[[:space:]]*(\(.*\)).*/\t\tmodule.addFunction([.name: \"\1\", .args: \"\2\"]);/p' src/aaduig_$file.dsc >>src/api.dsc
	printf '\t}\n' >>src/api.dsc
done

printf '\n\tlocal consts = std::list_new(' >>src/api.dsc
ruby -r rubylib -e 'Isi::LibFuncParser::Parser.new().parse(STDIN.read).each.map { |pair|
		sym = pair.first
		sprintf("\n\t\tConst(\"%s\", \"%s\", %s),", sym.namespace, sym.name, sym.value)
	}.sort.each { |s| print(s) }' <AaduigLibFuncs.txt >>src/api.dsc
printf '\n\t\tfalse);\n' >>src/api.dsc

cat >>src/api.dsc <<EOS
	::print.init();

	::print(PRE);
	{
		local modules = moduleManager.modules;
		::renderIndex(modules);
		::renderTables(modules);
	}
	::renderConsts(consts);
	::print(AFTER);

	::print.cleanup();
}
::main();
EOS

make api

EOS2

class Generator
	def initialize(build_main)
		@build_main = build_main
	end

	def write_extractApi(outs)
		outs.puts("#!/bin/bash\n\nsources=( \\")
		@build_main.
			find_sources.
			map(&:first).
			reject { |source| /^aaduig_/ !~ source }.
			map { |source| source.gsub(/^aaduig_/, '') }.
			sort.
			each { |name| 
				outs.puts(sprintf('		%s \\', name))
			}
		outs.puts('	)')

		outs.puts(ExtractApi)
	end # write_extractApi

end # class Generator
end # module Scripts

end # module Isi