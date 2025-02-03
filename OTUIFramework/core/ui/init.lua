-- define coreUI
CoreUI = {}
CoreUI.__index = CoreUI

local uiElements = {
    "Widget", -- should be the first ever
    "Label",
    "BotItem",
    "HorizontalScroll",
    "Panel",
    "Button",
    "Checkbox",
    "ComboBox",
    "Window",
    "FlatPanel",
    "HorizontalSeparator",
    "ProgressBar"
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
        panel=PanelUI,
        button=ButtonUI,
        window=WindowUI,
        flatPanel=FlatPanelUI,
        horizontalSeparator=HorizontalSeparatorUI,
        progressBar=ProgressBarUI,
    }, CoreUI)

    return self
end
