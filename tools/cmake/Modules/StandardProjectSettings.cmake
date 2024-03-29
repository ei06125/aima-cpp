# =============================================================================
# Set a default build type if none was specified
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(
    STATUS "Setting build type to 'RelWithDebInfo' as none was specified."
  )
  set(CMAKE_BUILD_TYPE
      RelWithDebInfo
      CACHE STRING "Choose the type of build." FORCE
  )
  # Set the possible values of build type for cmake-gui, ccmake
  set_property(
    CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel"
                                    "RelWithDebInfo"
  )
endif()

# =============================================================================
# Generate compile_commands.json to make it easier to work with clang based
# tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_VERBOSE_MAKEFILE OFF)

# =============================================================================
# Configure Interprocedural Optimization, aka Link Time Optimization (LTO)
option(ENABLE_IPO
       "Enable Interprocedural Optimization, aka Link Time Optimization (LTO)"
       ON
)

if(ENABLE_IPO)
  include(CheckIPOSupported)
  check_ipo_supported(RESULT result OUTPUT output)
  if(result)
    # set(CMAKE_INTERPROCEDURAL_OPTIMIZATION TRUE)
    loginfo("IPO is supported")
  else()
    logwarn("IPO is not supported: ${output}")
  endif()
endif()

# =============================================================================
# 