FlatPanelStyle = setmetatable({}, StylesHandler)
FlatPanelStyle.__index = FlatPanelStyle

function FlatPanelStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), FlatPanelStyle);

    if not parent then
        parent = nil
    end

    local widget =  FlatPanelUI:new(parent)

    self:buildStyle(widget)

    return widget
end
