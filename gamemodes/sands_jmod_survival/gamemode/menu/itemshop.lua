// This is a fucking mess
// i might try to organize it next update
local nagged = 0
local fuckingtired = 0
local pissedoff = {
    [1] = {
        "You can't afford this.",
        "You don't have enough money for this.",
        "Not enough cash, stranger...",
        "Hey Bud, you can't buy this.",
        "No Money, No Service",
        "Sorry Man But You have no money",
    },
    [2] = {
        "I Don't Do Charity. Move it!",
        "Are YOU F-... You can't buy this.",
        "Are you Deaf or Something?",
        "Spamming Aint Gunna do nothing",
        "Check your pockets again. Still empty?",
        "Hey Buddy You're Starting to Piss me off...",
    },
    [3] = {
        "Hey! Are you deaf or something?!",
        "STOP CLICKING!",
        "FUCKING HELL, STOP SPAMMING!",
        "GET THE FUCK OUT!",
        "STOP NAGGING ME, YOU BROKE ASS BITCH",
        "IM SO FUCKING DONE, PLEASE STOP!"
    }
}

SHOP.Categories = {
    ["Items"] = SHOP.Util,
    ["Machines"] = SHOP.Machines,
    ["Tools"] = SHOP.Tools,
    ["Medical"] = SHOP.Medical,
    ["Weapons"] = SHOP.Weapons,
    ["Armor"] = SHOP.Armor,
    ["Resources"] = SHOP.Resources
}

