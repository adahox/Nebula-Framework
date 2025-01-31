-- LabelUI
ButtonUI = setmetatable({}, WidgetUI)

ButtonUI.__index = ButtonUI

function ButtonUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("Button", parentUI),
        ButtonUI
    )
    
    return self
end