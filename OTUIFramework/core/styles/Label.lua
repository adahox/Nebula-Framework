LabelStyle = {}
LabelStyle.__index = LabelStyle

function LabelStyle:create(parent)
    -- criamos o label
    if not parent then
        parent = nil
    end

    local label =  LabelUI:new(parent)
    label:setId("label_criado")
    label:setText("oiMundo")
    return label
end
