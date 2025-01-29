setDefaultTab("Heal")

--print("loading healer.lua")

local ui = setupUI([[
Panel
  id: panel
  height: 900
  margin-left: 4
]])

local healerTitleLabel = LabelUI:new(ui)
healerTitleLabel:setId("healerLabel")
healerTitleLabel:setText("Healer Module")
healerTitleLabel:setBackgroundColor("#ff000055")
healerTitleLabel:setTextAlign(16)
healerTitleLabel:setRightAnchor(Anchors.AnchorRight, Parent.parent)
healerTitleLabel:setMarginBottom(4)

local botItem = BotItemUI:new(ui)
botItem:setMarginTop(4)
botItem:setTopAnchor(Anchors.AnchorBottom, Parent.prev)

local horizontalScroll = HorizontalScrollUI:new(ui)
horizontalScroll:setMarginTop(14)
horizontalScroll:setMarginLeft(4)
horizontalScroll:setTopAnchor(Anchors.AnchorBottom, healerTitleLabel:getId())
horizontalScroll:setLeftAnchor(Anchors.AnchorRight, Parent.prev)
horizontalScroll:setRightAnchor(Anchors.AnchorRight, Parent.parent)


local healerManaTitleLabel = LabelUI:new(ui)
healerManaTitleLabel:setMarginBottom(4)
healerManaTitleLabel:setMarginTop(4)
-- healerManaTitleLabel:setId("healerManaLabel")
healerManaTitleLabel:setText("Healer Mana Module")
healerManaTitleLabel:setBackgroundColor("#0000ff55")
healerManaTitleLabel:setTextAlign(16)
healerManaTitleLabel:setRightAnchor(Anchors.AnchorRight, Parent.parent)
healerManaTitleLabel:setTopAnchor(Anchors.AnchorBottom, horizontalScroll:getId())

local botManaItem = BotItemUI:new(ui)
botManaItem:setMarginTop(4)
botManaItem:setMarginBottom(4)
botManaItem:setTopAnchor(Anchors.AnchorBottom, Parent.prev)

local horizontalScrollMana = HorizontalScrollUI:new(ui)
horizontalScrollMana:setMarginTop(14)
horizontalScrollMana:setMarginLeft(4)
horizontalScrollMana:setTopAnchor(Anchors.AnchorBottom, healerManaTitleLabel:getId())
horizontalScrollMana:setLeftAnchor(Anchors.AnchorRight, Parent.prev)
horizontalScrollMana:setRightAnchor(Anchors.AnchorRight, Parent.parent)


