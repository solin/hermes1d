# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.6

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canoncical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pavel/hermes1d

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pavel/hermes1d

# Include any dependencies generated for this target.
include examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/depend.make

# Include the progress variables for this target.
include examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/progress.make

# Include the compile flags for this target's objects.
include examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/flags.make

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o: examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/flags.make
examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o: examples/laplace_bc_dirichlet/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pavel/hermes1d/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o"
	cd /home/pavel/hermes1d/examples/laplace_bc_dirichlet && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o -c /home/pavel/hermes1d/examples/laplace_bc_dirichlet/main.cpp

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.i"
	cd /home/pavel/hermes1d/examples/laplace_bc_dirichlet && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pavel/hermes1d/examples/laplace_bc_dirichlet/main.cpp > CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.i

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.s"
	cd /home/pavel/hermes1d/examples/laplace_bc_dirichlet && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pavel/hermes1d/examples/laplace_bc_dirichlet/main.cpp -o CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.s

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.requires:
.PHONY : examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.requires

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.provides: examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.requires
	$(MAKE) -f examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/build.make examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.provides.build
.PHONY : examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.provides

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.provides.build: examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o
.PHONY : examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.provides.build

# Object files for target laplace_bc_dirichlet
laplace_bc_dirichlet_OBJECTS = \
"CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o"

# External object files for target laplace_bc_dirichlet
laplace_bc_dirichlet_EXTERNAL_OBJECTS =

examples/laplace_bc_dirichlet/laplace_bc_dirichlet: examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o
examples/laplace_bc_dirichlet/laplace_bc_dirichlet: src/libhermes1d.so
examples/laplace_bc_dirichlet/laplace_bc_dirichlet: /usr/lib/libumfpack.so
examples/laplace_bc_dirichlet/laplace_bc_dirichlet: /usr/lib/libamd.so
examples/laplace_bc_dirichlet/laplace_bc_dirichlet: /usr/lib/libblas.so
examples/laplace_bc_dirichlet/laplace_bc_dirichlet: examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/build.make
examples/laplace_bc_dirichlet/laplace_bc_dirichlet: examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable laplace_bc_dirichlet"
	cd /home/pavel/hermes1d/examples/laplace_bc_dirichlet && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/laplace_bc_dirichlet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/build: examples/laplace_bc_dirichlet/laplace_bc_dirichlet
.PHONY : examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/build

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/requires: examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/main.cpp.o.requires
.PHONY : examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/requires

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/clean:
	cd /home/pavel/hermes1d/examples/laplace_bc_dirichlet && $(CMAKE_COMMAND) -P CMakeFiles/laplace_bc_dirichlet.dir/cmake_clean.cmake
.PHONY : examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/clean

examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/depend:
	cd /home/pavel/hermes1d && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pavel/hermes1d /home/pavel/hermes1d/examples/laplace_bc_dirichlet /home/pavel/hermes1d /home/pavel/hermes1d/examples/laplace_bc_dirichlet /home/pavel/hermes1d/examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/laplace_bc_dirichlet/CMakeFiles/laplace_bc_dirichlet.dir/depend
