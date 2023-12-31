local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

-- Use smart case
table.insert(vimgrep_arguments, "--smart-case")

telescope.setup {
    defaults = {
        hidden = true,
        path_display = { "truncate" },
        vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files= {
            hidden = true,
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--smart-case" },
        },
        live_grep = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--smart-case" },
        },
        defaults = {
            file_ignore_patterns = {
                "node_modules/.*",
                ".git/.*"
            },
        }
    },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gcl', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gbl', builtin.git_branches, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>s', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- LSP 
vim.keymap.set('n', '<leader>dw', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>df', ':Telescope diagnostics bufnr=0<CR>', {})
vim.keymap.set('n', '<leader>vrr', builtin.lsp_references, {})

-- Quickfix (cdo)
local actions = require('telescope.actions')
vim.keymap.set('n', '<C-q>', function()
    actions.smart_send_to_qflist()
    actions.open_qflist()
end)

require("telescope").load_extension("ui-select")
require("telescope").load_extension("lazygit")
