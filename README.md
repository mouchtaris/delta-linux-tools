# Delta-Linux Tools

This is the toolchain that is used to build the [Delta language](http://www.ics.forth.gr/hci/files/plang/Delta/Delta.html) for UNIX/Linux systems.

This project is not a complete port of windows generated tools in Linux. Instead, it attempts to offer a UNIX/Linux philosophy toolchain for the Delta language.

The tools included in this project, the source code modifications required and the custom tool source code are all written and maintained by Nikos Mouchtaris <mouchtaris@gmail.com>.

## Building

Building the delta tools should be (relatively) easy and automated. If there are any problems, please report it as an issue or submit a pull request.

The tools required for the building process are:
- GNU GCC
- GNU Make
- Xz
- WxWidgets (2.8 or 2.9)
- Mutlilib development tools
- CCache (optional but highly recommended)

For example, in arch linux, these can be installed by
`pacman -S gcc-multilib make xz lib32-wxgtk2.8 multilib-devel`

In the instructions below it is assumed that:
* `#{delta}` is the absolute directory name where the delta-linux flavour source code is checked out
* `#{tools}` is the absolute directory name where the delta-linux-tool scripts are checked out
* `#{build}` is the absolute directory name where the building output will be placed (intermediate files and actual tools both)
```
git clone https://github.com/mouchtaris/delta-linux-tools.git ${tools} &&
git clone https://github.com/mouchtaris/delta-linux.git ${delta} &&
cd ${delta} && git checkout linux &&
cd ${tools} && bash make_workdir.bash ${build} ${delta} &&
cd ${build} && source env.bash &&
make -j _CPUS_
```

This whole setup process (everything except for the last `source` and `make` commands) can be also automated like:
```
git clone https://github.com/mouchtaris/delta-linux-tools.git ${tools} &&
cd ${tools} && bash setup.bash ${build} ${delta}
```

## Not using CCache
In order to not use `ccache`, you should export and set the `CXX` environment variable to `g++` or something similar before running `make`.

## Using CCache
It is really *HIGHLY* recommended to use ccache. The source code uses a lot of headers, a lot of preprocessor macros and a lot of templates. The result is that compilation is very slow, especially because the same thousands of lines of headers are included again and again in tons of different source files.

Using ccache makes re-building after an update run in humane time.

## CCache tips
After building with ccache, you need only store the `_ccache` directory for later builds.

When updating or building from scratch, simple move the stored `_ccache` directory into the `${build}` directory and remember to source `env.bash` before building. Ccache will eliminate all redundant recompilations and make experimentation and update rebuilds possible.


