StylesHandler = {}
StylesHandler.__index = StylesHandler

function StylesHandler:init(documentNode)
    local self = setmetatable({}, {__index = StylesHandler})
    self.documentNode = documentNode

    self.styleProperties = {
        id = WidgetUI.setId,
        text = WidgetUI.setText,
        backgroundColor = WidgetUI.setBackgroundColor,
        borderColor = WidgetUI.setBorderColor,
        borderWidth = WidgetUI.setBorderWidth,
        height = WidgetUI.setHeight,
        textAlign = WidgetUI.setTextAlign,
        top = WidgetUI.setTopAnchor,
        bottom = WidgetUI.setBottomAnchor,
        left = WidgetUI.setLeftAnchor,
        right = WidgetUI.setRightAnchor,
        anchor = WidgetUI.setAnchor,
        marginLeft = WidgetUI.setMarginLeft,
        marginRight = WidgetUI.setMarginRight,
        marginTop = WidgetUI.setMarginTop,
        marginBottom = WidgetUI.setMarginBottom,
    }

    return self
end

function StylesHandler:buildStyle(widget)
    for _, property in ipairs(self.documentNode.properties) do
         --print("\r\n" .. property.name .. " => " .. property.valor)
        -- Verifica se a propriedade existe em styleProperties
        local func = self.styleProperties[property.name]
        
        func(widget, property.valor)  -- Corrected: call the function with widget as the first argument

        print("widgetId = " .. widget:getId())
        end
end