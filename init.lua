-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- So on an empty line, pressing Left in insert mode or h in normal mode moves to the end of the line above, and Right or l at the end of a line moves to the start of the next one.
-- A caution about h and l: Vim's docs recommend against adding them, because they also change commands that use them as motions. For example, dh or 3h at the start of a line would reach into the previous line. If you'd rather avoid that, only enable the arrow keys:
vim.opt.whichwrap:append("<,>,[,],h,l")
