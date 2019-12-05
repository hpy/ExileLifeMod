/**
                    * ExilelifeServer_util_messaging_buildMessage
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

                    private["_msgID","_thread","_messageBlock"];
_msgID = _this;
_thread = _msgID call ExileLifeServer_system_messaging_getThread;
_messageBlock = nil;
if !(isNil "_thread")then
{
    _messageBlock =
    [
            _msgID,
            _thread
    ];
};
_messageBlock
