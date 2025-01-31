CheckboxStyle = setmetatable({}, StylesHandler)
CheckboxStyle.__index = CheckboxStyle

function CheckboxStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), CheckboxStyle);

    if not parent then
        parent = nil
    end

    local widget =  CheckboxUI:new(parent)

    self:buildStyle(widget)

    return widget
end
