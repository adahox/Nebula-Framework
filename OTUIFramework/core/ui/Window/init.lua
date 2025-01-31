-- WindowUI
WindowUI = setmetatable({}, WidgetUI)
WindowUI.__index = WindowUI

function WindowUI:new(parent)

    if not parent then
        parent = nil
    end

    local self = setmetatable(
        WidgetUI:create("Window", parent),
        WindowUI
    )
    
    return self
end
