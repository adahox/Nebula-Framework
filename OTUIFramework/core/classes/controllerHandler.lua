Controller = {}
Controller.__index = Controller
ControllerContext = nil

DependenciesList = {}



-- dependencyName: how you will call this dependency at controller
-- dependenecy: dependency object associated to controller
function Controller.inject(dependencyName, dependency)

  if not DependenciesList[ControllerContext] then
    DependenciesList[ControllerContext] = {}
  end  
  if not dependency then
    print("Dependency is null")
  else
    print("Adicionando " .. dependencyName .. " on " .. ControllerContext)
    DependenciesList[ControllerContext][dependencyName] = dependency
  end
  
end