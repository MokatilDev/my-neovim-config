require "nvchad.options"

-- add yours here!

local o = vim.o
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
vim.g.vscode_snippets_path = "~/.vscode/extensions/pulkitgangwar.nextjs-snippets-1.0.3"
vim.filetype.add {
  extension = {
    postcss = "css",
  },
  filename = {
    ["postcss.config.js"] = "javascript",
  },
}
-- o.cursorlineopt ='both' -- to enable cursorline!
