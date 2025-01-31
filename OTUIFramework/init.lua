

-- Define a classe OTUIFramework
OTUIFramework = {}
OTUIFramework.__index = OTUIFramework

-- private function to set WidgetAnchors


-- Construtor da classe OTUIFramework
function OTUIFramework.new(self)
    
    dofile("OTUIFramework/core/ui/init.lua")

    dofile("OTUIFramework/core/Utils/init.lua")

    
    CoreUI:load()

    self = setmetatable({}, OTUIFramework)
    
    return self
end

function OTUIFramework:loadFile(moduleName)
    print("loading module: " .. moduleName)    
    dofile("/OTUIFramework/modules/" .. moduleName .. "/init.lua")
end

function OTUIFramework:loadModule(modulesList)
    for _, module in ipairs(modulesList) do
        OTUIFramework:loadFile(module)    
    end
    return true
end

function OTUIFramework:loadParse()
    dofile("OTUIFramework/core/parsers/otml/init.lua")
    
    ParserOTML:run()
end