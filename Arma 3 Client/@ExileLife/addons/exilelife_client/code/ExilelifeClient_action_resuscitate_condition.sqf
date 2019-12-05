/**
                    * ExilelifeClient_action_resuscitate_condition
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_player","_result"];
_player = _this;
_result = "";
try
{
    if (isNull _player) then
    {
        throw "They dont exist...";
    };
    if (isNull player) then
    {
        throw "You dont exist...";
    };
    if !(alive _player) then
    {
        throw "They died! :(";
    };
    if !(alive player) then
    {
        throw "You died! :(";
    };
    if !(_player getVariable ['ExileLifeClientUnconscious',false]) then
    {
        throw "It appears they dont need resuscitating anymore!";
    };
    if (_player getVariable ['ExileLifeClientIncapacitated', false]) then
    {
            throw "The victim is in a revive state";
    };
    if !([player, 'Exile_Item_Instadoc'] call ExileLifeClient_util_playerCargo_contains) then
    {
        throw "You dont have a Instadoc on you!";
    };
}
catch
{
    _result = _exception;
};
_result
