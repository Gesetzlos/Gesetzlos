SCHEMA.name = "Gesetzlos"
SCHEMA.author = "Codex"
SCHEMA.description = "Modulares mittelalterliches RP-MMO Framework auf Helix-Basis."

ix.util.Include("sh_config.lua")

-- Hilfsfunktion für Gold/Silver/Copper Darstellung
function SCHEMA:FormatCurrency(copper)
    copper = math.max(math.floor(tonumber(copper) or 0), 0)

    local gold = math.floor(copper / 10000)
    local silver = math.floor((copper % 10000) / 100)
    local c = copper % 100

    return string.format("%dg %ds %dc", gold, silver, c)
end
