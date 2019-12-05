/**
                    * ExilelifeServer_admintools_system_network_notify
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

                    private["_sessionID","_message"];
params [["_sessionID",""],["_message",""]];
if !(_sessionID isEqualTo "" || _message isEqualTo "") then
{
    [_sessionID, "toastRequest", ["SuccessTitleAndText", ["Exile Life Tools", _message]]] call ExileServer_system_network_send_to;
};
