PLUGIN.name = "RPG Core"
PLUGIN.author = "Codex"
PLUGIN.description = "Zentrale Datenstrukturen, Persistenz und Performance-Hooks."

ix.util.Include("sv_plugin.lua")

ix.char.RegisterVar("race", {
    field = "race",
    fieldType = ix.type.string,
    default = "Human",
    bNoDisplay = false
})

ix.char.RegisterVar("kingdom", {
    field = "kingdom",
    fieldType = ix.type.string,
    default = "Kingdom of Iron",
    bNoDisplay = false
})

ix.char.RegisterVar("class", {
    field = "class",
    fieldType = ix.type.string,
    default = "Fighter",
    bNoDisplay = false
})

ix.char.RegisterVar("level", {
    field = "level",
    fieldType = ix.type.number,
    default = 1,
    bNoDisplay = false
})

ix.char.RegisterVar("xp", {
    field = "xp",
    fieldType = ix.type.number,
    default = 0,
    bNoDisplay = true
})

ix.char.RegisterVar("gold", {
    field = "gold",
    fieldType = ix.type.number,
    default = 0,
    bNoDisplay = false
})

ix.char.RegisterVar("playerData", {
    field = "player_data",
    fieldType = ix.type.text,
    default = "{}",
    bNoDisplay = true,
    OnGet = function(character, default)
        local raw = character.vars.playerData or default
        return util.JSONToTable(raw) or {}
    end,
    OnSet = function(character, value)
        return util.TableToJSON(value or {})
    end
})
