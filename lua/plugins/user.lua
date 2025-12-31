-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = true },

   {
    'fedepujol/move.nvim',
    keys = {
      -- Normal Mode
      { "<leader>mj", ":MoveLine(1)<CR>", desc = "Move Line Up" },
      { "<leader>mk", ":MoveLine(-1)<CR>", desc = "Move Line Down" },
      { "<leader>mh", ":MoveHChar(-1)<CR>", desc = "Move Character Left" },
      { "<leader>ml", ":MoveHChar(1)<CR>", desc = "Move Character Right" },
      { "<leader>mf", ":MoveWord(-1)<CR>", mode = { "n" }, desc = "Move Word Left" },
      { "<leader>mb", ":MoveWord(1)<CR>", mode = { "n" }, desc = "Move Word Right" },
      -- Visual Mode
      { "<leader>mj", ":MoveBlock(1)<CR>", mode = { "v" }, desc = "Move Block Up" },
      { "<leader>mk", ":MoveHBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Left" },
      { "<leader>mh", ":MoveBlock(-1)<CR>", mode = { "v" }, desc = "Move Block Down" },
      { "<leader>ml", ":MoveHBlock(1)<CR>", mode = { "v" }, desc = "Move Block Right" },
    },
    opts={},
  },
}
