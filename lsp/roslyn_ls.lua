local blink = require "blink-cmp"

return {
  capabilities = vim.tbl_deep_extend("force", blink.get_lsp_capabilities(), {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = false,
      },
    },
  }),
  settings = {
    ["csharp|inlay_hints"] = {
      -- Parameter hints
      dotnet_enable_inlay_hints_for_parameters = true,
      dotnet_enable_inlay_hints_for_literal_parameters = true,
      dotnet_enable_inlay_hints_for_indexer_parameters = true,
      dotnet_enable_inlay_hints_for_object_creation_parameters = true,
      dotnet_enable_inlay_hints_for_other_parameters = true,
      dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = false,
      dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = false,
      dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = false,
      -- Type hints
      csharp_enable_inlay_hints_for_types = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
      csharp_enable_inlay_hints_for_lambda_parameter_types = true,
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
    ["csharp|completion"] = {
      dotnet_show_completion_items_from_unimported_namespaces = true,
    },
    ["csharp|formatting"] = {
      dotnet_organize_imports_on_format = true,
    },
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "fullSolution",
      dotnet_compiler_diagnostics_scope = "fullSolution",
    },
  },
}
