vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.cmd([[colorscheme retrobox]])

local map = vim.api.nvim_set_keymap
map('n', '<C-s>', ':w<CR>', {noremap=true, silent=true})

vim.lsp.config['luals'] = {
    cmd = {'lua-language-server'},
    filetypes = {'lua'},
    root_markers = {'.luarc.json', 'luarc.jsonc' },
    settings ={
        Lua ={
            runtime = {
                version = 'LuaJIT',
            }
        }
    }
}

vim.lsp.enable('luals')
