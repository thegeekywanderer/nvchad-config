-- local autocmd = vim.api.nvim_create_autocmd

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.rnu = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.g.undotree_WindowLayout = 3

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

if vim.g.neovide then

  vim.g.neovide_cursor_animation_length = 0.10
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

