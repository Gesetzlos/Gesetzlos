PLUGIN.name = "Immersion"
PLUGIN.description = "Recognize-System, Gesetze, Ruf und Kriminalitätsflag."

ix.char.RegisterVar("knownNames", {
    field = "known_names",
    fieldType = ix.type.text,
    default = "{}",
    bNoDisplay = true,
    OnGet = function(character, default)
        return util.JSONToTable(character.vars.knownNames or default) or {}
    end,
    OnSet = function(character, value)
        return util.TableToJSON(value or {})
    end
})
