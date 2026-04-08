local function CreateSettingsPanel()
    if IsValid(JModSettingsFrame) then
        JModSettingsFrame:MakePopup()
        return
    end

    local scrw, scrh = ScrW(), ScrH()
    JModSettingsFrame = vgui.Create("DFrame")
    JModSettingsFrame:SetTitle("JMod Survival Admin Settings")
    JModSettingsFrame:SetSize(math.min(520, scrw * 0.48), math.min(500, scrh * 0.7))
    JModSettingsFrame:Center()
    JModSettingsFrame:MakePopup()
    JModSettingsFrame:SetDeleteOnClose(true)
    JModSettingsFrame:SetSizable(false)

    JModSettingsFrame.Paint = function(me, w, h)
        draw.RoundedBox(8, 0, 0, w, h, Color(165, 165, 165))
    end

    local scroll = vgui.Create("DScrollPanel", JModSettingsFrame)
    scroll:Dock(FILL)
    scroll:DockMargin(8, 8, 8, 8)

    local form = vgui.Create("DForm", scroll)
    form:SetName("JMod Survival Server Settings")
    form:Dock(TOP)
    form:SetSpacing(10)
    form:SetPadding(10)
    form:SetExpanded(true)
    form:CheckBox("Start With ToolBox", "toolsbool")
    form:CheckBox("Start With Some Tools (Pickaxe, Axe, Bucket)", "kitstart")
    form:NumSlider("Starting Money", "bigbucks", 0, 5000, 0)
    form:CheckBox("Show Controls Overlay", "toolteeps")
    form:CheckBox("Enable Shop", "shoptoggle")

    local hint = vgui.Create("DLabel", scroll)
    hint:SetText("Use command sandsjmod_settings to reopen this panel.")
    hint:SetFont("DermaDefault")
    hint:SetTextColor(Color(200, 200, 200))
    hint:SetWrap(true)
    hint:Dock(TOP)
    hint:DockMargin(0, 12, 0, 0)
    hint:SetAutoStretchVertical(true)
end

function OpenJModSettings()
    CreateSettingsPanel()
end

concommand.Add("sandsjmod_settings", function()
    OpenJModSettings()
end)

concommand.Add("sandsjmod_blankpanel", function()
    OpenJModBlankPanel()
end)
