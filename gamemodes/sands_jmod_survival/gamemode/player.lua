function ply:SetupDataTables()

    self:NetworkVar( "int", 0, "Balance" )


    if SERVER then
        self:SetBalance( 3 )
    end

end