function SHOP.Menu()
    local scrw, scrh = ScrW(), ScrH()
    local frame = vgui.Create("DFrame")
    surface.PlaySound("isac/isac-notify.wav")
    local shopnames = "  "
    local rand = math.random(1, #shopnames)
    local disc_names = {
        "Z",
        "Y",
        "H",
        "E",
        "F",
        "D",
        "C",
    }
    local randomis = math.random(1, #disc_names)
    local xpWindow = Color(210, 228, 247, 225)
    local xpHeader = Color(46, 134, 222, 255)
    local xpPanel = Color(236, 233, 216, 255)
    local xpButton = Color(236, 236, 236, 255)
    local xpButtonHover = Color(84, 160, 255, 255)
    local xpBorder = Color(123, 146, 179, 255)
    local xpText = Color(65, 65, 65)

    frame:SetSize(scrw * .5, scrh * .8)
    frame:MakePopup()
    local fw, fh = frame:GetSize()
    frame:SetPos(scrw / 2 - fw / 2, scrh)
    frame:SetTitle(disc_names[randomis] .. ":/Users/" .. LocalPlayer():GetName() .. "/terminals/Menus.bat")
    frame:SetDraggable(true)
    frame:ShowCloseButton(true)
    frame:SetDeleteOnClose(true)
    frame.Paint = function(me,w,h)
        surface.SetDrawColor(xpWindow)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(xpHeader)
        surface.DrawRect(0, 0, w, h / 10.7)
        surface.SetDrawColor(xpBorder)
        surface.DrawOutlinedRect(0, 0, w, h)

        draw.SimpleText(shopnames[rand], "ChatFont", w / 2, h * .02, xpText, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local animDuration = 0.5
    local startY = scrh
    local targetY = scrh / 2 - fh / 2

    frame.animState = "opening"
    frame.animStartTime = CurTime()

    frame.Think = function()
        if frame.animState == "opening" then
            local progress = math.min((CurTime() - frame.animStartTime) / animDuration, 1)
            local currentY = Lerp(progress, startY, targetY)
            frame:SetPos(scrw / 2 - fw / 2, currentY)
            if progress >= 1 then
                frame.animState = "open"
            end
        elseif frame.animState == "closing" then
            local progress = math.min((CurTime() - frame.animStartTime) / animDuration, 1)
            local currentY = Lerp(progress, targetY, startY)
            frame:SetPos(scrw / 2 - fw / 2, currentY)
            if progress >= 1 then
                frame:Close()
            end
        end
    end

    local categoryBar = vgui.Create("DPanel", frame)
    categoryBar:Dock(TOP)
    categoryBar:SetTall(scrh * .03)
    categoryBar.Paint = function(me, w, h)
        surface.SetDrawColor(xpHeader)
        surface.DrawRect(0, 0, w, h)
    end

    local scroller = vgui.Create("DHorizontalScroller", categoryBar)
    scroller:Dock(FILL)
    scroller:SetOverlap(0)

    local outlinePanel = vgui.Create("DPanel", frame)
    outlinePanel:Dock(FILL)
    outlinePanel:DockMargin(5, 5, 5, 5)
    outlinePanel.Paint = function(me, w, h)
        surface.SetDrawColor(xpBorder)
        surface.DrawOutlinedRect(0, 0, w, h)
    end

    local scroll = vgui.Create("DScrollPanel", outlinePanel)
    scroll:Dock(FILL)
    scroll:DockMargin(8, 8, 8, 8)

    local function PopulateCategory(categoryName)
        scroll:Clear()
        local dataTable = SHOP.Categories[categoryName]
        if not dataTable then return end

        local frameH = frame:GetTall()
        local frameY = frameH * .01

        for k, itemData in pairs(dataTable) do
            local ItemPanel = vgui.Create("DPanel", scroll)
            ItemPanel:DockMargin(0, 0, 0, frameY)
            ItemPanel:Dock(TOP)
            ItemPanel:SetTall(frameH * .1)
            ItemPanel.Paint = function(me, w, h)
                draw.RoundedBox(4, 0, 0, w, h, xpPanel)
                surface.SetDrawColor(xpBorder)
                surface.DrawOutlinedRect(0, 0, w, h)
                draw.SimpleText(itemData.name, "Console", w * .05, h * .15, xpText, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                draw.SimpleText(itemData.description, "ChatFont", w * .08, h * .50, xpText, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                draw.SimpleText("$" .. itemData.price, "JMSF_COUNT", w * .82, h * .10, Color(59, 255, 41), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
            end
            local sellbutton = vgui.Create("DButton", ItemPanel)
            sellbutton:Dock(RIGHT)
            sellbutton:SetWide(20)
            sellbutton:SetText("")
            sellbutton:SetImage("icon16/coins.png")
            sellbutton:SetVisible(true)
            sellbutton.Paint = function(me, w, h)
                surface.SetDrawColor(me:IsHovered() and xpButtonHover or xpButton)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(Color(102, 102, 102))
                surface.DrawOutlinedRect(0, 0, w, h)
            end
            sellbutton.OnCursorEntered = function(me)
                surface.PlaySound("garrysmod/ui_hover.wav")
            end
            sellbutton.DoClick = function()
                surface.PlaySound("ui/hint.wav")
                net.Start("jshop_sell")
                net.WriteString(categoryName)
                net.WriteInt(k, 32)
                net.SendToServer()
            end
            local purchasebutton = vgui.Create("DButton", ItemPanel)
            purchasebutton:Dock(RIGHT)
            purchasebutton:SetWide(60)
            purchasebutton:SetText("")
            purchasebutton:SetImage(itemData.icon)
            purchasebutton.Paint = function(me, w, h)
                surface.SetDrawColor(me:IsHovered() and xpButtonHover or xpButton)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(xpBorder)
                surface.DrawOutlinedRect(0, 0, w, h)
            end
            purchasebutton.OnCursorEntered = function(me)
                surface.PlaySound("garrysmod/ui_hover.wav")
            end
            purchasebutton.DoClick = function()
                surface.PlaySound("ui/buttonclickrelease.wav")
                net.Start("jshop_bought")
                net.WriteString(categoryName)
                net.WriteInt(k, 32)
                net.SendToServer()
            end
        end
    end

    net.Receive("dumbfuck", function()
        surface.PlaySound("buttons/weapon_cant_buy.wav")
        notification.AddLegacy("You need To be Holding / Near the item You wanna sell", NOTIFY_ERROR, 5)
    end)

    net.Receive("brokebitch", function()
        local curTime = CurTime()
        if curTime - fuckingtired > 5 then
            nagged = 1
        else
            nagged = nagged + 1
        end
        fuckingtired = curTime

        local msgTable
        if nagged <= 2 then
            msgTable = pissedoff[1]
        elseif nagged <= 4 then
            msgTable = pissedoff[2]
        else
            msgTable = pissedoff[3]
        end

        local randomMsg = msgTable[math.random(#msgTable)]
        surface.PlaySound("buttons/weapon_cant_buy.wav")
        notification.AddLegacy(randomMsg, NOTIFY_ERROR, 5)
    end)

    for categoryName, _ in pairs(SHOP.Categories) do
        local btn = vgui.Create("DButton", scroller)
        scroller:AddPanel(btn)
        btn:SetWide(140)
        btn:DockMargin(3, 0, 3, 0)
        btn:SetText(categoryName)
        btn:SetFont("DermaDefault")
        btn:SetTextColor(Color(0, 0, 0))
        btn.Paint = function(me, w, h)
            surface.SetDrawColor(me:IsHovered() and xpButtonHover or xpButton)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(xpBorder)
            surface.DrawOutlinedRect(0, 0, w, h)
        end
        btn.OnCursorEntered = function(me)
            surface.PlaySound("garrysmod/ui_hover.wav")
        end
        btn.DoClick = function()
            PopulateCategory(categoryName)
            surface.PlaySound("ui/buttonclickrelease.wav")
        end
    end
    PopulateCategory("Items")
    return frame
end


if CLIENT then
    local menuFrame
    local tabDownPrev = false
    local bDownPrev = false

    hook.Add("Think", "OpenShop", function()
        local tabDown = input.IsKeyDown(KEY_TAB)
        local bDown = input.IsKeyDown(KEY_B)

        if tabDown and not tabDownPrev then
           -- OpenJModSettings()
        end

        if bDown and not bDownPrev then
            if IsValid(menuFrame) then
                menuFrame.animState = "closing"
                menuFrame.animStartTime = CurTime()
                menuFrame = nil
            else
                menuFrame = SHOP.Menu()
            end
        end

        tabDownPrev = tabDown
        bDownPrev = bDown
    end)
end