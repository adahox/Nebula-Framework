OTMLDocumentNodeProperty = {}
OTMLDocumentNodeProperty.__index = OTMLDocumentNodeProperty

function OTMLDocumentNodeProperty:new(name, value)
    local self = setmetatable({}, OTMLDocumentNodeProperty)
    self.name = name
    self.value = value

    return self
end


function OTMLDocumentNodeProperty:getName()
    return self.name
end


