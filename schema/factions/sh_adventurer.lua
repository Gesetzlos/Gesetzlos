FACTION.name = "Abenteurer"
FACTION.description = "Freie Abenteurer ohne feste Fraktionsbindung."
FACTION.color = Color(110, 110, 110)
FACTION.isDefault = true
FACTION.models = {
    "models/Humans/Group01/male_01.mdl",
    "models/Humans/Group01/male_02.mdl",
    "models/Humans/Group01/female_01.mdl"
}

function FACTION:OnCharacterCreated(client, character)
    local data = character:GetPlayerData() or {}
    data.stats = data.stats or {
        str = 10,
        vit = 10,
        int = 10,
        agi = 10,
        faith = 10
    }
    character:SetPlayerData(data)
end

FACTION_ADVENTURER = FACTION.index
