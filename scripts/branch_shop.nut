function define(script)
{
    script.Name = "branch_SHOP";
    script.Type = "EventBranchLogic";
    return 0;
}

function check(cState, dState, zone, params)
{
    local cZone = zone.GetDefinitionID()

    if(cZone == 20107 || cZone == 20101)
    {
        // H3 6
        return 0;
    }
    else if(cZone == 50106 || cZone == 50101)
    {
        // Babel 16
        return 1;
    }
    else if(cZone == 100106 || cZone == 100101)
    {
        // Arcadia 26
        return 2;
    }
    else if(cZone == 130106)
    {
        // Souhonzan 36
        return 3;
    }
    else
    {
        // Protopia 42
        return 4;
    }

    // Shouldn't happen
    return 0;
}