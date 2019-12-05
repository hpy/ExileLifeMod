/**
                    * ExilelifeClient_util_debugLog
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_log"];
_log = format["[EXILE LIFE DEBUG] - %1", _this];
diag_log _log;
ExileLifeLogs_Client_Debug pushBack _log;
