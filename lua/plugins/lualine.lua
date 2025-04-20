return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local harpoon = require("harpoon")

			local function truncate_branch_name(branch)
				if not branch or branch == "" then
					return ""
				end

				-- Match the branch name to the specified format
				local _, _, ticket_number = string.find(branch, "skdillon/sko%-(%d+)%-")

				-- If the branch name matches the format, display sko-{ticket_number}, otherwise display the full branch name
				if ticket_number then
					return "sko-" .. ticket_number
				else
					return branch
				end
			end

			local function harpoon_component()
				local total_marks = harpoon:list():length()
				if total_marks == 0 then
					return ""
				end
				local cwd = vim.fn.getcwd()
				local current_file = vim.fn.expand('%:p')

				-- Find the index of the current file in the marks list
				local index = nil
				-- Check if the current file is within the CWD
				if current_file:sub(1, #cwd) == cwd then
					local current_file = current_file:sub(#cwd + 2) -- +2 to remove the leading slash
					for i, mark in ipairs(harpoon:list().items) do
						if mark.value == current_file then
							index = i
							break
						end
					end
				end


				local current_mark = "—"
				if index ~= nil then
					current_mark = tostring(index)
				end

				return string.format("󱡅 %s/%d", current_mark, total_marks)
			end
			require("lualine").setup({
				options = {
					theme = "catppuccin",
					globalstatus = true,
					component_separators = { left = "█", right = "█" },
					section_separators = { left = "█", right = "█" },
				},
				sections = {
					lualine_b = {
						{ "branch", icon = "", fmt = truncate_branch_name },
						harpoon_component,
						"diff",
						"diagnostics",
					},
					lualine_c = {
						{ "filename", path = 1 },
					},
					lualine_x = {
						"filetype",
					},
				},
			})
		end,
	},
}
