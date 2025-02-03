-- ProgressBarUI
ProgressBarUI = setmetatable({}, WidgetUI)

ProgressBarUI.__index = ProgressBarUI

function ProgressBarUI:new(parentUI)

    local self = setmetatable(
        WidgetUI:create("ProgressBar", parentUI),
        ProgressBarUI
    )
    
    return self
end
