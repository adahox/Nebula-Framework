ComboBoxStyle = setmetatable({}, StylesHandler)
ComboBoxStyle.__index = ComboBoxStyle

function ComboBoxStyle:create(documentNode, parent)

    local self = setmetatable(StylesHandler:init(documentNode), ComboBoxStyle);

    if not parent then
        parent = nil
    end

    local widget =  ComboBoxUI:new(parent)
    widget:addOption("opcao 1")
    widget:addOption("opcao 2")
    widget:addOption("opcao 3")
    self:buildStyle(widget)

    return widget
end
