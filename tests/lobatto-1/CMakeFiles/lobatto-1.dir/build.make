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
include tests/lobatto-1/CMakeFiles/lobatto-1.dir/depend.make

# Include the progress variables for this target.
include tests/lobatto-1/CMakeFiles/lobatto-1.dir/progress.make

# Include the compile flags for this target's objects.
include tests/lobatto-1/CMakeFiles/lobatto-1.dir/flags.make

tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o: tests/lobatto-1/CMakeFiles/lobatto-1.dir/flags.make
tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o: tests/lobatto-1/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/pavel/hermes1d/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o"
	cd /home/pavel/hermes1d/tests/lobatto-1 && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lobatto-1.dir/main.cpp.o -c /home/pavel/hermes1d/tests/lobatto-1/main.cpp

tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lobatto-1.dir/main.cpp.i"
	cd /home/pavel/hermes1d/tests/lobatto-1 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/pavel/hermes1d/tests/lobatto-1/main.cpp > CMakeFiles/lobatto-1.dir/main.cpp.i

tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lobatto-1.dir/main.cpp.s"
	cd /home/pavel/hermes1d/tests/lobatto-1 && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/pavel/hermes1d/tests/lobatto-1/main.cpp -o CMakeFiles/lobatto-1.dir/main.cpp.s

tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.requires:
.PHONY : tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.requires

tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.provides: tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.requires
	$(MAKE) -f tests/lobatto-1/CMakeFiles/lobatto-1.dir/build.make tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.provides.build
.PHONY : tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.provides

tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.provides.build: tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o
.PHONY : tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.provides.build

# Object files for target lobatto-1
lobatto__1_OBJECTS = \
"CMakeFiles/lobatto-1.dir/main.cpp.o"

# External object files for target lobatto-1
lobatto__1_EXTERNAL_OBJECTS =

tests/lobatto-1/lobatto-1: tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o
tests/lobatto-1/lobatto-1: src/libhermes1d.so
tests/lobatto-1/lobatto-1: /usr/lib/libumfpack.so
tests/lobatto-1/lobatto-1: /usr/lib/libamd.so
tests/lobatto-1/lobatto-1: /usr/lib/libblas.so
tests/lobatto-1/lobatto-1: tests/lobatto-1/CMakeFiles/lobatto-1.dir/build.make
tests/lobatto-1/lobatto-1: tests/lobatto-1/CMakeFiles/lobatto-1.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable lobatto-1"
	cd /home/pavel/hermes1d/tests/lobatto-1 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lobatto-1.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/lobatto-1/CMakeFiles/lobatto-1.dir/build: tests/lobatto-1/lobatto-1
.PHONY : tests/lobatto-1/CMakeFiles/lobatto-1.dir/build

tests/lobatto-1/CMakeFiles/lobatto-1.dir/requires: tests/lobatto-1/CMakeFiles/lobatto-1.dir/main.cpp.o.requires
.PHONY : tests/lobatto-1/CMakeFiles/lobatto-1.dir/requires

tests/lobatto-1/CMakeFiles/lobatto-1.dir/clean:
	cd /home/pavel/hermes1d/tests/lobatto-1 && $(CMAKE_COMMAND) -P CMakeFiles/lobatto-1.dir/cmake_clean.cmake
.PHONY : tests/lobatto-1/CMakeFiles/lobatto-1.dir/clean

tests/lobatto-1/CMakeFiles/lobatto-1.dir/depend:
	cd /home/pavel/hermes1d && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pavel/hermes1d /home/pavel/hermes1d/tests/lobatto-1 /home/pavel/hermes1d /home/pavel/hermes1d/tests/lobatto-1 /home/pavel/hermes1d/tests/lobatto-1/CMakeFiles/lobatto-1.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/lobatto-1/CMakeFiles/lobatto-1.dir/depend

