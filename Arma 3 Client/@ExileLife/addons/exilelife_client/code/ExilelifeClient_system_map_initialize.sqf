/**
                    * ExilelifeClient_system_map_initialize
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_resourcesdata","_typeofresource","_markername","_resourceposition","_resourcelegality","_resourceareasize"];
ExileLifeFruitZoneMarkerPositions = [];
ExileLifeFruitZoneMarkerPositionsAndSize = [];
ExileLifeMiningZoneMarkerPositions = [];
ExileLifeMiningZoneMarkerPositionsAndSize = [];
ExileLifeRefineryZoneMarkerPositions = [];
ExileLifeRefineryZoneMarkerPositionsAndSize = [];
ExileLifeDrugsZoneMarkerPositions = [];
ExileLifeDrugsZoneMarkerPositionsAndSize = [];
ExileLifeArtefactZoneMarkerPositions = [];
ExileLifeArtefactZoneMarkerPositionsAndSize = [];
_resourcesdata = getArray(missionConfigFile >> "cfgExileLifeWorld" >> worldName >> "locationMarkers");
{
	_typeofresource 	= toLower (_x select 0);
	_markername 		= _x select 1;
	_resourceposition 	= _x select 2;
	_resourcelegality 	= _x select 3;
	_resourceareasize 	= _x select 4;
	switch _typeofresource do
	{
		case "fruit":
		{
			ExileLifeFruitZoneMarkerPositions pushBack _resourceposition;
			ExileLifeFruitZoneMarkerPositionsAndSize pushBack [_resourceposition, _resourceareasize, _markername,_typeofresource];
		};
		case "mining":
		{
			ExileLifeMiningZoneMarkerPositions pushBack _resourceposition;
			ExileLifeMiningZoneMarkerPositionsAndSize pushBack [_resourceposition, _resourceareasize, _markername,_typeofresource];
		};
		case "refinery":
		{
			ExileLifeRefineryZoneMarkerPositions pushBack _resourceposition;
			ExileLifeRefineryZoneMarkerPositionsAndSize pushBack [_resourceposition, _resourceareasize, _markername,_typeofresource];
		};
		case "drugs":
		{
			ExileLifeDrugsZoneMarkerPositions pushBack _resourceposition;
			ExileLifeDrugsZoneMarkerPositionsAndSize pushBack [_resourceposition, _resourceareasize, _markername,_typeofresource];
		};
		case "artefacts":
		{
			ExileLifeArtefactZoneMarkerPositions pushBack _resourceposition;
			ExileLifeArtefactZoneMarkerPositionsAndSize pushBack [_resourceposition, _resourceareasize, _markername,_typeofresource];
		};
	};
}forEach _resourcesdata;