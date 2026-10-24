HellWalker = HellWalker or {}

function HellWalker.isB41()
    return getCore():getGameVersion():getMajor() == 41
end
if HellWalker.isB41() then return end

function HellWalker.getResolvedPlayer(pl)
    pl = pl or getPlayer()
    if not pl or not pl.getInventory then return nil end
    return pl
end

function HellWalker.createItem(pl, fullType)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl or type(fullType) ~= "string" or fullType == "" then return nil end
    local inv = pl:getInventory()
    if not inv or not inv.AddItem then return nil end
    return inv:AddItem(fullType) or nil
end

function HellWalker.equipWornItem(pl, item)
    if not pl or not item or not pl.setWornItem or not item.getBodyLocation then return nil end
    local location = item:getBodyLocation()
    if not location then return nil end
    pl:setWornItem(location, item)
    return item
end

function HellWalker.equipBackItem(pl, item)
    if not pl or not item or not pl.setWornItem or not item.canBeEquipped then return nil end
    local location = item:canBeEquipped()
    if not location then return nil end
    pl:setWornItem(location, item)
    return item
end

function HellWalker.equipTwoHanded(pl, item)
    if not pl or not item or not pl.setPrimaryHandItem or not pl.setSecondaryHandItem then return nil end
    pl:setPrimaryHandItem(item)
    pl:setSecondaryHandItem(item)
    return item
end

function HellWalker.equipSecondary(pl, item)
    if not pl or not item or not pl.setSecondaryHandItem then return nil end
    pl:setSecondaryHandItem(item)
    return item
end

function HellWalker.createSuit(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Suit")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createArmor(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Armor")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createCape(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Cape")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createBreastplate(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Breastplate")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createLeggings(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Leggings")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createCuisse(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Cuisse")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createGreaves(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Greaves")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createSabatons(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Sabatons")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createBackpack(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Backpack")
    if not item then return nil end
    return HellWalker.equipBackItem(pl, item)
end

function HellWalker.createHelmet(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Helmet")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createCrucible(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.Crucible")
    if not item then return nil end
    return HellWalker.equipTwoHanded(pl, item)
end

function HellWalker.createBreachShield(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.BreachShield_Right")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end

function HellWalker.createLeftBreachShield(pl)
    pl = HellWalker.getResolvedPlayer(pl)
    if not pl then return nil end
    local item = HellWalker.createItem(pl, "HellWalker.BreachShield_Left")
    if not item then return nil end
    return HellWalker.equipWornItem(pl, item)
end
