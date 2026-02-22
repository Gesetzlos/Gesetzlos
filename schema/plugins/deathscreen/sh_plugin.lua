PLUGIN.name = "Deathscreen"
PLUGIN.description = "Düsterer Deathscreen mit Lootverlust-Hinweis je nach Zone."

if CLIENT then
    net.Receive("ixDeathscreen", function()
        local zone = net.ReadString()
        chat.AddText(Color(180, 0, 0), "Du bist gefallen. Zone: " .. zone)
    end)
end

if SERVER then
    util.AddNetworkString("ixDeathscreen")

    function PLUGIN:PlayerDeath(victim)
        if not IsValid(victim) then return end

        net.Start("ixDeathscreen")
        net.WriteString("raid")
        net.Send(victim)
    end
end
