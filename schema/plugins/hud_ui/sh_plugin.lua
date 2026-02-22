PLUGIN.name = "HUD UI"
PLUGIN.description = "Mittelalterliches, minimalistisches HUD mit HP/Stamina/Mana/Buffs/Gold/Raidtimer."

if CLIENT then
    function PLUGIN:HUDPaint()
        local client = LocalPlayer()
        if not IsValid(client) then return end

        local hp = client:Health()
        draw.SimpleTextOutlined("HP: " .. hp, "DermaLarge", 32, ScrH() - 96, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, color_black)
    end
end
