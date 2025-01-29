HorizontalScrollStyle = setmetatable({}, StylesHandler)
HorizontalScrollStyle.__index = HorizontalScrollStyle

function HorizontalScrollStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), HorizontalScrollStyle);

    if not parent then
        parent = nil
    end

    local widget =  HorizontalScrollUI:new(parent)

    self:buildStyle(widget)

    return widget
end
