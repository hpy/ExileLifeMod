/**
                    * ExilelifeClient_object_player_event_onEnterResourcezone
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_type","_messages"];
ExileLifeClientResourceZone = true;
_type = "";
if (ExileLifeClientGangZone) then
{
    call ExileLifeClient_object_player_event_onLeaveGangzone;
};
if (ExileLifeClientRefineryZone) then
{
    call ExileLifeClient_object_player_event_onLeaveRefineryzone;
};
switch (ExileLifeResourcezone) do
{
    case "fruit":
    {
        _type = "FARM";
    };
    case "mining":
    {
        _type = "MINE";
    };
    case "artefacts":
    {
        _type = "";
    };
    case "drugs":
    {
        _type = "FARM";
    };      
    case "druglab":
    {
        _type = "";
    };   
    default {};  
};
    _messages =
    [
            [format ["%1 %2",(toUpper ExileLifeResourceType),_type], "align='left' size='0.7' font='PuristaSemibold'"],
            ["","<br/>"],
            [([daytime] call BIS_fnc_timeToString), "align='left' size='0.7' font='PuristaMedium'"]
    ];
    [_messages] spawn BIS_fnc_typeText2;
