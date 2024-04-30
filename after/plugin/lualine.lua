local clients_lsp = function()
	local bufnr = vim.api.nvim_get_current_buf()

	local clients = vim.lsp.buf_get_clients(bufnr)
	if next(clients) == nil then
		return ""
	end

	local c = {}
	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end
	return "\u{f085} " .. table.concat(c, "|")
end

require("lualine").setup({
	icons_enabled = true,
	options = {
		theme = "auto",
		component_separators = "",
		section_separators = { left = "", right = "" },
	},
	disabled_filetypes = {
		statusline = {},
		winbar = {},
	},
	ignore_focus = {},
	always_divide_middle = true,
	globalstatus = false,
	refresh = {
		statusline = 1000,
		tabline = 1000,
		winbar = 1000,
	},
	extensions = { "oil", "lazy", "mason", "trouble" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = true, -- Display new file status (new file means no write after created)
				path = 3, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory
				-- 4: Filename and parent dir, with tilde as the home directory

				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "●", -- Text to show when the file is modified.
					readonly = "[Read-Only]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
					newfile = "[New]", -- Text to show for newly created file before first write
				},
			},
		},
		lualine_x = {
			{ "diagnostics", sources = { "nvim_diagnostic", "coc", "nvim_lsp", "vim_lsp" } },
			clients_lsp,
			"fileformat",
			{
				"filetype",
				colored = false, -- Displays filetype icon in color if set to true
				icon_only = true, -- Display only an icon for filetype
				icon = { align = "right" }, -- Display filetype icon on the right hand side
			},
		},
		lualine_y = { "progress", "searchcount" },
	},
})
