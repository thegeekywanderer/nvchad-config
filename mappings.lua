---@type MappingsConfig
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-w>"] = { "<cmd> bd <CR>", "close file" },
    ["<leader>gg"] = { "<cmd> !golines . -w <CR>", "run golines" },
    ["<leader>bb"] = { "<cmd> !black . <CR>", "run black" },
  },
}

return M

