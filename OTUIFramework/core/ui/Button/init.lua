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

function ButtonUI:hey()
    print("i'm here!")
end