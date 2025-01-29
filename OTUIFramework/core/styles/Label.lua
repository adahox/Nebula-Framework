LabelStyle = setmetatable({}, StylesHandler)
LabelStyle.__index = LabelStyle

function LabelStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), LabelStyle);

    if not parent then
        parent = nil
    end

    local widget =  LabelUI:new(parent)

    self:buildStyle(widget)

    return widget
end
