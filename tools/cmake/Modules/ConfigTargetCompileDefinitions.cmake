# Copyright ei06125. All Rights Reserved.

include_guard()
logtrace("Processing ConfigTargetCompileDefinitions.cmake")

function(config_target_compile_definitions project_name)

  target_compile_definitions(${project_name} INTERFACE ${PROJECT_DEFINITIONS})

endfunction()
