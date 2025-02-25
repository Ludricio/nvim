-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local nmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end
local imap = function(keys, func, desc)
	vim.keymap.set("i", keys, func, { desc = desc })
end
local xmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("i", "<C-H>", '<C-o>"_db<BS>')

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

nmap("<Tab>", "<C-6>", "Switch to previous buffer")

vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("i", "<M-.>", "->")
vim.keymap.set("i", "<C-j>", "<C-o>j")
vim.keymap.set("i", "<C-k>", "<C-o>k")
vim.keymap.set("i", "<C-h>", "<C-o>h")
vim.keymap.set("i", "<C-l>", "<C-o>l")
vim.keymap.set("i", "<C-w>", "<C-o>w")
vim.keymap.set("i", "<C-b>", "<C-o>b")

-- nmap("<leader>dv", "<cmd>NvimTreeToggle<CR>", "Directory View")
nmap("<leader>dv", function()
	require("oil").toggle_float()
end, "Directory View")
--vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source file" })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>set relativenumber!<CR>", { silent = false })

vim.keymap.set("n", "<leader>as", "<cmd>Telescope aerial<CR>", { desc = "Aerial search" })
vim.keymap.set("n", "<leader>aa", "<cmd>AerialToggle left<CR>", { desc = "Aerial toggle" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Go to [p]revious diagnostic message" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Go to [n]ext diagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [e]rror messages" })
vim.keymap.set("n", "<leader>dd", function()
	require("trouble").toggle("diagnostics")
end, { desc = "open diagnostic [q]uickfix list" })
vim.keymap.set("n", "<leader>q", function()
	require("trouble").toggle("qflist")
end, { desc = "open diagnostic [q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

nmap("<C-h>", "<C-w><C-h>", "Move focus to the left window")
nmap("<C-l>", "<C-w><C-l>", "Move focus to the right window")
nmap("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
nmap("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- LSP
vim.keymap.set("i", "<c-a>", vim.lsp.buf.hover)
vim.keymap.set("n", "<c-a>", vim.lsp.buf.hover)
vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help)

-- Replace
vim.keymap.set("n", "<leader>ra", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[r]eplace [a]ll" })
vim.keymap.set("n", "<leader>rl", [[:.s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[r]eplace [l]ine" })
vim.keymap.set(
	"n",
	"<leader>rw",
	[[:.s/\<<C-r><C-w>\>/<C-r><C-w>/I<Left><Left><Left>]],
	{ desc = "[r]eplace current [w]ord" }
)

-- See `:help telescope.builtin`
--Telescope keymaps
local builtin = require("telescope.builtin")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp" })
vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[s]earch [k]eymaps" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
vim.keymap.set("n", "<leader>st", builtin.builtin, { desc = "[s]earch select [t]elescope" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[s]earch current [W]ord" })
vim.keymap.set("v", "<leader>sw", live_grep_args_shortcuts.grep_visual_selection, { desc = "[s]earch current section" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[s]earch by [g]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[s]earch [d]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[s]earch [r]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[s]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[s]earch existing [b]uffers" })

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[s]earch [n]eovim files" })

nmap("<leader>gg", "<cmd>:Git<CR>", "Show [g]it UI")

local harpoon = require("harpoon")

nmap("<leader>ha", function()
	harpoon:list():add()
end, "[a]dd to harpoon list")
nmap("<leader>he", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, "[e]dit harpoon list")

nmap("<M-h>", function()
	harpoon:list():select(1)
end, "")
nmap("<M-j>", function()
	harpoon:list():select(2)
end, "")
nmap("<M-k>", function()
	harpoon:list():select(3)
end, "")
nmap("<M-l>", function()
	harpoon:list():select(4)
end, "")

nmap("<leader>hp", function()
	harpoon:list():prev()
end, "go to [p]revious harpoon entry")
nmap("<leader>hn", function()
	harpoon:list():next()
end, "go to [n]ext harpoon entry")

vim.keymap.set("n", "<leader>ts", "<cmd>TodoTelescope<CR>", { desc = "[t]odo [s]earch" })
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble todo toggle<CR>", { desc = "[t]odo [t]rouble" })

vim.keymap.set("n", "<leader>ct", function()
	print("Copilot suggestion toggle_auto_trigger")
	vim.cmd("Copilot suggestion toggle_auto_trigger")
end, { desc = "[c]opilot [t]oggle" })
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatToggle<CR>", { desc = "[c]opilot [c]hat" })
vim.keymap.set("n", "<leader>cs", "<cmd>CopilotChatStop<CR>", { desc = "[c]opilot [c]hat" })

--
