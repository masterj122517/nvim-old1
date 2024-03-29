
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    --use({
    --'rose-pine/neovim',
    --as = 'rose-pine',
    --config = function()
    --vim.cmd('colorscheme rose-pine')
    --end
    --})

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')

    use { 'yaocccc/vim-fcitx2en', event = 'InsertLeavePre' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            -- Snippet Collection (Optional)
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        cmd = 'MarkdownPreview',
        ft = 'markdown'
    })

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use('goolord/alpha-nvim')
    use("ggandor/leap.nvim") -- neovim movement
    -- toggleterm
    use("akinsho/toggleterm.nvim")
    --deus
    use("theniceboy/nvim-deus")
    use("theniceboy/eleline.vim")

    --tabline
    use 'mg979/vim-xtabline'
    --sudowrite
    use 'lambdalisue/suda.vim'
    -- colorizer
    use 'norcalli/nvim-colorizer.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim' -- For git blame & browse

    --vim-table-mode
    use {
        'dhruvasagar/vim-table-mode',
        run = ':TableModeToggle',
        ft = 'markdown'
    }

    use { "dstein64/vim-startuptime", cmd = "StartupTime" }

    --colorscheme
    use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter' })
    --vim-vistual-multi 
    use('mg979/vim-visual-multi')
    --wildfire
    use('gcmt/wildfire.vim')
end)
