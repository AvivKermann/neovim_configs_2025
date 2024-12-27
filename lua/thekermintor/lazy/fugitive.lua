return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", ":vertical Git<CR>:vertical resize 40<CR>", { noremap = true, silent = true })
		-- open up git difference
		vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiff, { noremap = true, silent = true })
		-- opens a commit window
		vim.keymap.set("n", "<leader>gc", function()
			vim.cmd("vertical Git commit --quiet")
			vim.cmd("vertical resize 75")
		end, { noremap = true, silent = true })
		-- open up git difference comparing a branch
		vim.keymap.set("n", "<leader>gb", function()
			local input = vim.fn.input("Branch: ")
			if input ~= "" then
				vim.cmd("Gdiff " .. input)
			else
				vim.cmd("Gdiff")
			end
		end, { noremap = true, silent = true })

		-- stage a given file.
		vim.keymap.set("n", "<leader>ga", function()
			local input = vim.fn.input("File: ")
			if input ~= "" then
				vim.cmd("Gwrite " .. input)
			else
				return
			end
		end, { noremap = true, silent = true })

		vim.keymap.set("n", "<leader>gps", ":Git! push", { noremap = true, silent = true })
	end,
}
-- this is the default keybinding for fugitive ( i will certinly forget them):
-- "-" : stage/unstage  a file inside git status
-- "=" : see the commit change inside the git status on a certain commit
