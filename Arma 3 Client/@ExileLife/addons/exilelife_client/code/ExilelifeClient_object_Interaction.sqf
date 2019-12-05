/**
                    * ExilelifeClient_object_Interaction
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_object","_result","_model","_zone","_interactionitems","_interactionname","_positions","_XTL","_XTR","_YTL","_YBL","_YTR","_YBR","_ZTL","_ZBL","_ZTR","_ZBR","_playerintersection","_intersectionpoints","_intersectx","_intersecty","_intersectz","_playerpos"];
_object = _this;
_result = false;
try 
{
	_model = toLower(typeof _object);
	_zone = call ExileLifeClient_util_world_checkZone;
	_zone = toLower _zone;
	if (_zone isEqualTo "") then 
	{
		throw false;
	};
	if !(isClass(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _model)) then
	{
		throw false;
	};
	_interactionitems = getArray(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _model >> "interactionitems");
	if (_interactionitems isEqualTo []) then 
	{
		throw false;
	};	
	{
		_interactionname = _x select 0;
		_positions = _x select 1;
		_XTL = (_positions select 0) select 0; 
		_XTR = (_positions select 2) select 0;
		_YTL = (_positions select 0) select 1;
		_YBL = (_positions select 1) select 1;
		_YTR = (_positions select 2) select 1;		
		_YBR = (_positions select 3) select 1; 		
		_ZTL = (_positions select 0) select 2; 
		_ZBL = (_positions select 1) select 2; 		
		_ZTR = (_positions select 2) select 2;
		_ZBR = (_positions select 3) select 2; 
		_playerintersection = lineIntersectsSurfaces 
		[
		AGLToASL positionCameraToWorld [0, 0, 0],  
		AGLToASL positionCameraToWorld [0, 0, 4],  
		player, 
		objNull, 
		true, 
		1, 
		"VIEW", 
		"GEOM" 
		];
		if (_playerintersection isEqualTo []) then
		{
			throw false; 
		};
		_intersectionpoints = (_playerintersection select 0) select 0;	
		_intersectx = _intersectionpoints select 0;
		_intersecty = _intersectionpoints select 1;		
		_intersectz = _intersectionpoints select 2; 				
		_playerpos = eyePos player; 
		if ((_playerpos distance (_x select 1 select 2)) < 4) then 
		{ 
			if (((_intersectx < _XTL) && (_intersectx > _XTR)) || ((_intersecty < _YTL) && (_intersecty > _YTR))) then
			{ 
				if ((_intersectz < _ZTL) && (_intersectz > _ZBR)) then
				{	
					ExileLifeClientInteractionObject = _object;
					if (ExileLifeClientInteractionName isEqualTo _interactionname) then
					{
						throw true;
					};
					ExileLifeClientInteractionName = _interactionname;
					ExileLifeClientInteractionHandles pushBack (_object addAction 
					[
						(getText(missionConfigFile >> "CfgExileLifeInteraction" >> _zone >> _interactionname >> "interactiontitle")), 
						"_this select 3 call ExileLifeClient_object_interactionSel", 
						[_interactionname,_zone,_model], 
						1.5, 
						true
					]);
					throw true;
				};
			};
		};
	}
	forEach _interactionitems;
	throw false; 
} 
catch
{
	_result = _exception;
};
_result