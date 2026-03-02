ix.config.Add("maxCharacters", 3, "Maximale Charakteranzahl pro Spieler.", nil, {
    data = {min = 1, max = 6},
    category = "Gesetzlos"
})

ix.config.Add("statPointPerLevel", 1, "Attributpunkte pro Level.", nil, {
    data = {min = 0, max = 5},
    category = "Gesetzlos"
})

ix.config.Add("talentPointPerLevel", 1, "Talentpunkte pro Level.", nil, {
    data = {min = 0, max = 5},
    category = "Gesetzlos"
})

ix.config.Add("zoneCheckInterval", 1, "Intervall für Zonenkontrollen in Sekunden.", nil, {
    data = {min = 1, max = 10},
    category = "Performance"
})
