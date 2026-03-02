PLUGIN.name = "Economy"
PLUGIN.description = "Gold/Silver/Copper, Händler, Schwarzmarkt und dynamische Preise."

function PLUGIN:AddCurrency(character, copper)
    character:SetGold(math.max((character:GetGold() or 0) + copper, 0))
end
