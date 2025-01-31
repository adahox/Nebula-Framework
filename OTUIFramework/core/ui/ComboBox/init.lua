-- LabelUI
ComboBoxUI = setmetatable({}, WidgetUI)

ComboBoxUI.__index = ComboBoxUI

function ComboBoxUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("ComboBox", parentUI),
        ComboBoxUI
    )
    
    return self
end


