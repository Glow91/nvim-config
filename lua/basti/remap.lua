vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", '<cmd>Prettier<CR>')

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>,", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true  });
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true  });
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true  });
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true  });

-- tabs
vim.keymap.set("n", "<leader>tc", "<cmd>:tabclose<CR>")
vim.keymap.set("n", "<leader>1tc", "<cmd>:tabclose 1<CR>")
vim.keymap.set("n", "<leader>2tc", "<cmd>:tabclose 2<CR>")
vim.keymap.set("n", "<leader>3tc", "<cmd>:tabclose 3<CR>")
vim.keymap.set("n", "<leader>4tc", "<cmd>:tabclose 4<CR>")
vim.keymap.set("n", "<leader>5tc", "<cmd>:tabclose 5<CR>")

-- load packer
vim.keymap.set("n", "<leader>vpp", "<cmd>e $NVIM_CONFIG/lua/basti/packer.lua<CR>");
