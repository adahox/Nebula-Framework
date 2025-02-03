Controller = {}
Controller.__index = Controller
ControllerContext = nil

function Controller:make()
  local self = setmetatable({}, Controller)
  self.dependencies = {}
  return self
end

function Controller:inject(dependency)
  table.insert(self.dependencies, dependency)
end