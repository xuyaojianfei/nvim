return {

	-- 加速j,k换行的速度
	{
		"rhysd/accelerated-jk",
		config = function()
			vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
			vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
		end,
	},

	-- 保存并返回上次编辑的状态
	{
		"folke/persistence.nvim",
		config = function()
			require("persistence").setup()
			vim.keymap.set("n", "<leader>qs", function()
				require("persistence").load()
			end, { desc = "load the session for the current directory" })
			vim.keymap.set("n", "<leader>qS", function()
				require("persistence").select()
			end, { desc = "select a session to load" })
			vim.keymap.set("n", "<leader>ql", function()
				require("persistence").load({ last = true })
			end, { desc = "load the last session" })
			vim.keymap.set("n", "<leader>qd", function()
				require("persistence").stop()
			end, { desc = "stop Persistence => session won't be saved on exit" })
		end,
	},

	-- 提示按键
	{
		"folke/which-key.nvim",
		config = true,
	},

	-- 文档树
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "nvim tr[E]e toggle" },
			{ "<leader>c", "<cmd>NvimTreeFindFile<cr>", desc = "nvim tree find [C]urrent file" },
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwplugin = 1
			require("nvim-tree").setup()
		end,
	},

	-- 光标停留在文件上次打开的地方
	{
		"ethanholz/nvim-lastplace",
		config = true,
	},

	-- flash 快速跳转 *好用*
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    }
,
	},

	-- 简单看下markdown预览
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
	},

	-- 自动补全括号
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = false,
			check_ts = true,
		},
	},

	-- 增强vim中textobjects的a/i能力
	{
		"echasnovski/mini.ai",
		config = true,
	},

	-- 注释插件
	{
		"echasnovski/mini.comment",
		config = true,
	},

	-- 窗口快速跳转插件
	{
		"s1n7ax/nvim-window-picker",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = true,
					bo = {
						filetype = { "fidget" },
					},
				},
			})
			vim.keymap.set("n", "<c-w>p", function()
				local picked_window_id = require("window-picker").pick_window()
				if picked_window_id then
					vim.api.nvim_set_current_win(picked_window_id)
				end
			end)
		end,
	},

	-- 彩虹括号
	{
		"p00f/nvim-ts-rainbow",
	},

	-- 支持ctrl[h, j, k, l]在不同窗口中跳转,同时支持tmux
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- lazygit 插件
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	-- 自动格式化插件
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = "never"
				else
					lsp_format_opt = "fallback"
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},

	-- 翻译插件
	{
		"voldikss/vim-translator",
		keys = {
			{ "<leader>t", "<cmd>TranslateW<cr>", desc = "[T]ranslate cursor text" },
			{
				"<c-t>",
				":TranslateW<cr>",
				mode = "v",
				desc = "[T]ranslate visable text",
			},
		},
	},
}
