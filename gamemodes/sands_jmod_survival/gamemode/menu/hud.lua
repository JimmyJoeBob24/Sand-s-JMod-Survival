function PlayerHud() 
    local client = LocalPlayer()
    local divisionDark = Color(20, 20, 25, 220)
    local divisionAmber = Color(235, 150, 55, 255)
    local dynahpcolor = Color(235, 150, 55, 200)
    
    if !client:Alive() then
        return
    end

    local hpBarX, hpBarY, hpBarW, hpBarH = 14, ScrH() - 80, 230, 30
    
    surface.SetDrawColor(divisionDark)
    surface.DrawRect(hpBarX, hpBarY, hpBarW, hpBarH)
    surface.SetDrawColor(Color(15, 15, 20, 220))
    surface.DrawRect(hpBarX + 2, hpBarY + 2, hpBarW - 4, hpBarH - 4)
    surface.SetDrawColor(divisionAmber)
    surface.DrawOutlinedRect(hpBarX, hpBarY, hpBarW, hpBarH)
    
    local bracketSize = 15
    surface.DrawLine(hpBarX, hpBarY, hpBarX + bracketSize, hpBarY)
    surface.DrawLine(hpBarX, hpBarY, hpBarX, hpBarY + bracketSize)
    surface.DrawLine(hpBarX + hpBarW, hpBarY, hpBarX + hpBarW - bracketSize, hpBarY)
    surface.DrawLine(hpBarX + hpBarW, hpBarY, hpBarX + hpBarW, hpBarY + bracketSize)
    surface.DrawLine(hpBarX, hpBarY + hpBarH, hpBarX + bracketSize, hpBarY + hpBarH)
    surface.DrawLine(hpBarX, hpBarY + hpBarH, hpBarX, hpBarY + hpBarH - bracketSize)
    surface.DrawLine(hpBarX + hpBarW, hpBarY + hpBarH, hpBarX + hpBarW - bracketSize, hpBarY + hpBarH)
    surface.DrawLine(hpBarX + hpBarW, hpBarY + hpBarH, hpBarX + hpBarW, hpBarY + hpBarH - bracketSize)
    
    local hpPercent = math.Clamp(client:Health() / client:GetMaxHealth(), 0, 1)
    surface.SetDrawColor(Color(235, 150, 55, 255))
    surface.DrawRect(hpBarX + 2, hpBarY + 2, (hpBarW - 4) * hpPercent, hpBarH - 4)
    surface.SetDrawColor(Color(255, 205, 125, 120))
    surface.DrawRect(hpBarX + 2, hpBarY + 2, (hpBarW - 4) * hpPercent, 4)
    
    draw.SimpleText("HEALTH", "HudDefault", hpBarX + 5, hpBarY + 8, divisionAmber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(math.floor(client:Health()) .. " / " .. client:GetMaxHealth(), "DermaDefault", hpBarX + 120, hpBarY + 7, Color(255, 255, 255, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    
    local balance = client:GetNetworkedInt("Balance")
    local clientarmor = client:Armor()

hook.Add( "HUDPaint", "healthicon", function()
    local divisionDark = Color(20, 20, 25, 220)
    local divisionAmber = Color(235, 150, 55, 255)
    
    local statusX, statusY = 5, ScrH() - 150
    local statusW, statusH = 250, 140

    surface.SetDrawColor(divisionDark)
    surface.DrawRect(statusX, statusY, statusW, statusH)
    surface.SetDrawColor(divisionAmber)
    surface.DrawOutlinedRect(statusX, statusY, statusW, statusH)
    
    local bracketSize = 15
    surface.DrawLine(statusX, statusY, statusX + bracketSize, statusY)
    surface.DrawLine(statusX, statusY, statusX, statusY + bracketSize)
    surface.DrawLine(statusX + statusW, statusY, statusX + statusW - bracketSize, statusY)
    surface.DrawLine(statusX + statusW, statusY, statusX + statusW, statusY + bracketSize)
    surface.DrawLine(statusX, statusY + statusH, statusX + bracketSize, statusY + statusH)
    surface.DrawLine(statusX, statusY + statusH, statusX, statusY + statusH - bracketSize)
    surface.DrawLine(statusX + statusW, statusY + statusH, statusX + statusW - bracketSize, statusY + statusH)
    surface.DrawLine(statusX + statusW, statusY + statusH, statusX + statusW, statusY + statusH - bracketSize)
    
    draw.SimpleText("STATUS", "DermaDefault", statusX + 10, statusY + 8, divisionAmber, TEXT_ALIGN_LEFT)
    surface.SetDrawColor(divisionAmber)
    surface.DrawLine(statusX + 10, statusY + 25, statusX + statusW - 10, statusY + 25)
    
    local clientarmor = LocalPlayer():Armor()
    draw.SimpleText("Health & Armor", "DermaDefault", statusX + 10, statusY + 30, divisionAmber, TEXT_ALIGN_LEFT)
    surface.SetDrawColor(Color(200, 200, 200, 100))
    surface.DrawRect(statusX + 10, statusY + 50, 230, 12)
    local armorPercent = math.Clamp(clientarmor / 100, 0, 1)
    surface.SetDrawColor(Color(100, 200, 100, 200))
    surface.DrawRect(statusX + 10, statusY + 50, 230 * armorPercent, 12)
    surface.SetDrawColor(divisionAmber)
    surface.DrawOutlinedRect(statusX + 10, statusY + 50, 230, 12)
    
    local balance = LocalPlayer():GetNetworkedInt("Balance")
    draw.SimpleText("CREDITS : ", "DermaDefault", statusX + 10, statusY + 115, divisionAmber, TEXT_ALIGN_LEFT)
    draw.SimpleText(balance, "DermaDefault", statusX + 60, statusY + 115, Color(235, 200, 55, 255), TEXT_ALIGN_LEFT)
end)
end
hook.Add("HUDPaint", "tooltip", function()
    if input.IsKeyDown(KEY_H) then
        local divisionDark = Color(20, 20, 25, 220)
        local divisionAmber = Color(235, 150, 55, 255)
        
        local tooltipX, tooltipY = ScrW() - 300, ScrH() - 360
        local tooltipW, tooltipH = 280, 200
        
        surface.SetDrawColor(divisionDark)
        surface.DrawRect(tooltipX, tooltipY, tooltipW, tooltipH)
        surface.SetDrawColor(divisionAmber)
        surface.DrawOutlinedRect(tooltipX, tooltipY, tooltipW, tooltipH)
        
        surface.SetDrawColor(divisionAmber)
        surface.DrawRect(tooltipX, tooltipY, tooltipW, 30)
        draw.SimpleText("KEYBINDS", "DermaDefault", tooltipX + 10, tooltipY + 7, Color(20, 20, 25), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        
        draw.SimpleText("F4 : SCROUNGE", "DermaDefault", tooltipX + 10, tooltipY + 40, divisionAmber, TEXT_ALIGN_LEFT)
        draw.SimpleText("F3 : INVENTORY", "DermaDefault", tooltipX + 10, tooltipY + 65, divisionAmber, TEXT_ALIGN_LEFT)
        draw.SimpleText("B : SHOP MENU", "DermaDefault", tooltipX + 10, tooltipY + 90, divisionAmber, TEXT_ALIGN_LEFT)
        draw.SimpleText("TAB : Settings", "DermaDefault", tooltipX + 10, tooltipY + 115, divisionAmber, TEXT_ALIGN_LEFT)
        draw.SimpleText("H : Show Keybinds", "DermaDefault", tooltipX + 10, tooltipY + 140, divisionAmber, TEXT_ALIGN_LEFT)
    end
end)
function HideDefault(name)
    for k, v in pairs({"CHudHealth", "CHudBattery", "CHudSecondaryAmmo"}) do
        if name == v then 
            return false
        end
    end
end

hook.Add("HUDPaint", "PlayerHUD", PlayerHud)
hook.Add("HUDShouldDraw", "HideDefaultHud", HideDefault)