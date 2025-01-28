PanelStyle = {}
PanelStyle.__index = PanelStyle

function PanelStyle:create(parent)
    -- criamos o Panel
    if not parent then
        parent = nil
    end

    local panel =  PanelUI:new(parent)
    panel:setId("panel_criado")
    panel:setHeight(300)
    panel:setBorderColor("#ff0000")
    panel:setBorderWidth(1)

    return panel
end
