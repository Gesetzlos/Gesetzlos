local PLUGIN = PLUGIN

local function RunDBQuery(query, callback)
    if ix and ix.db and isfunction(ix.db.Query) then
        return ix.db.Query(query, callback)
    end

    if not sql then
        if callback then
            callback(nil)
        end
        return nil
    end

    local data = sql.Query(query)

    if callback then
        callback(data)
    end

    return data
end

function PLUGIN:InitializedSchema()
    RunDBQuery([[
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

    RunDBQuery(string.format(
        "REPLACE INTO ix_gesetzlos_worlddata (key, value, updated_at) VALUES (%s, %s, %d)",
        SQLStr(key),
        SQLStr(payload),
        now
    ))
end

function PLUGIN:GetWorldData(key, callback)
    RunDBQuery(string.format("SELECT value FROM ix_gesetzlos_worlddata WHERE key = %s", SQLStr(key)), function(data)
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
