Controller = {}
Controller.__index = {}

-- entendendo o contexto:
-- cada "tab" na view será tratada como uma controller. então se tenho uma tab "HP", teremos um controller para gerenciar todos esses elementos ou widgets da tab.
-- por exemplo:
-- considere uma tab com 2 widgets: panel e label.
-- o controller responsável por essa tab, terá acesso a esses 2 widgets. é injeção será feita em algum momento

function Controller:new()

end 