OTMLStyle = setmetatable({}, StylesHandler)
OTMLStyle.__index = OTMLStyle

function OTMLStyle:create(documentNode, parent)
    
    local self = setmetatable(StylesHandler:init(documentNode), StylesHandler);

    if not parent then
        parent = nil
    end

    return false
end
