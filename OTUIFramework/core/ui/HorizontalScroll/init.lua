-- LabelUI
HorizontalScrollUI = setmetatable({}, WidgetUI)

HorizontalScrollUI.__index = HorizontalScrollUI

function HorizontalScrollUI:new(parentUI)
    local self = setmetatable(
        WidgetUI:create("HorizontalScrollBar", parentUI),
        HorizontalScrollUI
    )
    
    return self
end
