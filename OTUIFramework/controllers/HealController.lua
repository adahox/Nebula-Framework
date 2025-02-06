HealController = setmetatable({}, Controller)
HealController.__index = HealController
local progressValue = 0

local button_click_me = DependenciesList.HealController.button1
local scroll = DependenciesList.HealController.scroll
local healHSvalue = DependenciesList.HealController.healHSvalue
local progress = DependenciesList.HealController.progress
button_click_me.onClick = function()
    if progressValue == 100 then
        progressValue = 0
    end
    
    progressValue = progressValue + 10
    progress:setValue(progressValue)
    healHSvalue:setText("#ffffff45")
end


-- progress.onChange = function()
--     print("changed!")    
-- end

-- button_click_me.onClick = function()
--     print("fui clicado!")
-- end