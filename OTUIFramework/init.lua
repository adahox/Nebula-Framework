

-- Define a classe OTUIFramework
OTUIFramework = {}
OTUIFramework.__index = OTUIFramework

-- private function to set WidgetAnchors


-- Construtor da classe OTUIFramework
function OTUIFramework.new(self)
    self = setmetatable({}, OTUIFramework)
    
    -- load core ui helper
    dofile("OTUIFramework/core/ui/init.lua")
    -- load utils helper
    dofile("OTUIFramework/core/Utils/init.lua")
    -- load handler controller
    dofile("OTUIFramework/core/classes/controllerHandler.lua")

    -- load controllers 
    OTUIFramework:loadControllers()

    -- load all ui widgets
    CoreUI:load()

    
    return self
end

function OTUIFramework:loadControllers()
    print("start loading controllers/")
    local controllers = g_resources.listDirectoryFiles('/OTUIFramework/')
    print("qtdaFiles: " .. #controllers)
    for _,controller in ipairs(controllers) do
        print("loading " .. controller " controller.")
        dofile(controller)
    end
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
    
    ParseOTXML:run()
end