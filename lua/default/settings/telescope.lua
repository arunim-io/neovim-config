--- Loads Telescope Extensions
---@param extensions string[]
---@return nil
function load_extensions(extensions)
  for _, value in pairs(extensions) do require('telescope').load_extension(value) end
end

return { load_extensions = load_extensions }
