-- LabelUI
LabelUI = setmetatable({}, WidgetUI)

LabelUI.__index = LabelUI

function LabelUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("Label", parentUI),
        LabelUI
    )
    
    return self
end
