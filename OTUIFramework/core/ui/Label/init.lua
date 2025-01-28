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

-- Define métodos específicos para LabelUI
function LabelUI:setText(value)
    if self.widget then
        self.widget:setText(value)
    end
end

function LabelUI:getText(value)
    if self.widget then
        return self.widget:getText()
    end
end

function LabelUI:setBackgroundColor(value)
    print("backgroundColor foi chamado!")
    if self.widget then
        self.widget:setBackgroundColor(value)
    end
end

function LabelUI:setTextAlign(value)
    if self.widget then
        self.widget:setTextAlign(value)
    end
end
