PLUGIN.name = "Progression"
PLUGIN.author = "Codex"
PLUGIN.description = "Level, XP, Attribut- und Talentpunkte inkl. Skilltree-Pfade."

PLUGIN.skilltrees = {
    Fighter = {"Vanguard", "Slayer", "Warlord"},
    Rogue = {"Assassin", "Trickster", "Duelist"},
    Cleric = {"Lightbearer", "Inquisitor", "Templar"},
    Wizard = {"Pyromancer", "Arcanist", "Chronomancer"},
    Ranger = {"Pathfinder", "Beastmaster", "Sharpshooter"},
    Barbarian = {"Berserker", "Juggernaut", "Warcry"}
}

function PLUGIN:GetXPRequired(level)
    return math.floor(100 * (level ^ 1.25))
end

function PLUGIN:AddXP(character, amount)
    amount = math.max(tonumber(amount) or 0, 0)

    local level = character:GetLevel() or 1
    local xp = (character:GetXP() or 0) + amount

    while xp >= self:GetXPRequired(level) do
        xp = xp - self:GetXPRequired(level)
        level = level + 1

        local data = character:GetPlayerData()
        data.statPoints = (data.statPoints or 0) + ix.config.Get("statPointPerLevel", 1)
        data.talentPoints = (data.talentPoints or 0) + ix.config.Get("talentPointPerLevel", 1)
        character:SetPlayerData(data)
    end

    character:SetLevel(level)
    character:SetXP(xp)
end
