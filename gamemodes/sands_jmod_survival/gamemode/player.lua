--i lowkey FUCKING hate Networking with a firey passion of a thousand suns
--  Set up Player Vars
function ply:SetupDataTables()
    self:NetworkVar( "int", 0, "Balance" )
    if SERVER then
        self:SetBalance( 3 )
    end
end