# Copyright ei06125. All Rights Reserved.

if($ENV{CLION_IDE}) # TODO: Do the same for CLion
  message("[CORE][INFO] Configuring CLION colors")
else()
  message("[CORE][INFO] Configuring NON-CLION colors")
  if(NOT WIN32)
    message("[CORE][INFO] Configuring for Linux or Apple")
    string(ASCII 27 Esc)
    set(ColourReset "${Esc}[m")
    set(ColourBold "${Esc}[1m")
    set(Red "${Esc}[31m")
    set(Green "${Esc}[32m")
    set(Yellow "${Esc}[33m")
    set(Blue "${Esc}[34m")
    set(Magenta "${Esc}[35m")
    set(Cyan "${Esc}[36m")
    set(White "${Esc}[37m")
    set(BoldRed "${Esc}[1;31m")
    set(BoldGreen "${Esc}[1;32m")
    set(BoldYellow "${Esc}[1;33m")
    set(BoldBlue "${Esc}[1;34m")
    set(BoldMagenta "${Esc}[1;35m")
    set(BoldCyan "${Esc}[1;36m")
    set(BoldWhite "${Esc}[1;37m")
  else()
    message("[CORE][INFO] Configuring for Windows -- unimplemented")
  endif()
endif()

set(CMAKE_LOG_LEVEL_TRACE 2)
set(CMAKE_LOG_LEVEL_DEBUG 3)
set(CMAKE_LOG_LEVEL_INFO 4)
set(CMAKE_LOG_LEVEL_WARNING 5)
set(CMAKE_LOG_LEVEL_ERROR 6)
set(CMAKE_LOG_LEVEL_FATAL 7)

# Sets the CMAKE_CURRENT_LOG_LEVEL to the default or command line option
option(CMAKE_CURRENT_LOG_LEVEL "Set CMake current log level"
       ${CMAKE_LOG_LEVEL_TRACE}
)

if(CMAKE_CURRENT_LOG_LEVEL STREQUAL "OFF")
  message("[CORE][WARNING] CMAKE_CURRENT_LOG_LEVEL is not set")
  set(CMAKE_CURRENT_LOG_LEVEL ${CMAKE_LOG_LEVEL_INFO})
  message(
    "[CORE][WARNING] CMAKE_CURRENT_LOG_LEVEL set to ${CMAKE_CURRENT_LOG_LEVEL}"
  )
endif()

function(LogMessage msg log_level)
  if(NOT ${log_level} LESS CMAKE_CURRENT_LOG_LEVEL)
    message(${msg})
  endif()
endfunction()

function(LogTrace msg)
  logmessage(
    "${ColourBold} [TRACE] ${ColourReset} ${msg}" ${CMAKE_LOG_LEVEL_TRACE}
  )
endfunction(LogTrace)

function(LogDebug msg)
  logmessage("${Cyan} [DEBUG] ${ColourReset} ${msg}" ${CMAKE_LOG_LEVEL_DEBUG})
endfunction(LogDebug)

function(LogInfo msg)
  logmessage("${Green} [INFO] ${ColourReset} ${msg}" ${CMAKE_LOG_LEVEL_INFO})
endfunction(LogInfo)

function(LogWarn msg)
  logmessage(
    "${BoldYellow} [WARNING] ${ColourReset} ${msg}" ${CMAKE_LOG_LEVEL_WARNING}
  )
endfunction(LogWarn)

function(LogError msg)
  message(SEND_ERROR "${BoldRed} [ERROR] ${ColourReset} ${msg}")
endfunction(LogError)

function(LogFatal msg)
  message(FATAL_ERROR "${BoldRed} [FATAL] ${ColourReset} ${msg} ")
endfunction(LogFatal)
