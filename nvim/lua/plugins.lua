require('packer').startup(
    function()
	-- Packer manages itself
	use 'wbthomason/packer.nvim'
	-- colorscheme
    use 'gruvbox-community/gruvbox'
	-- conqueror of completion
    use {'neoclide/coc.nvim', branch = 'release'}
    end
)
