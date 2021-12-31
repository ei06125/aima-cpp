macro(run_conan)
  # Download automatically, you can also just copy the conan.cmake file
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(
      STATUS
        "Downloading conan.cmake from https://github.com/conan-io/cmake-conan"
    )
    file(DOWNLOAD
         "https://github.com/conan-io/cmake-conan/raw/v0.16/conan.cmake"
         "${CMAKE_BINARY_DIR}/conan.cmake"
    )
  endif()

  include(${CMAKE_BINARY_DIR}/conan.cmake)

  conan_cmake_run(
    CONANFILE
    conanfile.txt
    REQUIRES
    ${CONAN_EXTRA_REQUIRES}
    OPTIONS
    ${CONAN_EXTRA_OPTIONS}
    INSTALL_FOLDER
    ${CMAKE_BINARY_DIR}
    BASIC_SETUP
    CMAKE_TARGETS # individual targets to link to
    BUILD
    missing
  )
endmacro()
