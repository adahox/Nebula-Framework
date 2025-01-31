ButtonStyle = setmetatable({}, StylesHandler)
ButtonStyle.__index = ButtonStyle

function ButtonStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), ButtonStyle);

    if not parent then
        parent = nil
    end

    local widget =  ButtonUI:new(parent)

    self:buildStyle(widget)

    return widget
end
