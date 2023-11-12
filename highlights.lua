-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type HLTable
M.override = {
  CursorLine = {
    bg = "black2",
  },
  Comment = {
    italic = true,
  },
  AlphaHeader = { fg = "blue" },
  Variable = { italic = true },
  Keyword = { italic = true },
  -- imports
  Include = {
    italic = true,
  },
  -- for, while loops
  Repeat = {
    italic = true,
  },
  -- if statements
  Conditional = {
    italic = true,
  },
  -- class, with, as keywords
  ["@keyword"] = {
    italic = true,
  },
  -- function keyword
  ["@keyword.function"] = {
    italic = true,
  },
  -- return, yield keywords
  ["@keyword.return"] = {
    bold = true,
  },
  -- function names
  ["@function"] = {
    italic = false,
  },
  -- symbolic
  ["@operator"] = {
    bold = true,
  },
  -- logical keywords 
  ["@keyword.operator"] = {
    italic = true,
  },
  -- function parameters
  ["@parameter"] = {
    italic = true,
  },
  ["@variable"] = {
    italic = true,
  }
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M

