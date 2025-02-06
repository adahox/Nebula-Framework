TabStyle = setmetatable({}, StylesHandler)
TabStyle.__index = TabStyle

function TabStyle:create(documentNode, parent)
    local self = setmetatable(StylesHandler:init(documentNode), TabStyle);

    if not parent then
        parent = nil
    end

    local gameBot = GameBot:create()
    
    local tab =  gameBot:addTab(
        documentNode:getPropertyByName("name")
    )
    
    
    -- start settings controllerContext
    local controllerName = documentNode:getPropertyByName("controller")
    ControllerContext = controllerName


    return nil
end

function TabStyle:loadController()
    Utils.loadFile(
        "OTUIFramework/controllers/",
        ControllerContext
    )
end


