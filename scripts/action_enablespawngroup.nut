function define(script)
{
    script.Name = "action_enableSpawnGroup";
    script.Type = "ActionCustom";
    return 0;
}

function run(source, cState, dState, zone, server, params)
{
    local cZone = zone.GetDefinitionID()
    if(cZone != null)
    {
        for(local i = 0; i < params.len(); i++)
        {
            zone.EnableDisableSpawnGroup(params[i].tointeger(), true);
        }
        return Result_t.SUCCESS;
    }
    return -1
}