
ParserOTML = {}
ParserOTML.__index = ParserOTML

function ParserOTML:run()

    local self = {}
    setmetatable(self,  {__index = ParserOTML})
    
    self.basePath = "/bot/estudo/OTUIFramework"
    self.viewPath = self.basePath .. "/view/"
    self.parseClassesPath = "OTUIFramework/core/parsers/otml/classes"
    self.stylesPath = "OTUIFramework/core/styles"
    
    self.styles = {
        "Otml",
        "Panel",
        "Label"
    }

    self.parseClassDocuments = {
        "OTMLDocument",
        "OTMLDocumentNode",
        "OTMLDocumentNodeProperty"
    }

    for _, style in ipairs(self.styles) do
        dofile(self.stylesPath .. "/" .. style .. ".lua")
    end

    self.stylesMap = {
        Otml = OTMLStyle,
        Panel = PanelStyle,
        Label = LabelStyle
    }

    for _, classe in ipairs(self.parseClassDocuments) do
        dofile(self.parseClassesPath .. "/" .. classe .. ".lua")
    end

    local otmlMainFile = self.viewPath .. "/main.otml"

    local mainOTMLContent = self:loadTemplate(otmlMainFile)
    
    self:parse(ParserOTML:cleanMLString(mainOTMLContent))
end

function ParserOTML:loadTemplate(fileName)
    return g_resources.readFileContents(fileName)
end

function ParserOTML:cleanMLString(str)
    -- Substituir múltiplos espaços por um único espaço e remover quebras de linha extras
    return str:gsub("%s+", " "):gsub("\n", " "):gsub("\r", " "):gsub("^%s*(.-)%s*$", "%1")
end


function ParserOTML:parse(mlString)
    print(mlString)
    local root = nil
    local otmlDocument = OTMLDocument:new()
    local parent = nil
    local parentNode = nil
    for isClosing, tag, attributes, selfClosing in mlString:gmatch("<(/?)([%w_]+)(.-)>") do

        print("_ : " .. isClosing)
    
        if isClosing:sub(1, 1) == '/' then
            goto continue
        else
            local documentNode = OTMLDocumentNode:new(tag)
        
            for key, value in string.gmatch(attributes, "([%w_]+)=\"([^\"]+)\"") do
                local property = OTMLDocumentNodeProperty:new(key, value)
                documentNode:addProperty(property)
            end

            if not root then
                root = documentNode
                otmlDocument:setDefaultTab(documentNode:getPropertyByName('name'))
            else
                otmlDocument:addChild(documentNode, parentNode)
                parentNode = documentNode
            end
        end


        -- Carregue o arquivo usando loadfile
        parent = self.stylesMap[tag]:create(parent)

        if (parent) then
            print("parent_id = " .. parent:getId())
        end
        
         ::continue::
    end
end

-- function ParserOTML:createWidgetFromTag(tag, attributes, parent)

--      -- implementar um load dos "styles" aqui
--     local element
--     if tagName == "Label" then
--         element = LabelUI:new(parent.widget)
--     elseif tagName == "Panel" then
--         element = PanelUI:new()
--     end

--     -- Processar os atributos da tag e configurá-los no widget
--     for key, value in string.gmatch(attributes, "([%w_]+)=\"([^\"]+)\"") do
--         print(tagName .. " {'" .. key .. "': '" .. value .. "'}")
--         if key == "id" then
--             element:setId(value)
--         elseif key == "background-color" then
--             element:setBackgroundColor(value)
--         elseif key == "textAlign" then
--             element:setTextAlign(value)
--         elseif key == "text" then
--             element:setText(value)
--         elseif key == "height" then
--             element:setHeight(value)
--         elseif key == "border-color" then
--             element:setBorderColor(value)
--         elseif key == "border-width" then
--             element:setBorderWidth(value)
--         end
--     end

--     return element
-- end