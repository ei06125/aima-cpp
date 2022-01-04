# =============================================================================
# https://cmake.org/cmake/help/latest/prop_gbl/CMAKE_CXX_KNOWN_FEATURES.html
#
# cmake-format: off
# ---- CMAKE_CXX_KNOWN_FEATURES ----
# cxx_std_98
# cxx_template_template_parameters
# cxx_std_11
# cxx_alias_templates
# cxx_alignas
# cxx_alignof
# cxx_attributes
# cxx_auto_type
# cxx_constexpr
# cxx_decltype
# cxx_decltype_incomplete_return_types
# cxx_default_function_template_args
# cxx_defaulted_functions
# cxx_defaulted_move_initializers
# cxx_delegating_constructors
# cxx_deleted_functions
# cxx_enum_forward_declarations
# cxx_explicit_conversions
# cxx_extended_friend_declarations
# cxx_extern_templates
# cxx_final
# cxx_func_identifier
# cxx_generalized_initializers
# cxx_inheriting_constructors
# cxx_inline_namespaces
# cxx_lambdas
# cxx_local_type_template_args
# cxx_long_long_type
# cxx_noexcept
# cxx_nonstatic_member_init
# cxx_nullptr
# cxx_override
# cxx_range_for
# cxx_raw_string_literals
# cxx_reference_qualified_functions
# cxx_right_angle_brackets
# cxx_rvalue_references
# cxx_sizeof_member
# cxx_static_assert
# cxx_strong_enums
# cxx_thread_local
# cxx_trailing_return_types
# cxx_unicode_literals
# cxx_uniform_initialization
# cxx_unrestricted_unions
# cxx_user_literals
# cxx_variadic_macros
# cxx_variadic_templates
# cxx_std_14
# cxx_aggregate_default_initializers
# cxx_attribute_deprecated
# cxx_binary_literals
# cxx_contextual_conversions
# cxx_decltype_auto
# cxx_digit_separators
# cxx_generic_lambdas
# cxx_lambda_init_captures
# cxx_relaxed_constexpr
# cxx_return_type_deduction
# cxx_variable_templates
# cxx_std_17
# cxx_std_20
# ---- CMAKE_CXX_KNOWN_FEATURES ----
# cmake-format: on
#
# =============================================================================

# defines a function that configures all the compiler features for a project
function(config_target_compile_features project_name)

  set(PROJECT_FEATURES cxx_std_20)

  target_compile_features(${project_name} INTERFACE ${PROJECT_FEATURES})

endfunction()
