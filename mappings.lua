local utils = require "astronvim.utils"
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {} }

local function termcodes(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

-- Tab
maps.n["<C-l>"] =
  { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
maps.n["<C-h>"] = {
  function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Previous buffer",
}

-- Buffer
maps.n["<leader>x"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" }
maps.n["<leader>X"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" }
maps.n["<leader>bx"] =
  { function() require("astronvim.utils.buffer").close_all(true) end, desc = "Close all buffers except current" }
maps.n["<leader>bX"] = { function() require("astronvim.utils.buffer").close_all() end, desc = "Close all buffers" }

-- navigation insert mode
maps.i["<C-h>"] = { "<Left>", desc = "move left" }
maps.i["<C-l>"] = { "<Right>", desc = "move right" }
maps.i["<C-j>"] = { "<Down>", desc = "move down" }
maps.i["<C-k>"] = { "<Up>", desc = "move up" }

-- Moving
if is_available "hop.nvim" then maps.n["f"] = { ":HopWord <CR>", desc = "Hop search" } end

-- if vim.bo.filetype == "neo-tree" then
-- Neo tree
if is_available "nvim-tree.lua" then
  maps.n["<C-n>"] = {
    function() vim.cmd.NvimTreeToggle "focus" end,
    desc = "Toggle Explorer Focus",
  }
end

-- Telescope
if is_available "telescope.nvim" then
  maps.n["<leader>fa"] = {
    function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
    desc = "Find all files",
  }
end

-- Terminal
if is_available "toggleterm.nvim" then
  maps.t["jk"] = { termcodes "<C-\\><C-N>", desc = "   escape terminal mode" }
  maps.t["JK"] = { termcodes "<C-\\><C-N>", desc = "   escape terminal mode" }
  maps.n["<leader>h"] = {
    function()
      if not (vim.bo.filetype == "NvimTree") then vim.cmd.ToggleTerm "size=10 direction=horizontal" end
    end,
    desc = "ToggleTerm horizontal split",
  }
  maps.n["<leader>v"] = {
    function()
      if not (vim.bo.filetype == "NvimTree") then vim.cmd.ToggleTerm "size=80 direction=vertical" end
    end,
    desc = "ToggleTerm horizontal split",
  }
end

-- Git vim-fugitive
if is_available "vim-fugitive" then maps.n["<leader>gf"] = { ":G <cr>", desc = "Open Git Vim Fugitive" } end

return maps
