PanelStyle = setmetatable({}, StylesHandler)
PanelStyle.__index = PanelStyle

function PanelStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), StylesHandler);

    if not parent then
        parent = nil
    end

    local widget =  PanelUI:new(parent)
    self:buildStyle(widget)


    return widget
end
