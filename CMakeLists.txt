cmake_minimum_required(VERSION 3.20.0)
project(cpp-clean-architecture)

set(ROOT_DIR ${PROJECT_SOURCE_DIR})

# =============================================================================
# includes helper configuration files
include(${ROOT_DIR}/tools/cmake/Cache.cmake)
include(${ROOT_DIR}/tools/cmake/Conan.cmake)
include(${ROOT_DIR}/tools/cmake/ConfigTargetCompileDefinitions.cmake)
include(${ROOT_DIR}/tools/cmake/ConfigTargetCompileFeatures.cmake)
include(${ROOT_DIR}/tools/cmake/ConfigTargetCompileOptions.cmake)
include(${ROOT_DIR}/tools/cmake/Doxygen.cmake)
include(${ROOT_DIR}/tools/cmake/Logger.cmake)
include(${ROOT_DIR}/tools/cmake/PreventInSourceBuilds.cmake)
include(${ROOT_DIR}/tools/cmake/Sanitizers.cmake)
include(${ROOT_DIR}/tools/cmake/StandardProjectSettings.cmake)
include(${ROOT_DIR}/tools/cmake/StaticAnalyzers.cmake)

# =============================================================================
find_package(Threads REQUIRED)

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
add_subdirectory(examples)

# =============================================================================
# Adds external headers (e.g. standard library pre-compiled headers)
# add_subdirectory(include)

# =============================================================================
# Adds internal components (e.g. core library, etc.)
# add_subdirectory(lib)

# =============================================================================
# Adds main application (i.e. )
# add_subdirectory(src)

# =============================================================================
# Adds application tests (e.g. unit, integration, acceptance, end-to-end, etc.)
# add_subdirectory(tests)
