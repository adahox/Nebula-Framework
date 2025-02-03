
-- FlatPanelUI
FlatPanelUI = setmetatable({}, WidgetUI)

FlatPanelUI.__index = FlatPanelUI

function FlatPanelUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("FlatPanel", parentUI),
        FlatPanelUI
    )
    
    return self
end
