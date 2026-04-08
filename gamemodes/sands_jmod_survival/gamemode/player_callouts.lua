if SERVER then
    hook.Add("PlayerDisconnected", "SandJMod_PlayerLeaveSound", function(ply)
        BroadcastLua('surface.PlaySound("sounds/isac/playerleave.wav")')
    end)
end