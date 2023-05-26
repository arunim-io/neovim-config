return {
	{
		"lukas-reineke/indent-blankline.nvim",
  		opts = {
    			show_current_context = true,
	    		show_current_context_start = true,
			space_char_blankline = " ",
  		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
	}
}
