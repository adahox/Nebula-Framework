
ParseOTXML = {}
ParseOTXML.__index = ParseOTXML

local hasRoot = nil
local parent = nil

local documentNode = nil
local lastOpeningTag = nil
local isNodeOpened = false
local widget = nil
local lastParent  = nil
local stack = {}

function ParseOTXML:run()

    local self = {}
    setmetatable(self,  {__index = ParseOTXML})
    
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
        "FlatPanel",
        "HorizontalSeparator",
        "ProgressBar"
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
        FlatPanel = FlatPanelStyle,
        HorizontalSeparator=HorizontalSeparatorStyle,
        ProgressBar=ProgressBarStyle,
    }

    for _, classe in ipairs(self.parseClassDocuments) do
        dofile(self.parseClassesPath .. "/" .. classe .. ".lua")
    end

    local otmlMainFile = self.viewPath .. "/main.otml"

    local mainOTMLContent = self:loadTemplate(otmlMainFile)
    
    self:parse(ParseOTXML:cleanMLString(mainOTMLContent))
end

function ParseOTXML:loadTemplate(fileName)
    return g_resources.readFileContents(fileName)
end

function ParseOTXML:cleanMLString(str)
    -- Substituir múltiplos espaços por um único espaço e remover quebras de linha extras
    return str:gsub("%s+", " "):gsub("\n", " "):gsub("\r", " "):gsub("^%s*(.-)%s*$", "%1")
end

function ParseOTXML:isOpeningTag(tagSignal)
    return tagSignal:sub(1, 1) == ''
end 

function ParseOTXML:isClosingTag(tagSignal)
    return tagSignal:sub(1, 1) == '/'
end 

function ParseOTXML:rootSetup()
    if not hasRoot then
        hasRoot = true
    end
end 

function ParseOTXML:setupWidgetAttributes(documentNode, attributes)
    for key, value in string.gmatch(attributes, "([%w_]+)=\"([^\"]+)\"") do
        local property = OTMLDocumentNodeProperty:new(key, value)
        documentNode:addProperty(property)
    end
end

function ParseOTXML:setupParent()
    if not isNodeOpened then
        table.insert(stack, widget)
        lastParent = parent
        parent = widget
    end

end

function ParseOTXML:setupWidget(tag)

    self:setupParent()

    widget = self.stylesMap[tag]:create(documentNode, parent)
end

function ParseOTXML:setupClosing(tagName)
    if tagName ~= lastOpeningTag then
        lastParent = table.remove(stack)
        parent = stack[#stack]
    end
end

function ParseOTXML:hasNoParent()
    return parent == nil
end

 function ParseOTXML:isValidWidget()
    return type(widget) == "table"
end

function ParseOTXML:parse(xmlString)
    
    for tagSignal, tagName, attributes, isSelfClosing in xmlString:gmatch("<(/?)([%w_]+)(.-)>") do    
        
        documentNode = OTMLDocumentNode:new(tagName)
       -- print("{\r\n'tagSignal: " .. tagSignal .. ", \r\ntagName: " .. tagName.. "\r\n}")
        if self:isOpeningTag(tagSignal) then
            lastOpeningTag = tagName
            --print("opening >> " .. tagName)
            self:rootSetup()
            self:setupWidgetAttributes(documentNode, attributes)
            self:setupWidget(tagName)
            isNodeOpened = false
        end

        if self:isClosingTag(tagSignal) then
            --print("Closing >> " .. tagName)
            self:setupClosing(tagName)
            isNodeOpened = true
        end
        
        local noParent = 'false'
        local validWidget = 'false'
        if ParseOTXML:hasNoParent() then
            noParent = 'true'
        end

        if ParseOTXML:isValidWidget() then
            validWidget = 'true'
        end


       -- print("hasNoParent: " .. noParent .. " and validWidget:" .. validWidget)
        if ParseOTXML:hasNoParent() and ParseOTXML:isValidWidget() then
            parent = widget
            -- print("parent ID: " .. parent:getId())
            lastParent = parent
            table.insert(stack, parent)
        end
    end
end