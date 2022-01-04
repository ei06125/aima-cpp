# Copyright ei06125. All Rights Reserved.

logtrace("Processing src/CMakeLists.txt")

# =============================================================================
add_library(aimaPCH OBJECT)
target_sources(aimaPCH PUBLIC aimaPCH.cpp)
target_include_directories(aimaPCH PRIVATE ${ROOT_DIR}/external/doctest/doctest)
target_link_libraries(aimaPCH PUBLIC project_global_settings)

# =============================================================================
add_executable(aima main.cpp)

file(GLOB_RECURSE aima_SOURCES "Chapter[0-9][0-9]/*.cpp")

logdebug("${aima_SOURCES}")

target_sources(aima PRIVATE ${aima_SOURCES})

target_include_directories(
  aima PRIVATE ${ROOT_DIR}/external/doctest/doctest ${ROOT_DIR}/src
)
target_link_libraries(
  aima PRIVATE project_global_settings aimaPCH doctest::doctest
)
