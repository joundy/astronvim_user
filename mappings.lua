local utils = require "astronvim.utils"
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {} }

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

maps.n["<C-l>"] =
  { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
maps.n["<C-h>"] = {
  function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
  desc = "Previous buffer",
}

maps.t["jk"] = { termcodes "<C-\\><C-N>", desc = "   escape terminal mode" }
maps.t["JK"] = { termcodes "<C-\\><C-N>", desc = "   escape terminal mode" }

-- Hop
if is_available "hop.nvim" then 
  maps.n["f"] = { ":HopWord <CR>", desc = "Hop search" }
end

-- Neo tree
if is_available "neo-tree.nvim" then
  maps.n["<C-n>"] = {
    function()
      if vim.bo.filetype == "neo-tree" then
        vim.cmd.wincmd "p"
      else
        vim.cmd.Neotree "focus"
      end
    end,
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
  maps.n["<leader>h"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
  maps.n["<leader>v"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
end


return maps
