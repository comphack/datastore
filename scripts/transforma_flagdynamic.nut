function define(script)
{
    script.Name = "transforma_flagDynamic";
    script.Type = "ActionTransform";
    return 0;
}

// Transform an ActionUpdateZoneFlags command by adding key/value pairs from
// params bound to zone flags
// - params[0]: Source flag type: ZONE, INSTANCE, CHARACTER or
//   INSTANCE_CHARACTER
// - params[1]+: Pairs of flag keys and values to set
function transform(source, cState, dState, zone, params)
{
    local worldCID = cState != null ? cState.GetWorldCID() : 0;
    if(params.len() < 3 || (params.len() % 2) != 1 || zone == null ||
        (params[0] != "ZONE" && params[0] != "INSTANCE" &&
        params[0] != "CHARACTER" && params[0] != "INSTANCE_CHARACTER"))
    {
        return -1;
    }
    else if(params[0] != "CHARACTER" && params[0] != "INSTANCE_CHARACTER")
    {
        worldCID = 0;
    }

    local flagSource = null;
    if(params[0] == "ZONE" || params[0] == "CHARACTER")
    {
        flagSource = zone;
    }
    else
    {
        flagSource = zone.GetZoneInstance();
    }

    if(flagSource == null)
    {
        return -1;
    }

    for(local i = 1; i < (params.len() - 1);)
    {
        local key = flagSource.GetFlagState(params[i].tointeger(), 0,
            worldCID);
        local val = params[i + 1].tointeger();

        action.SetFlagStatesEntry(key, val);

        i += 2;
    }

    return 0;
}