SHOP.Categories = {
    ["items"] = SHOP.Items,
    ["machines"] = SHOP.machines,
    ["tools"] = SHOP.tools,
    ["meds"] = SHOP.meds,
    ["guns"] = SHOP.guns,
}

function SHOP.Menu()
    local scrw, scrh = ScrW(), ScrH()
    local frame = vgui.Create("DFrame")
    local shopnames = {
        "Legally Distinct Shop",
        "SandMan's Twiddly Dinkles",
        "Seap, Pronounced Shawp",
        "Papa B's PawnShop",
        "Legally Distinct Ammu-nation",
        "NotSo Hip-Shop",
        "Frown OS",
    }
    local rand = math.random(1, #shopnames)

    frame:SetSize(scrw * .5, scrh * .8)
    frame:MakePopup()
    frame:Center()
    frame:SetTitle(shopnames[rand])
    frame.Paint = function(me,w,h)
        surface.SetDrawColor(faded_black)
        surface.DrawRect(0, 0, w, h) 
        
        draw.SimpleText("", "ScannedCool", w / 2, h * .02, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    local categoryBar = vgui.Create("DPanel", frame)
    categoryBar:Dock(TOP)
    categoryBar:SetTall(scrh * .05)
    categoryBar.Paint = function() end

    local scroll = vgui.Create("DScrollPanel", frame)
    scroll:Dock(FILL)

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
                draw.SimpleText(itemData.name, "ScannedCool", w * .1, h * .15, textColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                draw.SimpleText(itemData.description, "ScannedCoolshop2", w * .1, h * .45, textColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
                draw.SimpleText("$" .. itemData.price, "ScannedCoolshop1", w * .1, h * .68, textColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            end

            local purchasebutton = vgui.Create("DButton", ItemPanel)
            purchasebutton:SetSize(scrw * .05, scrh * .8)
            purchasebutton:SetText("")
            purchasebutton:Dock(FILL)
            purchasebutton:SetImage(itemData.icon)
            purchasebutton.Paint = function(me, w, h)
                surface.SetDrawColor(Color(5, 5, 5, 105))
                surface.DrawRect(0, 0, w, h)
            end

            purchasebutton.DoClick = function()
                net.Start("jshop_bought")
                net.WriteString(categoryName)
                net.WriteInt(k, 32)
                net.SendToServer()
            end
        end
    end

    for categoryName, _ in pairs(SHOP.Categories) do
        local btn = vgui.Create("DButton", categoryBar)
        btn:Dock(LEFT)
        btn:SetText(categoryName)
        btn:SetFont("ScannedCool")
        btn:SetTextColor(textColor)
        btn.Paint = function(me, w, h)
            surface.SetDrawColor(Color(20, 20, 20, 180))
            surface.DrawRect(0, 0, w * 4, h)
        end
        btn.DoClick = function()
            PopulateCategory(categoryName)
        end
    end
    PopulateCategory("Items")
end

if CLIENT then
    local shopopenz = false

    hook.Add("Think", "OpenShop", function()
        if input.IsKeyDown(KEY_TAB) then
            if not shopopenz then
                shopopenz = true
                if SHOP and SHOP.Menu then
                    SHOP.Menu()
                end
            end
        else
            shopopenz = false
        end
    end)
end