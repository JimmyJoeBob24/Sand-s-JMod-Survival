function PlayerHud() 
    faded_black = Color(0, 0, 0, 200)
    local client = LocalPlayer()
    local dynahpcolor = Color(client:GetMaxHealth() - 50, client:Health(), 0 ,188) 
    local dynahpgirth = client:Health() * 2.4
    local dynahpmaxhi = client:GetMaxHealth()
    local minhp = dynahpgirth - dynahpmaxhi
    //Ik its redundant but i like to fuck arround with variables 
    if !client:Alive() then
        return
    end

    //Dynamic Hp Bar
    //Reference draw.RoundedBox(cornerRadius,x, y, width,  height, color)
    draw.RoundedBox(4, 40, ScrH() - 40, 140, 10, faded_black)
    draw.RoundedBox(4, 40, ScrH() - 40, math.Clamp(dynahpmaxhi,minhp,dynahpgirth), 10, dynahpcolor)

    --Tooltips or whatever the fuck it's called

    if GetConVar("toolteeps"):GetBool() then

        draw.RoundedBox(4,ScrW() - 262, ScrH() -360, 255, 193,Color( 40, 45, 35, 42 ))
        draw.RoundedBox(2,ScrW() - 262, ScrH() -360, 255, 30,Color( 40, 45, 35, 200 ))
        draw.SimpleText("Keybinds ","ScannedCool",ScrW() - 130, ScrH() - 358, Color(255, 100, 100, 200), TEXT_ALIGN_CENTER )
        draw.SimpleText("F4 : Scrounge / Scavenge","ScannedCoolshop1",ScrW() - 260, ScrH() - 320, Color(255, 250, 255, 150), TEXT_ALIGN_LEFT )
        draw.SimpleText("F3 : Open Inventory","ScannedCoolshop1",ScrW() - 260, ScrH() - 262, Color(255, 250, 255, 150), TEXT_ALIGN_LEFT )
        draw.SimpleText("TAB : Open The Shop Menu","ScannedCoolshop1",ScrW() - 260, ScrH() - 200, Color(255, 250, 255, 150), TEXT_ALIGN_LEFT )
    end

    local balance = client:GetNetworkedInt("Balance")
    //client related vars
    local clientarmor = client:Armor()
    //Other Color vars
    local armorgleen = Color(0,150,150, clientarmor)

hook.Add( "HUDPaint", "healthicon", function()
    draw.RoundedBox(4, 5, ScrH() - 55, 188, 45, faded_black)
    draw.RoundedBox(2, 5, ScrH() - 110, 188, 45, faded_black)
    draw.RoundedBox(2, 5, ScrH() - 130, 150, 20, faded_black)

    draw.SimpleText( "Status : " , "ScannedCool", ScrW() - 1345, ScrH() - 130, Color( 255, 255, 255, 255 ))
    draw.SimpleText( "t", "JMSF", ScrW() - 1335, ScrH() - 123, armorgleen, TEXT_ALIGN_CENTER )
    draw.SimpleText( "k", "JMSF", ScrW() - 1340, ScrH() - 68, dynahpcolor, TEXT_ALIGN_CENTER )
    draw.SimpleText( "g", "JMSF_CHEAP", ScrW() - 1340, ScrH() - 180, Color(105, 250, 65, 250), TEXT_ALIGN_CENTER )
    draw.SimpleText( balance, "JMSF_COUNT", ScrW() - 1260, ScrH() - 189, Color(105, 250, 65, 250), TEXT_ALIGN_CENTER )
    --idk why but deleting THIS SPECEFIC COMMENT IN PARTICULAR BREAKS EEVERYTHING, DO NOT FUCKING TOUCH IT
end)
    -- poor man's DRM i guess...
end

function HideDefault(name)
    for k, v in pairs({"CHudHealth", "CHudBattery", "CHudSecondaryAmmo"}) do
        if name == v then 
            return false
        end
    end
end

hook.Add("HUDPaint", "PlayerHUD", PlayerHud)
hook.Add("HUDShouldDraw", "HideDefaultHud", HideDefault)