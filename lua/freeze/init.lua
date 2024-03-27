local M = {}

-- TODO: add support for custom options
M.get_arguments = function()
	local cmdline = {}
	table.insert(cmdline, "freeze")
	return cmdline
end

M.format_lines = function(cmdline, args)
	local begin_line = args.line1 - 1
	local finish_line = args.line2

	if args.range == 0 then
		begin_line = 0
		finish_line = -1
	end

	local marks = vim.api.nvim_buf_get_mark(vim.api.nvim_win_get_buf(0), "h")[1]
	if marks > 0 then
		local hl
		if args.range == 0 or (args.line1 and marks >= begin_line and marks <= finish_line) then
			hl = marks - begin_line
			table.insert(cmdline, "--lines ")
			table.insert(cmdline, hl)
		end
	end

	local lines = vim.api.nvim_buf_get_lines(vim.api.nvim_win_get_buf(0), begin_line, finish_line, false)

	return lines, cmdline
end

M.start = function(args)
	local lines = nil
	local cmdline = nil

	-- start building the base of the command from the options
	local base_cmdline = M.get_arguments()
	-- parse buffer into lines, based on arguments from neovim, reshapes cmdline
	lines, base_cmdline = M.format_lines(base_cmdline, args)

	-- try to get the language from neovim's buffer filetype
	cmdline = vim.tbl_extend("error", base_cmdline, {})
	table.insert(cmdline, "--language")
	table.insert(cmdline, vim.bo.filetype)

	-- run the command and get the output
	local ret = vim.fn.system(cmdline, lines)
	if string.find(ret, "WROTE") then
		return vim.notify("File saved to" .. string.sub(ret, 8), vim.log.levels.INFO, { title = "charm-freeze.nvim" })
	else
		return vim.notify("freeze returned: " .. ret, vim.log.levels.WARN, { title = "charm-freeze.nvim" })
	end
end

-- define commands for neovim
M.setup = function()
	vim.api.nvim_create_user_command("Freeze", function(args)
		M.start(args)
	end, {
		desc = "convert range to code image representation",
		force = false,
		range = true,
	})
end

return M
