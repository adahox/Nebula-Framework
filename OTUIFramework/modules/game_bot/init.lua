GameBot = {}
GameBot.__index = GameBot

function GameBot:create()
    print("startad GameBot")
    local self = setmetatable({}, { __index = GameBot })

    local gameBot = modules.game_bot
    local gameBotWindow = gameBot.botWindow
    local contentsPanel = gameBotWindow.contentsPanel
    self.botTabs = contentsPanel.botTabs

    if not self.botTabs then
        warn("Bot tabs not loaded")
        return
    end

    return self
end

function GameBot:addTab(tabName)
    -- print("gerando tab: " .. tabName)
    -- self.botTabs:addTab(tabName, g_ui.createWidget('BotPanel'))
    -- self.botTabs:setOn(true)
    setDefaultTab(tabName)
end

