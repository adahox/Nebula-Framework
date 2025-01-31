WindowStyle = setmetatable({}, StylesHandler)
WindowStyle.__index = WindowStyle

function WindowStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), WindowStyle);

    if not parent then
        parent = nil
    end

    local widget =  WindowUI:new(parent)

    self:buildStyle(widget)

    return widget
end
