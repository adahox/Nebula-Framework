ProgressBarStyle = setmetatable({}, StylesHandler)
ProgressBarStyle.__index = ProgressBarStyle

function ProgressBarStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), ProgressBarStyle);

    if not parent then
        parent = nil
    end

    local widget =  ProgressBarUI:new(parent)

    self:buildStyle(widget)

    return widget
end
