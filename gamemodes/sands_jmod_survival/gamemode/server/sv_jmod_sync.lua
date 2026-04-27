-- Holy FUCK this is bad, but it works and I don't care enough to make it better

-- The All Mighty IF Statement Pyramid
timer.Create("Force_JMod_Nutrition_Sync", 1, 0, function()
    for _, ply in ipairs(player.GetAll()) do
        if IsValid(ply) and ply:Alive() then
            if ply.EZnutrition and ply.EZnutrition.Nutrients then
                local currentVal = ply.EZnutrition.Nutrients
                if ply:GetNW2Float("EZnutrition", -1) != currentVal then
                    ply:SetNW2Float("EZnutrition", currentVal)
                end
            end
        end
    end
end)