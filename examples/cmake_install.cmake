# Install script for directory: /home/pavel/hermes1d/examples

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/usr/local")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  INCLUDE("/home/pavel/hermes1d/examples/first_order_general/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/laplace_bc_dirichlet/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/laplace_bc_neumann/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/laplace_bc_newton/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/laplace_bc_newton2/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/system_exp/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/system_sin/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/system_sin_adapt/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/system_pendulum/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/first_order_general_adapt/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/system_pendulum_adapt/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/laplace_bc_dirichlet_adapt/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/system_chaotic/cmake_install.cmake")
  INCLUDE("/home/pavel/hermes1d/examples/system_car_model/cmake_install.cmake")

ENDIF(NOT CMAKE_INSTALL_LOCAL_ONLY)

