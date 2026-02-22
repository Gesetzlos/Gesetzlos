PLUGIN.name = "Character Plus"
PLUGIN.author = "Codex"
PLUGIN.description = "Rasse/Königreich/Klasse und Attribut-Rollsystem."

PLUGIN.races = {
    Human = {stats = {str = 0, vit = 0, int = 0, agi = 0, faith = 0}},
    Duskborne = {stats = {int = 2, faith = 1, vit = -1}},
    Stonekin = {stats = {vit = 2, agi = -1}},
    Sylvan = {stats = {agi = 2, str = -1}}
}

PLUGIN.kingdoms = {
    ["Kingdom of Iron"] = {spawn = "iron_capital", tax = 1.0},
    ["Holy Dominion"] = {spawn = "holy_square", tax = 0.95},
    ["Shadow Pact"] = {spawn = "shadow_den", tax = 1.1}
}

PLUGIN.classes = {
    Fighter = {primary = "str", resources = {stamina = 120}},
    Rogue = {primary = "agi", resources = {stamina = 130}},
    Cleric = {primary = "faith", resources = {mana = 110, focus = 100}},
    Wizard = {primary = "int", resources = {mana = 130, focus = 90}},
    Ranger = {primary = "agi", resources = {stamina = 110, focus = 80}},
    Barbarian = {primary = "str", resources = {stamina = 140}}
}

function PLUGIN:RollAttributes(seed)
    local rolls = {}

    for i = 1, 3 do
        local rollSeed = (seed or os.time()) + (i * 100)
        rolls[i] = {
            str = util.SharedRandom("str" .. rollSeed, 6, 18),
            vit = util.SharedRandom("vit" .. rollSeed, 6, 18),
            int = util.SharedRandom("int" .. rollSeed, 6, 18),
            agi = util.SharedRandom("agi" .. rollSeed, 6, 18),
            faith = util.SharedRandom("faith" .. rollSeed, 6, 18)
        }
    end

    return rolls
end
