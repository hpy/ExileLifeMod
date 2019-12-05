/**
                    * ExilelifeClient_gui_hud_drawConstructionBox
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_obj","_bb","_bbx","_bby","_bbz","_arr","_y","_z","_i"];
    _obj = _this;
    _bb = 
    {
        _bbx = [_this select 0 select 0, _this select 1 select 0];
        _bby = [_this select 0 select 1, _this select 1 select 1];
        _bbz = [_this select 0 select 2, _this select 1 select 2];
        _arr = [];
        0 = {
            _y = _x;
            0 = {
                _z = _x;
                0 = {
                    0 = _arr pushBack (_obj modelToWorld [_x,_y,_z]);
                } count _bbx;
            } count _bbz;
            reverse _bbz;
        } count _bby;
        _arr pushBack (_arr select 0);
        _arr pushBack (_arr select 1);
        _arr
    };
    bbox = boundingBox _obj call _bb;
    bboxr = boundingBoxReal _obj call _bb;
        for "_i" from 0 to 7 step 2 do 
        {
            drawLine3D [
                bbox select _i,
                bbox select (_i + 2),
                ExileLifeConstructionColor
            ];
            drawLine3D [
                bbox select (_i + 2),
                bbox select (_i + 3),
                ExileLifeConstructionColor
            ];
            drawLine3D [
                bbox select (_i + 3),
                bbox select (_i + 1),
                ExileLifeConstructionColor
            ];
        };
