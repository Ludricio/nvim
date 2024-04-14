
return ({
	'folke/which-key.nvim',
	event = 'VimEnter',
	config = function()
		local wk = require('which-key')
		wk.setup()
		require('which-key').register {
			['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
			['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
			['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
			['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
			['<leader>p'] = { name = '[P]roject', _ = 'which_key_ignore' },
			['<leader>e'] = { name = '[E] Diagnostics', _ = 'which_key_ignore' },
		}	end
	})
