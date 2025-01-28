-- LabelUI
BotItemUI = setmetatable({}, WidgetUI)

BotItemUI.__index = BotItemUI

function BotItemUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("BotItem", parentUI),
        BotItemUI
    )
    
    return self
end