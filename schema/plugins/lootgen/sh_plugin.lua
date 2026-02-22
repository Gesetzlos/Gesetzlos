PLUGIN.name = "Procedural Loot"
PLUGIN.description = "RNG-Lootgenerator mit Base/Rarity/Prefix/Suffix."

PLUGIN.rarities = {"Common", "Rare", "Epic", "Legendary", "Relic"}
PLUGIN.prefixes = {"Savage", "Arcane", "Swift"}
PLUGIN.suffixes = {"of the Bear", "of Embers", "of Shadows"}
PLUGIN.baseItems = {"Iron Sword", "Oak Bow", "Cleric Mace"}

function PLUGIN:GenerateLoot(seed)
    local rng = seed or os.time()
    local base = self.baseItems[util.SharedRandom("base" .. rng, 1, #self.baseItems)]
    local rarity = self.rarities[util.SharedRandom("rarity" .. rng, 1, #self.rarities)]
    local prefix = self.prefixes[util.SharedRandom("prefix" .. rng, 1, #self.prefixes)]
    local suffix = self.suffixes[util.SharedRandom("suffix" .. rng, 1, #self.suffixes)]
    return string.format("%s %s %s", prefix, base, suffix), rarity
end
