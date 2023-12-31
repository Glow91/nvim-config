local nvim_tree = require("nvim-tree")

-- disable netrw at the very start of your init.lua (strongly advised)
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 'u', api.node.navigate.parent, opts('Directoy Up'))
end

-- OR setup with some options
nvim_tree.setup({
    on_attach = my_on_attach,
    sort_by = "case_sensitive",
    view = {
        width = 40,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
       --  dotfiles = true,
    },
})

vim.keymap.set('n', '<leader>ex', ':NvimTreeToggle<CR>', {
    noremap = true
})
vim.keymap.set('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', {
    noremap = true
})
vim.keymap.set('n', '<leader>ff', ':NvimTreeFindFile<CR>', {
    noremap = true
})
vim.keymap.set('n', '<leader>fx', ':NvimTreeFocus<CR>', {
    noremap = true
})

vim.keymap.set('n', '<leader>fs+', ':NvimTreeResize +20<CR>', {
    noremap = true
})
vim.keymap.set('n', '<leader>fs-', ':NvimTreeResize -20<CR>', {
    noremap = true
})
vim.keymap.set('n', '<leader>fsb', ':NvimTreeResize 40<CR>', {
    noremap = true
})
