local current_treesitter_context = function()
	local f = require'nvim-treesitter'.statusline({
		indicator_size = 300,
		type_patterns = {"class", "function", "method", "for_statement", "while_statement" },--, "if_statement", "interface", "type_spec", "table", "for_in_statement"},
		transform_fn = function(line) return line:gsub('%b()', '') end,
		separator = '->'
	})
	if f == nil then f = "*" end
	f = string.gsub(f, 'function%s', 'f ')
	f = string.gsub(f, "//.-%->", "->")
	f = string.gsub(f, "//.-$", "")
	f = string.gsub(f, "%{", "")
	return string.format("%s", f) -- convert to string, it may be a empty ts node	
end

-- %< - where to truncate the line if too long
-- %f - buffer name (path to a file, or something)
-- %h - help flag
-- %m - modified flag
-- %r - readonly flag
-- %= - separater between the left (buffer name) and the right (ruler) parts
-- %-14.(...%) - minimum field width == 14
-- %l - line
-- %c - column
-- %V - virtual column
-- %P - percentage
function status_line()
    return table.concat {
        "%f",
        "%h%w%m%r ",
		current_treesitter_context(),
        "%=%-14.",
		"(%l,%c%V%)",
        "%P"
    }
end

vim.o.statusline = "%!luaeval('status_line()')"

