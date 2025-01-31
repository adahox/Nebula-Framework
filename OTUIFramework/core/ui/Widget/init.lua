-- WidgetUI
WidgetUI = {}
WidgetUI.__index = WidgetUI  

-- define parents
Parent = {
    prev='prev',
    next='next',
    parent='parent'
}

Anchor = {
    AnchorNone = 0,
    AnchorTop = 1,
    AnchorBottom = 2,
    AnchorLeft = 3,
    AnchorRight = 4,
    AnchorVerticalCenter = 5,
    AnchorHorizontalCenter = 6
}

-- define âncoras 
Anchors = {
    prevBottom = { Parent.prev, Anchor.AnchorBottom },
    prevTop = { Parent.prev, Anchor.AnchorTop },
    prevLeft = { Parent.prev, Anchor.AnchorLeft },
    prevRight = { Parent.prev, Anchor.AnchorRight },
    -- parent
    parentBottom = { Parent.parent, Anchor.AnchorBottom },
    parentTop = { Parent.parent, Anchor.AnchorTop },
    parentLeft = { Parent.parent, Anchor.AnchorLeft },
    parentRight = { Parent.parent, Anchor.AnchorRight },
    -- next
    nextBottom = { Parent.next, Anchor.AnchorBottom },
    nextTop = { Parent.next, Anchor.AnchorTop },
    nextLeft = { Parent.next, Anchor.AnchorLeft },
    nextRight = { Parent.next, Anchor.AnchorRight },
}

-- Função de criação de widget
function WidgetUI:make(widgetName, parent)

    if parent then
        return UI.createWidget(widgetName, parent.widget)
    end 
    print("criando widget => " .. widgetName)
    return UI.createWidget(widgetName)
    
end

function WidgetUI:create(widgetName, parent)
    
    local self = setmetatable({}, WidgetUI)
    
    self.widget = WidgetUI:make(widgetName, parent)
    
    self:setId(generateWidgetIds())
    return self
end

function WidgetUI:setId(id)
    self.widget:setId(id)
end

function WidgetUI:getId()
    return self.widget:getId()
end


function WidgetUI:setName(widgetName)
    self.name = widgetName
end

function WidgetUI:getName()
    if not self.name then
        return ""
    end
    
    return self.name
end

-- Métodos para setar âncoras
function WidgetUI:setLeftAnchor(value)
    local anchor = handleAnchors(value)
    setWidgetAnchors(self.widget, Anchor.AnchorLeft, anchor.parent, anchor.alignment)
end

function WidgetUI:setRightAnchor(value)
    local anchor = handleAnchors(value)
    setWidgetAnchors(self.widget, Anchor.AnchorRight, anchor.parent, anchor.alignment)
end

function WidgetUI:setTopAnchor(value)
    local anchor = handleAnchors(value)
    setWidgetAnchors(self.widget, Anchor.AnchorTop, anchor.parent, anchor.alignment)
end

function WidgetUI:setBottomAnchor(value)
    local anchor = handleAnchors(value)
    setWidgetAnchors(self.widget, Anchor.AnchorBottom, anchor.parent, anchor.alignment)
end

function WidgetUI:setAnchor(value)

    local table = Utils.split(value, ",")
    local widgetAnchored
    local reference
    local widgetReferenceAnchor
    if type(table) == "table" then
        widgetAnchored = Anchor[table[1]]
        reference = table[2] -- actually it is a widget ID
        widgetReferenceAnchor = Anchor[table[3]]
    else
        print("Não foi encontrado uma table para processar o setAnchor()")
        return false
    end

    setWidgetAnchors(self.widget, widgetAnchored, reference, widgetReferenceAnchor)
end

-- Método privado para ancorar widgets
function setWidgetAnchors(widget, widgetAnchor, parent, anchorValue)
    widget:addAnchor(widgetAnchor, parent, anchorValue)
end

function WidgetUI:setMarginTop(value)
    if self.widget then
        self.widget:setMarginTop(value)
    end
end

function WidgetUI:setMarginBottom(value)
    if self.widget then
        self.widget:setMarginBottom(value)
    end
end

function WidgetUI:setMarginRight(value)
    if self.widget then
        self.widget:setMarginRight(value)
    end
end

function WidgetUI:setMarginLeft(value)
    if self.widget then
        self.widget:setMarginLeft(value)
    end
end

function WidgetUI:setHeight(value)
    if self.widget then
        self.widget:setHeight(tonumber(value))
    end
end

function WidgetUI:setBorderWidth(value)
    if self.widget then
        self.widget:setBorderWidth(value)
    end
end

function WidgetUI:getBorderWidth()
    if self.widget then
        self.widget:getBorderWidth()
    end
end

function WidgetUI:setBorderColor(value)
    if self.widget then
        self.widget:setBorderColor(value)
    end
end

function WidgetUI:getBorderColor()
    if self.widget then
        self.widget:getBorderColor()
    end
end

function WidgetUI:setText(value)
    if self.widget then
        self.widget:setText(value)
    end
end

function WidgetUI:getText()
    if self.widget then
        self.widget:getText()
    end
end

function WidgetUI:setBackgroundColor(value)
    if self.widget then
        self.widget:setBackgroundColor(value)
    end
end

function WidgetUI:setTextAlign(value)
    if self.widget then
        self.widget:setTextAlign(value)
    end
end

function WidgetUI:addOption(value)
    if self.widget then
        self.widget:addOption(value)
    end
end

function WidgetUI:setWidth(value)
    if self.widget then
        self.widget:setWidth(value)
    end
end

function WidgetUI:setTitle(value)
    if self.widget then
        self.widget:setTitle(value) 
    end
end

function handleAnchors(value)
    
    local valor = Anchors[value]
    local parent = valor[1]
    local alignment = valor[2]
   -- print(parent, alignment)
    return {
        parent=parent,
        alignment=alignment
    }
end

function generateWidgetIds()
    -- Obter o timestamp atual
    local timestamp = os.time()

    -- Transformar o timestamp em uma string e gerar um hash simples
    local hash = string.format("%x", timestamp)  -- Converte o timestamp em hexadecimal

    -- Retornar o GUID simplificado
    return hash
end