-- nvim-treesitter was rewritten for Neovim 0.12 with a new API.
-- Highlighting is now built into Neovim via vim.treesitter.start() (see autocmds.lua).
-- Indentation is now opt-in per filetype via vim.bo.indentexpr (see autocmds.lua).
-- Parsers are installed via :TSInstall / :TSUpdate and require the tree-sitter CLI:
--   brew install tree-sitter   (macOS)
--   npm install -g tree-sitter-cli
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
}
