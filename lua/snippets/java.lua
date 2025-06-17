local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

return {
	s("class", {
		f(function(_, snip)
			local path = snip.env.TM_DIRECTORY or ""
			local pkg = path:match("src/main/java/(.*)")
			if pkg then
				return "package " .. pkg:gsub("/", ".") .. ";"
			else
				return "// package unknown"
			end
		end, {}),
		t({ "", "", "public class " }),
		i(1, "ClassName"),
		t({ " {", "    " }),
		i(0),
		t({ "", "}" }),
	}),
}
