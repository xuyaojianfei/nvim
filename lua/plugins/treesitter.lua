return {
  'nvim-treesitter/nvim-treesitter',
  build = ':Tsupdate',
  main = 'nvim-treesitter.configs',
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = {
        'ruby'
      },
    },
    indent = {
      enable = true,
      disable = {
      'ruby'
      }
    },

    rainbow = {
      enable = true,

      extended_mode = true,
      max_file_lines = nil
    }
  }
}
