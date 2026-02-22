local PLUGIN = PLUGIN

function PLUGIN:InitializedSchema()
    ix.db.Query([[
        CREATE TABLE IF NOT EXISTS ix_gesetzlos_worlddata (
            key TEXT PRIMARY KEY,
            value TEXT NOT NULL,
            updated_at INTEGER NOT NULL
        );
    ]])
end

function PLUGIN:SetWorldData(key, value)
    local payload = util.TableToJSON(value or {})
    local now = os.time()

    ix.db.Query(string.format(
        "REPLACE INTO ix_gesetzlos_worlddata (key, value, updated_at) VALUES (%s, %s, %d)",
        ix.db.Escape(key),
        ix.db.Escape(payload),
        now
    ))
end

function PLUGIN:GetWorldData(key, callback)
    ix.db.Query(string.format("SELECT value FROM ix_gesetzlos_worlddata WHERE key = %s", ix.db.Escape(key)), function(data)
        if not callback then return end

        if data and data[1] and data[1].value then
            callback(util.JSONToTable(data[1].value) or {})
        else
            callback({})
        end
    end)
end

function PLUGIN:CharacterPreSave(character)
    local playerData = character:GetPlayerData() or {}
    playerData.lastSave = os.time()
    character:SetPlayerData(playerData)
end

function PLUGIN:PlayerLoadedCharacter(client, character)
    local data = character:GetPlayerData() or {}
    data.lastJoin = os.time()
    character:SetPlayerData(data)
end
