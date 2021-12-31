
function(config_target_compile_definitions project_name)

target_compile_definitions(${project_name} INTERFACE ${PROJECT_DEFINITIONS})

endfunction()
