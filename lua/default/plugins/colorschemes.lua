return {{
	'Mofiqul/vscode.nvim',
	priority = 1000,
	init = function() require('vscode').load() end,
	opts = {
		transparent = true,
		italic_comments = true,
	}
}}
