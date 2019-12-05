/**
                    * ExilelifeClient_util_array_insert
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_arr","_i","_res"];
_arr = _this select 0;
_i = _this select 2;
_res = [];
_res append (_arr select [0, _i]);
_res append (_this select 1);
_res append (_arr select [_i, count _arr - _i]);
_res
