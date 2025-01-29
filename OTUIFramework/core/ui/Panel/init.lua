-- PanelUI
PanelUI = setmetatable({}, WidgetUI)
PanelUI.__index = PanelUI

function PanelUI:new(parent)

    if not parent then
        parent = nil
    end

    local self = setmetatable(
        WidgetUI:create("Panel", parent),
        PanelUI
    )
    
    return self
end
