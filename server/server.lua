lib.callback.register('cb-farming:server:PickItem', function(source, item, location)
    local src = source
    if src == nil then return false end
    local coords = GetPlayerCoords(src)
    if #(coords - location) > 2.5 then return false end
    return AddItem(src, item, 1)
end)