-- HOLY SHIT THIS TOOK WAY TOO LONG THAN IT SHOULDVE
function PlayerHud() 
    local client = LocalPlayer()
    local hp_red = client:Health() / client:GetMaxHealth()
    local hp_green = client:Health() / client:GetMaxHealth()
    local divisionDark = Color(20, 20, 25, 75)
    local divisionAmber = Color(255, 255, 255)
    local dynahpcolor = Color(hp_red + 200, hp_green * 255, 0, 200)
    
    if !client:Alive() then
        return
    end

    local hpBarX, hpBarY, hpBarW, hpBarH = 14, ScrH() - 100, 230, 30
    
    surface.SetDrawColor(divisionDark)
    surface.DrawRect(hpBarX, hpBarY, hpBarW, hpBarH)
    surface.SetDrawColor(Color(15, 15, 20, 220))
    surface.DrawRect(hpBarX + 2, hpBarY + 2, hpBarW - 4, hpBarH - 4)
    surface.SetDrawColor(divisionAmber)
    surface.DrawOutlinedRect(hpBarX, hpBarY, hpBarW, hpBarH)
    
    local bracketSize = 10
    surface.DrawLine(hpBarX, hpBarY, hpBarX + bracketSize, hpBarY)
    surface.DrawLine(hpBarX, hpBarY, hpBarX, hpBarY + bracketSize)
    surface.DrawLine(hpBarX + hpBarW, hpBarY, hpBarX + hpBarW - bracketSize, hpBarY)
    surface.DrawLine(hpBarX + hpBarW, hpBarY, hpBarX + hpBarW, hpBarY + bracketSize)
    surface.DrawLine(hpBarX, hpBarY + hpBarH, hpBarX + bracketSize, hpBarY + hpBarH)
    surface.DrawLine(hpBarX, hpBarY + hpBarH, hpBarX, hpBarY + hpBarH - bracketSize)
    surface.DrawLine(hpBarX + hpBarW, hpBarY + hpBarH, hpBarX + hpBarW - bracketSize, hpBarY + hpBarH)
    surface.DrawLine(hpBarX + hpBarW, hpBarY + hpBarH, hpBarX + hpBarW, hpBarY + hpBarH - bracketSize)
    
    local hpPercent = math.Clamp(client:Health() / client:GetMaxHealth(), 0, 1)
    surface.SetDrawColor(dynahpcolor)
    surface.DrawRect(hpBarX + 2, hpBarY + 2, (hpBarW - 4) * hpPercent, hpBarH - 4)
    surface.SetDrawColor(Color(255, 255, 255, 84))
    surface.DrawRect(hpBarX + 2, hpBarY + 2, (hpBarW - 4) * hpPercent, 4)
    
    draw.SimpleText("HEALTH", "HudDefault", hpBarX + 5, hpBarY - 20, divisionAmber, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
    draw.SimpleText(math.floor(client:Health()) .. " / " .. client:GetMaxHealth(), "DermaDefault", hpBarX + 120, hpBarY + 7, Color(255, 255, 255, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
    
    local balance = client:GetNetworkedInt("Balance")
    local clientarmor = client:Armor()

hook.Add("HUDPaint", "healthicon", function()
    local client = LocalPlayer()
    if not IsValid(client) or not client:Alive() then return end

    -- Colors n shit
    local divisionDark = Color(20, 20, 25, 220)
    local divisionAmber = Color(255, 253, 251)
    local barBackground = Color(15, 15, 20, 150)
    local padding = 12
    local barW = 230
    local barH = 12
    local statusW = 250
    local statusH = 140
    local statusX, statusY = 5, ScrH() - (statusH + 10)
    surface.SetDrawColor(divisionDark)
    surface.DrawRect(statusX, statusY, statusW, statusH)
    surface.SetDrawColor(divisionAmber)
    surface.DrawOutlinedRect(statusX, statusY, statusW, statusH)

    -- Brackets
    local bSize = 10
    local function DrawBrackets(x, y, w, h)
        surface.DrawLine(x, y, x + bSize, y) surface.DrawLine(x, y, x, y + bSize)
        surface.DrawLine(x + w, y, x + w - bSize, y) surface.DrawLine(x + w, y, x + w, y + bSize)
        surface.DrawLine(x, y + h, x + bSize, y + h) surface.DrawLine(x, y + h, x, y + h - bSize)
        surface.DrawLine(x + w, y + h, x + w - bSize, y + h) surface.DrawLine(x + w, y + h, x + w, y + h - bSize)
    end
    DrawBrackets(statusX, statusY, statusW, statusH)

    local currentY = statusY + 8
    draw.SimpleText("Money :", "DermaDefault", statusX + 10, currentY, divisionAmber)
    currentY = currentY + 17
    surface.SetDrawColor(divisionAmber)
    surface.DrawLine(statusX + 10, currentY, statusX + statusW - 10, currentY)
    
    -- Hunger bar
    currentY = currentY + padding
    draw.SimpleText("NUTRITION", "DermaDefault", statusX + 10, currentY + 50, divisionAmber)
    currentY = currentY + 65
    
    surface.SetDrawColor(barBackground)
    surface.DrawRect(statusX + 10, currentY, barW - 2, barH + 12)
    -- Hunger Bar
    local nutritionVal = client:GetNW2Float("EZnutrition", 0)
    local hungerPercent = math.Clamp((nutritionVal or 0) / 101, 0, 1)
    local hungerColor = (hungerPercent < 0.25) and Color(255, 50, 50) or Color(235, 150, 55)  
    surface.SetDrawColor(hungerColor)
    surface.DrawRect(statusX + 12, currentY + 2, barW * hungerPercent, barH + 10)
    -- Glossy Line So it doesnt look like total ass
    surface.SetDrawColor(Color(255, 255, 255, 52))
    surface.DrawRect(statusX + 12, currentY, barW * hungerPercent, 4)
    surface.SetDrawColor(divisionAmber)
    surface.DrawOutlinedRect(statusX + 10, currentY, barW, barH + 14)
    currentY = currentY + barH + padding

    -- Monii :3
    local balance = client:GetNWInt("Balance", 0)
    draw.SimpleText("$ " .. string.Comma(balance), "DermaDefault", statusX + 52, currentY - 118, Color(255, 255, 255), TEXT_ALIGN_LEFT)
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