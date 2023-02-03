function ColorMyTheme(color)
    color = color or "onedark"
    vim.cmd.colorscheme(color)

    --background none color
    --vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
    --vim.api.nvim_set_hl(0,"NormalFloat",{bg = "none"})
end
vim.cmd[[let g:airline_powerline_fonts = 0]]
vim.cmd[[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]]
vim.cmd[[hi NonText ctermfg=gray guifg=grey10]]
ColorMyTheme()
