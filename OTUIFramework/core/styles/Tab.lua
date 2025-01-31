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

    return false
end
