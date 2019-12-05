/**
                    * ExilelifeServer_world_loadAllGangTerritories
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

                    private["_territories","_variablename","_var","_markername","_markername2","_position","_radius","_color","_markerterritory","_markerdot"];
_territories = getArray(missionConfigFile >> "CfgExileLifeWorld" >> worldName >> "GangTerritory");
if (count _territories == 0) exitWith 
{
    "loadAllGangTerritories Error: No Territories found!" call ExileLifeServer_util_debugLog;
};
{
    _variablename = format ["%1:%2","ExileLifeGangTerritorySize",(_x select 0)];
    _var = missionNamespace getVariable _variablename;
    _markername = format ["%1_TERRITORY",toUpper (_x select 0)];
    _markername2 = format ["%1_MARKER",toUpper (_x select 0)];
    _position = (_x select 1);
    _radius = _var;
    _color = format ["Color%1",(_x select 0)];
    _markerterritory = createMarker [_markername, _position];
    _markerterritory setMarkerShape "ELLIPSE";
    _markerterritory setMarkerSize [_radius,_radius];
    _markerterritory setMarkerType _markername;
    _markerterritory setMarkerColor _color;
    _markerdot = createMarker [_markername2, _position];
    _markerdot setMarkerType "mil_dot";
    _markerdot setMarkerText (_x select 0);
    _markerdot setMarkerColor _color;
}forEach _territories;
