HealController = setmetatable({}, Controller)
HealController.__index = HealController


function HealController:create()
    local self = setmetatable({parent = Controller:make()}, HealController)

    print("HealController loaded a twice")

    return self
end