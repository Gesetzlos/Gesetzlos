PLUGIN.name = "Scoreboard Plus"
PLUGIN.description = "Scoreboard für 100 Spieler inkl. Klasse, Level, Fraktion, Guild, Status, Ping."

if CLIENT then
    function PLUGIN:PopulateScoreboardPlayerMenu(client, menu)
        menu:AddOption("Admin: Spectate", function() RunConsoleCommand("sam", "spectate", client:SteamID()) end)
        menu:AddOption("Admin: Inventory Inspect", function() RunConsoleCommand("ix_charinspect", client:SteamID()) end)
    end
end
