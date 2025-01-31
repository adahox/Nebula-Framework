-- LabelUI
CheckboxUI = setmetatable({}, WidgetUI)

CheckboxUI.__index = CheckboxUI

function CheckboxUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("CheckBox", parentUI),
        CheckboxUI
    )
    
    return self
end
