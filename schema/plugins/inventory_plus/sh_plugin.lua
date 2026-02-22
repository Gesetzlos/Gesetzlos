PLUGIN.name = "Inventory Plus"
PLUGIN.description = "RPG-Inventory mit Gewicht, Slotgrößen und Equipment-Slots."

PLUGIN.defaultEquipmentSlots = {"head", "chest", "hands", "legs", "feet", "mainhand", "offhand", "ring1", "ring2", "amulet"}

function PLUGIN:GetWeightLimit(character)
    local stats = character:GetPlayerData().stats or {}
    return 30 + ((stats.str or 10) * 2)
end
