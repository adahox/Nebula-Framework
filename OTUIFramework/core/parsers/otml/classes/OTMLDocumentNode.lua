OTMLDocumentNode = {}
OTMLDocumentNode.__index = OTMLDocumentNode

function OTMLDocumentNode:new(widgetName)
    local self = setmetatable({}, OTMLDocumentNode)

    self.widgetName = widgetName
    self.properties = {}
    self.children = {}

    return self
end

function OTMLDocumentNode:addProperty(property)
    table.insert(self.properties, property)
end

function OTMLDocumentNode:getPropertyByName(name)

    for _, property in ipairs(self.properties) do
        if property:getName() == name then
            return property.valor
        end
    end
end

