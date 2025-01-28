-- define coreUI
CoreUI = {}
CoreUI.__index = CoreUI

local uiElements = {
    "Widget", -- should be the first ever
    "Label",
    "BotItem",
    "HorizontalScroll",
    "Panel"
}

function CoreUI.load(self)
    
    for _, uiElement in ipairs(uiElements) do
        -- print("loaded = " .. uiElement .."::ui")
        dofile("OTUIFramework/core/ui/".. uiElement .."/init.lua")
    end
    
    self = setmetatable({
        label=LabelUI,
        botitem=BotItemUI,
        horizontalScroll=HorizontalScrollUI,
        panel=PanelUI
    }, CoreUI)

    return self
end
