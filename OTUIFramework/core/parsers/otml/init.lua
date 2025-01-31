
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
        "init",
        "Otml",
        "Panel",
        "Label",
        "BotItem",
        "HorizontalScroll",
        "Tab",
        "Button",
        "Checkbox",
        "ComboBox",
        "Window",
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
        Label = LabelStyle,
        BotItem = BotItemStyle,
        HorizontalScroll = HorizontalScrollStyle,
        Tab = TabStyle,
        Button = ButtonStyle,
        Checkbox = CheckboxStyle,
        ComboBox = ComboBoxStyle,
        Window = WindowStyle,
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
    local root = nil
    local otmlDocument = OTMLDocument:new()
    local parent = nil
    local parentNode = nil
    local documentNode = nil
    local lastClosedTag = nil
    local isClosed = false
    local stack = {}
    for isClosing, tag, attributes, selfClosing in mlString:gmatch("<(/?)([%w_]+)(.-)>") do    
        
        if isClosing:sub(1, 1) == '/' then
            isClosed = true
            lastClosedTag = tag
            print("closing >> " .. tag)
            goto continue
        else
            isClosed = false
            documentNode = OTMLDocumentNode:new(tag)
        
            for key, value in string.gmatch(attributes, "([%w_]+)=\"([^\"]+)\"") do
                local property = OTMLDocumentNodeProperty:new(key, value)
                documentNode:addProperty(property)
            end

            if not root then
                root = documentNode
            else
                if (parent) then
                    print(">> openning = " .. tag .. " >> " .. parent:getName())
                end
                otmlDocument:addChild(documentNode, parentNode)
                parentNode = documentNode
            end
        end

        local widget = self.stylesMap[tag]:create(documentNode, parent)
       
        if not parent and widget then
            parent = widget
            lastClosedTag = tag
            print("parent atual: " .. tag)
            table.insert(stack, parent)
        elseif isClosed and tag == lastClosedTag then
            lastClosedTag = false
            table.remove(stack)
            print("voltando parent atual: " .. parent:getName())
            parent = stack[#stack]
        end
        
        ::continue::
        
    end
end