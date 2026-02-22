PLUGIN.name = "Inventory Plus"
PLUGIN.description = "RPG-Inventory mit Gewicht, Slotgrößen und Equipment-Slots."

PLUGIN.defaultEquipmentSlots = {"head", "chest", "hands", "legs", "feet", "mainhand", "offhand", "ring1", "ring2", "amulet"}

function PLUGIN:GetWeightLimit(character)
    if not character then
        return 30
    end

    local playerData = character.GetPlayerData and character:GetPlayerData() or {}
    local stats = playerData.stats or {}

    return 30 + ((tonumber(stats.str) or 10) * 2)
end
