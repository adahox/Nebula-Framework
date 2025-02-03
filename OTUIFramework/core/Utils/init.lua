Utils = {}
Utils.__index = Utils

function Utils.split(str, delimiter)
    local result = {}
    for part in string.gmatch(str, "([^" .. delimiter .. "]+)") do
        table.insert(result, part)
    end
    return result
end


--[[
    this method loads a class from two string params.

    pathFile  - Receives the path where locates the file
    className - receives class name 
    methodName - Receives the method to intanciate
]]--
function Utils.loadClass(pathFile, className, methodName)

    dofile(pathFile .. className .. ".lua")
    
    local code = className .. ":" .. methodName .. "()"


    local status, instance = pcall("HealController.create")

    print(status)

    return instance
end