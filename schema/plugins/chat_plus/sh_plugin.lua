PLUGIN.name = "Chat Plus"
PLUGIN.description = "Immersive Chat-Kanäle: Lokal, Fraktion, Guild, Party, Raid."

ix.chat.Register("faction", {
    format = "[Fraktion] %s: %s",
    color = Color(120, 180, 255),
    CanSay = function(self, speaker)
        return IsValid(speaker) and speaker:GetCharacter() ~= nil
    end
})
