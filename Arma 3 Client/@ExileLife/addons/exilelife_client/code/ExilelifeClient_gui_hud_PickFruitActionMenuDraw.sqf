/**
                    * ExilelifeClient_gui_hud_PickFruitActionMenuDraw
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_treeType","_positionobject","_object","_positionobjectx","_positionobjecty","_positionobjectz","_IconColour","_Icon","_IconColour2","_selected","_DistTreePos","_ExileLifeFruit","_Sp","_SpX","_SpY"];
_treeType = _this select 0;
_positionobject = _this select 1;
_object = _this select 2;
_positionobjectx = _positionobject select 0;
_positionobjecty = _positionobject select 1;
_positionobjectz  = (_positionobject select 2)+1.5;
_IconColour = [1,1,1,1];
_Icon="";
_IconColour2 = "";
_selected = false;
_DistTreePos = player distance _positionobject;
if(_DistTreePos < 3) then
{
	switch (_treeType) do
	{
		case "t_broussonetiap1s_f.p3d":{_Icon="\exilelife_assets\Texture\ui\Actions\orangetree.paa";_IconColour2 = [1,0.5,0.09,0.8]; _ExileLifeFruit = "Oranges";};
		case "t_oleae1s_f.p3d":{_Icon="\exilelife_assets\Texture\ui\Actions\appletree.paa"; _IconColour2 = [0.8,0,0,0.8]; _ExileLifeFruit = "Apples";};
	};	
_positionobject = [_positionobjectx,_positionobjecty,_positionobjectz];
_Sp = worldToScreen _positionobject;
if !((count _Sp) > 0) then 
{
	_Sp = [0.5,0.5]; 	
};
	_SpX = _Sp select 0;
	_SpY = _Sp select 1;
	if (_SpY > 0.40) then
	{
		if (_SpY < 0.60) then
		{
			if (_SpX > 0.40) then
			{
				if (_SpX < 0.60) then
				{
					_IconColour = _IconColour2;
					_selected = true;
					ExileLifeFruitTree = [_object,_ExileLifeFruit];
				};
			};
		};
	};
	if !(_selected) then
	{
		ExileLifeFruitTree = [];
	};
drawIcon3D [_Icon, _IconColour, _positionobject, 1, 1, 0];
};
