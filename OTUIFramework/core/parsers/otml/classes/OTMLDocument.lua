OTMLDocument = {}
OTMLDocument.__index = OTMLDocument

function OTMLDocument:new()
    local self = setmetatable({}, { __index = OTMLDocument })
    self.children = {}

    return self
end

function OTMLDocument:addChild(child, parent)
    if not parent then
        parent = self
    end
    
    table.insert(parent.children, child)

    return child
end

function OTMLDocument:setDefaultHeaders()

end

function  OTMLDocument:setDefaultTab(tab)
    setDefaultTab(tab)
end