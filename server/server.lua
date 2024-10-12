lib.callback.register('cb-farming:server:PickItem', function(source, item, location)
    local src = source
    if src == nil then return end
    return AddItem(src, item, 1)
end)