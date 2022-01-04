cmake_minimum_required(VERSION 3.21)
project(aima-cpp)

set(ROOT_DIR ${PROJECT_SOURCE_DIR})

# =============================================================================
# includes helper configuration files
set(CMAKE_CURRENT_LOG_LEVEL 2) # TRACE
include(tools/cmake/BuildTools.cmake)

# =============================================================================
# creates an Interface library to pass-down to other cmake targets
add_library(project_global_settings INTERFACE)
config_target_compile_definitions(project_global_settings) # ASSERTIONS_ENABLED
config_target_compile_features(project_global_settings) # c++20, etc.
config_target_compile_options(project_global_settings) # -O3 -m64 -msse, etc.

# =============================================================================
# Adds external submodules (e.g. googletest, spdlog, etc.)
# add_subdirectory(external)

# =============================================================================
# Adds external submodules (e.g. Clean Architecture)
# add_subdirectory(examples)

# =============================================================================
# Adds external headers (e.g. standard library pre-compiled headers)
# add_subdirectory(include)

# =============================================================================
# Adds internal components (e.g. core library, etc.) add_subdirectory(lib)

# =============================================================================
# Adds main application (i.e. )
add_subdirectory(src)

# =============================================================================
# Adds application tests (e.g. unit, integration, acceptance, end-to-end, etc.)
# add_subdirectory(tests)
