HorizontalSeparatorStyle = setmetatable({}, StylesHandler)
HorizontalSeparatorStyle.__index = HorizontalSeparatorStyle

function HorizontalSeparatorStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), HorizontalSeparatorStyle);

    if not parent then
        parent = nil
    end

    local widget =  HorizontalSeparatorUI:new(parent)

    self:buildStyle(widget)

    return widget
end
