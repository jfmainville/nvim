return {
	"echasnovski/mini.diff",
	version = "*",
	config = function()
		local diff = require("mini.diff")
		diff.setup({
			source = diff.gen_source.none(),
		})
	end,
}
