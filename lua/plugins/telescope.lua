return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>gf", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fg", builtin.git_status, {})
		vim.keymap.set("n", "<leader>fe", function()
			builtin.find_files({ search_dirs = { "~/.config/nvim", "~/software", "~/Projects" } })
		end, {})
		vim.keymap.set("n", "<leader>ge", function()
			builtin.live_grep({ search_dirs = { "~/.config/nvim", "~/software", "~/Projects" } })
		end, {})
		vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})

		local ignore_patterns = { ".idea", "node_modules", ".git/", ".venv", ".next", ".terraform/" }

		require("telescope").setup({
			defaults = {
				-- Remove the ripgrep indentation
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim", -- add this value
				},
			},
			pickers = {
				live_grep = {
					file_ignore_patterns = ignore_patterns,
					additional_args = function(_)
						return { "--hidden" }
					end,
				},
				find_files = {
					hidden = true,
					file_ignore_patterns = ignore_patterns,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
