/**
                    * ExilelifeClient_util_world_isInPrison
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_prisoner","_result","_worldConfig","_prisonLocation","_prisonEscape"];
_prisoner = _this;
_result = true;
_worldConfig = missionConfigFile >> "cfgExileLifeWorld" >> worldName;
_prisonLocation = getArray(_worldConfig >> "prisonLocation");
_prisonEscape = getNumber(_worldConfig >> "prisonEscape");
try
{ 
    if (isNull _prisoner) then 
    {
        throw false;
    };
    if !(alive _prisoner) then 
    {
        throw false;
    };
    if ((_prisoner distance2D _prisonLocation) > _prisonEscape) then
    {
        throw false;
    };
}
catch
{
    _result = _exception;
};
_result