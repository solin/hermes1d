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
include examples/system_chaotic/CMakeFiles/system_chaotic.dir/depend.make

# Include the progress variables for this target.
include examples/system_chaotic/CMakeFiles/system_chaotic.dir/progress.make

# Include the compile flags for this target's objects.
include examples/system_chaotic/CMakeFiles/system_chaotic.dir/flags.make

examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o: examples/system_chaotic/CMakeFiles/system_chaotic.dir/flags.make
examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o: examples/system_chaotic/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pavel/hermes1d/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o"
	cd /home/pavel/hermes1d/examples/system_chaotic && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/system_chaotic.dir/main.cpp.o -c /home/pavel/hermes1d/examples/system_chaotic/main.cpp

examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/system_chaotic.dir/main.cpp.i"
	cd /home/pavel/hermes1d/examples/system_chaotic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pavel/hermes1d/examples/system_chaotic/main.cpp > CMakeFiles/system_chaotic.dir/main.cpp.i

examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/system_chaotic.dir/main.cpp.s"
	cd /home/pavel/hermes1d/examples/system_chaotic && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pavel/hermes1d/examples/system_chaotic/main.cpp -o CMakeFiles/system_chaotic.dir/main.cpp.s

examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.requires:
.PHONY : examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.requires

examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.provides: examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.requires
	$(MAKE) -f examples/system_chaotic/CMakeFiles/system_chaotic.dir/build.make examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.provides.build
.PHONY : examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.provides

examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.provides.build: examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o
.PHONY : examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.provides.build

# Object files for target system_chaotic
system_chaotic_OBJECTS = \
"CMakeFiles/system_chaotic.dir/main.cpp.o"

# External object files for target system_chaotic
system_chaotic_EXTERNAL_OBJECTS =

examples/system_chaotic/system_chaotic: examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o
examples/system_chaotic/system_chaotic: src/libhermes1d.so
examples/system_chaotic/system_chaotic: /usr/lib/libumfpack.so
examples/system_chaotic/system_chaotic: /usr/lib/libamd.so
examples/system_chaotic/system_chaotic: /usr/lib/libblas.so
examples/system_chaotic/system_chaotic: examples/system_chaotic/CMakeFiles/system_chaotic.dir/build.make
examples/system_chaotic/system_chaotic: examples/system_chaotic/CMakeFiles/system_chaotic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable system_chaotic"
	cd /home/pavel/hermes1d/examples/system_chaotic && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/system_chaotic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/system_chaotic/CMakeFiles/system_chaotic.dir/build: examples/system_chaotic/system_chaotic
.PHONY : examples/system_chaotic/CMakeFiles/system_chaotic.dir/build

examples/system_chaotic/CMakeFiles/system_chaotic.dir/requires: examples/system_chaotic/CMakeFiles/system_chaotic.dir/main.cpp.o.requires
.PHONY : examples/system_chaotic/CMakeFiles/system_chaotic.dir/requires

examples/system_chaotic/CMakeFiles/system_chaotic.dir/clean:
	cd /home/pavel/hermes1d/examples/system_chaotic && $(CMAKE_COMMAND) -P CMakeFiles/system_chaotic.dir/cmake_clean.cmake
.PHONY : examples/system_chaotic/CMakeFiles/system_chaotic.dir/clean

examples/system_chaotic/CMakeFiles/system_chaotic.dir/depend:
	cd /home/pavel/hermes1d && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pavel/hermes1d /home/pavel/hermes1d/examples/system_chaotic /home/pavel/hermes1d /home/pavel/hermes1d/examples/system_chaotic /home/pavel/hermes1d/examples/system_chaotic/CMakeFiles/system_chaotic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/system_chaotic/CMakeFiles/system_chaotic.dir/depend

