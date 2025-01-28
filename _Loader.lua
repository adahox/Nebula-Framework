local loadableModulesList = {
  "main",
  "items",
  "vlib",
  "configs",

}

local function loadFramework()
  return dofile("/OTUIFramework/init.lua")
end

loadFramework()
local otuiFramework = OTUIFramework:new()

otuiFramework:loadModule(loadableModulesList)
