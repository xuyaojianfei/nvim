-- 添加到你的插件配置文件 (例如：~/.config/nvim/init.lua 或 lua/plugins.lua) 中
return {
  "uga-rosa/translate.nvim",
  config = function()
    require("translate").setup({
      default = {
        command = "google", -- 默认使用谷歌翻译，可改为 "deepl" 等
      },
      preset = {
        output = {
          -- 配置默认输出方式为浮动窗口
          split = {
            append = true,
          },
        },
      },
    })
    -- 设置快捷键：在普通模式下，使用 <Leader>tt 翻译光标下的文本
    vim.keymap.set('n', '<Leader>tt', '<cmd>Translate ZH<CR>', { noremap = true, silent = true, desc = "Translate word under cursor" })
    -- 在可视模式下，使用 <Leader>tt 翻译选中的文本
    vim.keymap.set('v', '<Leader>tt', '<cmd>Translate ZH<CR>', { noremap = true, silent = true, desc = "Translate visual selection" })
  end,
}
