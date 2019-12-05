/**
                    * ExilelifeServer_system_session_createPrisonerID
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

                    private["_pid","_prisonerID","_pidLength","_diff","_i"];
_pid = _this;
_prisonerID = ["EX"];
_pidLength = count(str(_pid));
if (_pidLength < 6) then
{
    _diff = 6 - _pidLength;
    for "_i" from 1 to _diff do
    {
        _prisonerID pushBack "0";
    };
    _prisonerID pushBack str(_pid);
}
else
{
    _prisonerID pushBack str(_pid);
};
(_prisonerID joinString "")
