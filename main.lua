local loadableModulesList = {
  "main",
  "items",
  "vlib",
  "configs",
  "game_bot"

}

local function loadConfig()
  dofile("/config.lua")
end

local function loadFramework()
  return dofile("/OTUIFramework/init.lua")
end

loadConfig()
loadFramework()
local otuiFramework = OTUIFramework:new()

otuiFramework:loadModule(loadableModulesList)
otuiFramework:loadParse()

