/**
                    * ExilelifeClient_system_world_loadResources
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_showmarkers","_showmarkerslegal","_resourcesdata","_typeofresource","_markername","_resourceposition","_legalitycheck","_markertype","_markerdot","_markercolor"];
_showmarkers = _this select 0; 
_showmarkerslegal = _this select 1; 
_resourcesdata = getArray(missionConfigFile >> "cfgExileLifeWorld" >> worldName >> "locationMarkers");
{
	_typeofresource = _x select 0;
	_markername = _x select 1;
	_resourceposition = _x select 2;
	_legalitycheck = _x select 3;
	_markertype = _x select 5;
	if ((_typeofresource)in(_showmarkers)) then
	{
		_markerdot = createMarkerLocal [_markername, _resourceposition];
		if !(_markertype isEqualTo "") then 
		{
			_markerdot setMarkerTypeLocal _markertype;	
		}
		else
		{
			_markerdot setMarkerTypeLocal "mil_dot";	
			_markercolor = format ["Color%1",_typeofresource];	
			if(isClass(configFile >> "CfgMarkerColors" >> _markercolor)) then 
			{
				_markerdot setMarkerColorLocal _markercolor;	
				_markerdot setMarkerTextLocal _markername;
			};			
		};
	}
	else
	{
		deleteMarkerLocal _markername;
	};
} forEach _resourcesdata;
