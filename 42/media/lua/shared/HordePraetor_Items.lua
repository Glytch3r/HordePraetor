HordePraetor = HordePraetor or {}

function HordePraetor.isB41()
    return getCore():getGameVersion():getMajor() == 41
end
if HordePraetor.isB41() then return end

function HordePraetor.getResolvedPlayer(pl)
    pl = pl or getPlayer()
    if not pl or not pl.getInventory then return nil end
    return pl
end

function HordePraetor.createItem(pl, fullType)
    pl = HordePraetor.getResolvedPlayer(pl)
    if not pl or type(fullType) ~= "string" or fullType == "" then return nil end
    local inv = pl:getInventory()
    if not inv or not inv.AddItem then return nil end
    return inv:AddItem(fullType) or nil
end

function HordePraetor.equipWornItem(pl, item)
    if not pl or not item or not pl.setWornItem or not item.getBodyLocation then return nil end
    local location = item:getBodyLocation()
    if not location then return nil end
    pl:setWornItem(location, item)
    return item
end

function HordePraetor.equipTwoHanded(pl, item)
    if not pl or not item or not pl.setPrimaryHandItem or not pl.setSecondaryHandItem then return nil end
    pl:setPrimaryHandItem(item)
    pl:setSecondaryHandItem(item)
    return item
end

function HordePraetor.equipSecondary(pl, item)
    if not pl or not item or not pl.setSecondaryHandItem then return nil end
    pl:setSecondaryHandItem(item)
    return item
end

function HordePraetor.createPraetorSuit(pl)
    pl = HordePraetor.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HordePraetor.createItem(pl, "HordePraetor.PraetorSuit")
    if not item then return nil end
    return HordePraetor.equipWornItem(pl, item)
end

function HordePraetor.createCrucible(pl)
    pl = HordePraetor.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HordePraetor.createItem(pl, "HordePraetor.Crucible")
    if not item then return nil end
    return HordePraetor.equipTwoHanded(pl, item)
end

function HordePraetor.createBreachShield(pl)
    pl = HordePraetor.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HordePraetor.createItem(pl, "HordePraetor.BreachShield")
    if not item then return nil end
    return HordePraetor.equipSecondary(pl, item)
end
