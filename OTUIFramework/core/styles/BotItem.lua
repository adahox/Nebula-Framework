BotItemStyle = setmetatable({}, StylesHandler)
BotItemStyle.__index = BotItemStyle

function BotItemStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), BotItemStyle);

    if not parent then
        parent = nil
    end

    local widget =  BotItemUI:new(parent)

    self:buildStyle(widget)

    return widget
end
