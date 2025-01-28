-- WidgetUI
WidgetUI = {}
WidgetUI.__index = WidgetUI  

-- define parents
Parent = {
    prev='prev',
    next='next',
    parent='parent'
}
-- define âncoras 
Anchors = {
    AnchorNone = 0,
    AnchorTop = 1,
    AnchorBottom = 2,
    AnchorLeft = 3,
    AnchorRight = 4,
    AnchorVerticalCenter = 5,
    AnchorHorizontalCenter = 6
}

-- Função de criação de widget
function WidgetUI:make(widgetName, parent)

    if parent then
        return UI.createWidget(widgetName, parent.widget)
    end 

    return UI.createWidget(widgetName)
    
end

function WidgetUI:create(widgetName, parent)


    local self = setmetatable({}, WidgetUI)
    
    self.widget = WidgetUI:make(widgetName, parent)
    
    self:setId(generateWidgetIds())
    if not widgetName == "PanelUI" then
        self:setLeftAnchor(Anchors.AnchorLeft, Parent.parent)
        self:setTopAnchor(Anchors.AnchorTop, Parent.parent)
    end

    return self
end

function WidgetUI:setId(id)
    self.widget:setId(id .. "_WIDGET")
end

function WidgetUI:getId()
    return self.widget:getId()
end

-- Métodos para setar âncoras
function WidgetUI:setLeftAnchor(anchorValue, parent)
    setWidgetAnchors(self.widget, Anchors.AnchorLeft, parent, anchorValue)
end

function WidgetUI:setRightAnchor(anchorValue, parent)
    setWidgetAnchors(self.widget, Anchors.AnchorRight, parent, anchorValue)
end

function WidgetUI:setTopAnchor(anchorValue, parent)
    setWidgetAnchors(self.widget, Anchors.AnchorTop, parent, anchorValue)
end

function WidgetUI:setBottomAnchor(anchorValue, parent)
    setWidgetAnchors(self.widget, Anchors.AnchorBottom, parent, anchorValue)
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
        self.widget:setHeight(value)
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

function generateWidgetIds()
    -- Obter o timestamp atual
    local timestamp = os.time()

    -- Transformar o timestamp em uma string e gerar um hash simples
    local hash = string.format("%x", timestamp)  -- Converte o timestamp em hexadecimal

    -- Retornar o GUID simplificado
    return hash
end