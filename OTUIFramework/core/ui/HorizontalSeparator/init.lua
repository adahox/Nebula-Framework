-- HorizontalLabelUI
HorizontalSeparatorUI = setmetatable({}, WidgetUI)

HorizontalSeparatorUI.__index = HorizontalSeparatorUI

function HorizontalSeparatorUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("HorizontalSeparator", parentUI),
        HorizontalSeparatorUI
    )
    
    return self
end
