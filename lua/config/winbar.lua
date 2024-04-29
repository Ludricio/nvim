local aerial = require("aerial")
return {

	get_location = function()
		local format_status = function(symbols)
			local parts = {}
			local depth = #symbols
			local icons_enabled = true
			local separator = " > "

			if depth > 0 then
				symbols = { unpack(symbols, 1, depth) }
			else
				symbols = { unpack(symbols, #symbols + 1 + depth) }
			end

			for _, symbol in ipairs(symbols) do
				if icons_enabled then
					table.insert(parts, string.format("%s %s", symbol.icon, symbol.name))
				else
					table.insert(parts, symbol.name)
				end
			end

			return table.concat(parts, separator)
		end

		local symbols = aerial.get_location(true)
		local symbols_structure = format_status(symbols)
		return symbols_structure
	end,
}
