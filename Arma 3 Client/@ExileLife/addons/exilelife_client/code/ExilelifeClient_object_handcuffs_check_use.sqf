/**
                    * ExilelifeClient_object_handcuffs_check_use
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_success"];
_success = true;
try
{
    if !(alive player) then
    {
        throw false;
    };
    if !(isPlayer ExileClientInteractionObject) then
    {
        throw false;
    };
    if !(alive ExileClientInteractionObject) then
    {
        throw false;
    };
    if (ExileClientIsHandcuffed) then
    {
        throw false;
    };
    if (ExileClientInteractionObject isEqualTo player) then
    {
        throw false;
    };
    if (ExileClientInteractionObject getVariable ['ExileLifeClientIncapacitated', false]) then
    {
        throw false;
    };
    if (ExileClientInteractionObject getVariable ["ExileIsHandcuffed", false]) then
    {
        throw false;
    };
    if ((count currentThrowable player) == 0) then {
        throw false;
    };
    if !(((currentThrowable player) select 0) isEqualTo "Exile_Item_ZipTie") then
    {
        throw false;
    };
    if ((player distance ExileClientInteractionObject) > 2) then
    {
        throw false;
    };
}
catch
{
    _success = _exception;
};
_success
