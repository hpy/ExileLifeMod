/*
	Author: Jiri Wainar

	Description:
	Play set of ambient animations on given unit.

	Remarks:
	* Can handle several different anims and auto-switching between them.
	* Detects nearby units with the same animation set and tries to select different animations.
	* A game logic is created on units position and animated unit is then attached to it, to prevent possible problems, like player pushing units around.
	* The unit can be snapped to a set snappoint to prevent game from repositioning the unit.
		* The snappoint is automatically detected, snap distance is 2 meters (in top-down view, ignoring vertical info).
		* To position unit vertically, move its snappoint up/down.
		* A snappoint is a (cyan colored) helper "Sign_Pointer_Cyan_F".
		* This is extremely handy if the unit needs to be placed near object(s) - like on chair near a table.

	Parameter(s):
	0: OBJECT - unit the anim & gear changes are going to be applied to
	1: STRING - animation set id, describing what the unit's action looks like.
	   > "STAND"		- standing still, slightly turning to the sides, with rifle weapon
	   > "STAND_IA"		- standing still, slightly turning to the sides, with rifle weapon
	   > "STAND_U1-3"	- standing still, slightly turning to the sides, no weapon
	   > "WATCH1-2"		- standing and turning around, with rifle weapon
	   > "GUARD"		- standing still, like on guard with hands behing the body
	   > "LISTEN_BRIEFING"  - standing still, hands behind back, recieving briefing / commands, no rifle.
	   > "LEAN_ON_TABLE"	- standing while leaning on the table
	   > "LEAN"		- standing while leaning (on wall)
	   > "BRIEFING"		- standing, playing ambient briefing loop with occasional random moves
	   > "BRIEFING_POINT_LEFT"	- contains 1 extra pointing animation, pointing left & high
	   > "BRIEFING_POINT_RIGHT"	- contains 1 extra pointing animation, pointing right & high
	   > "BRIEFING_POINT_TABLE"	- contains 1 extra pointing animation, pointing front & low, like at table
	   > "SIT1-3"		- sitting on chair or bench, with rifle weapon
	   > "SIT_U1-3"		- sitting on chair or bench, without weapon
	   > "SIT_AT_TABLE"	- sitting @ table, hands on table
	   > "SIT_HIGH1-2" 	- sitting on taller objects like a table or wall, legs not touching the ground. Needs a rifle!
	   > "SIT_LOW"		- sitting on the ground, with weapon.
	   > "SIT_LOW_U"	- sitting on the ground, without weapon.
	   > "SIT_SAD1-2"	- sitting on a chair, looking very sad.
	   > "KNEEL"		- kneeling, with weapon.
	   > "PRONE_INJURED_U1-2" - laying wounded, back on the ground, wothout weapon
	   > "PRONE_INJURED"	- laying wounded & still, back on the ground, with or without weapon
	   > "KNEEL_TREAT"	- kneeling while treating the wounded
	   > "REPAIR_VEH_PRONE"	- repairing vehicle while laying on the ground (under the vehicle)
	   > "REPAIR_VEH_KNEEL"	- repairing vehicle while kneeling (like changing a wheel)
	   > "REPAIR_VEH_STAND"	- repairing/cleaning a vehicle while standing

	2: STRING - equipment level id, describing how heavily is the unit equipped.
	   > "NONE"  		- no goggles, headgear, vest, weapon
	   > "LIGHT"  		- no goggles, headgear, vest
	   > "MEDIUM" 		- no goggles, headgear
	   > "FULL"  		- no goggles
	   > "ASIS"  		- no touches to the gear
	   > "RANDOM" (default)	- gear is randomized according to the animation set

	3: OBJECT 	- object unit to snap to; function won't try to search for the closest snappoint and will use this snappoint instead
	4: BOOL		- function will try to interpolate into the ambient animation, if the interpolateTo link exists
			- it is not officialy supported, so it's disabled by default
			- works only for transitions from (some) default A3 stances to sets "STAND", "SIT_LOW" and "KNEEL"

	Returns:
	-

	Example:
	[this,"SIT_HIGH2"] call BIS_fnc_ambientAnim;
*/

//surpress the debuglog output
private["_fnc_log_disable"];_fnc_log_disable = false;

if (isNil "BIS_fnc_ambientAnim__group") then
{
	BIS_fnc_ambientAnim__group = createGroup west;
};

//do the immediate operations ----------------------------------------------------------------------
private["_unit","_animset","_gear","_anims","_anim","_linked","_xSet","_azimutFix","_interpolate","_canInterpolate","_attach"];
private["_attachOffset","_attachObj","_attachSpecsAuto","_attachSpecs","_attachSnap","_noBackpack","_noWeapon","_randomGear","_weapon","_forcedSnapPoint","_params"];

_unit  	 	 = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_animset 	 = [_this, 1, "STAND", [""]] call BIS_fnc_param;
_gear    	 = [_this, 2, "RANDOM", [""]] call BIS_fnc_param;
_forcedSnapPoint = [_this, 3, objNull, [objNull]] call BIS_fnc_param;
_interpolate	 = [_this, 4, false, [true]] call BIS_fnc_param;
_attach		 = [_this, 5, true, [true]] call BIS_fnc_param;

if (isNull _unit) exitWith
{
	//["Function terminated, unit doesn't exist!"] call BIS_fnc_logFormat;
};

if (isNil "_forcedSnapPoint") then
{
	["Forced snappoint doesn't exist!"] call BIS_fnc_error;

	_forcedSnapPoint = objNull;
};

if ((_unit getVariable ["BIS_fnc_ambientAnim__animset",""]) != "") exitWith
{
	["[%1] Trying to play an ambient animation [%3] while another [%2] is already playing!",_unit,_unit getVariable ["BIS_fnc_ambientAnim__animset",""],_animset] call BIS_fnc_logFormat;

	/*
	_unit call BIS_fnc_ambientAnim__terminate;

	_this spawn
	{
		sleep 1;

		_this call BIS_fnc_ambientAnim;
	};
	*/
};

//surpress the unit "intelligence"
{_unit disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];

//detach unit, if already attached to something
detach _unit;

//store primary weapon
_weapon = primaryWeapon _unit;

if (_weapon != "") then
{
	_unit setVariable ["BIS_fnc_ambientAnim__weapon",_weapon];
};

/*--------------------------------------------------------------------------------------------------

	GET ANIMATION PARAMETERS

--------------------------------------------------------------------------------------------------*/
_params = _animset call BIS_fnc_ambientAnimGetParams;

//defaults
_anims		= _params select 0;
_azimutFix 	= _params select 1;
_attachSnap 	= _params select 2;
_attachOffset 	= _params select 3;
_noBackpack 	= _params select 4;
_noWeapon 	= _params select 5;
_randomGear 	= _params select 6;
_canInterpolate = _params select 7;

if (count _anims == 0) exitWith {};

if (_gear == "RANDOM") then
{
	_gear = _randomGear call BIS_fnc_selectRandom;
};

//setup the gear
[_unit,_gear,_noWeapon,_noBackpack,_weapon] spawn
{
	private["_unit","_gear","_noWeapon","_noBackpack","_weapon"];

	_unit 		= _this select 0;
	_gear 		= _this select 1;
	_noWeapon 	= _this select 2;
	_noBackpack 	= _this select 3;
	_weapon		= _this select 4;

	sleep 1;

	switch (_gear) do
	{
		case "NONE":
		{
			removeGoggles _unit;
			removeHeadgear _unit;
			removeVest _unit;
			removeAllWeapons _unit;

			_noBackpack = true;
			_noWeapon = true;
		};
		case "LIGHT":
		{
			removeGoggles _unit;
			removeHeadgear _unit;
			removeVest _unit;

			_noBackpack = true;
		};
		case "MEDIUM":
		{
			removeGoggles _unit;
			removeHeadgear _unit;
		};
		case "FULL":
		{
			removeGoggles _unit;
		};
		default
		{
		};
	};

	//remove NV goggles from units without helmets
	if (_gear != "ASIS") then
	{
		_unit unassignItem "nvgoggles";
		_unit unassignItem "nvgoggles_opfor";
		_unit unassignItem "nvgoggles_indep";
	};

	//remove backpack for some anim sets
	if (_noBackpack) then
	{
		removeBackpack _unit;
	};

	//["[%1] _noWeapon = %2 | _storedWeapon = %3",_unit,_noWeapon,_unit getVariable ["BIS_fnc_ambientAnim__weapon",""]] call BIS_fnc_logFormat;

	//remove primary weapon for some anim sets
	if (_noWeapon) then
	{
		_unit removeWeapon _weapon;
	}
	else
	{
		private["_storedWeapon"];

		_storedWeapon = _unit getVariable ["BIS_fnc_ambientAnim__weapon",""];

		if (primaryWeapon _unit == "" && _storedWeapon != "") then
		{
			//["Weapon [%1] provided to unit [%2].",_storedWeapon,_unit] call BIS_fnc_logFormat;

			_unit addWeapon _storedWeapon;
			_unit selectWeapon _storedWeapon;
		};
	};
};

//find linked units = nearby units playing same animation set
_linked = _unit nearObjects ["man",5];
_linked = _linked - [_unit];

//["[%1] RAW linked: %2",_unit,_linked] call BIS_fnc_logFormat;

{
	_xSet = _x getVariable ["BIS_fnc_ambientAnim__animset",""];

	//["[%1] %2 has animset %3",_unit,_x,_xSet] call BIS_fnc_logFormat;

	if (_xSet != _animset || _xSet == "") then
	{
		_linked set [_forEachIndex,objNull];

		//["[%1] unit %2 removed from linked",_unit,_x] call BIS_fnc_logFormat;
	}
	else
	{
		//put a backlink into the linked unit
		_xLinked = _x getVariable ["BIS_fnc_ambientAnim__linked",[]];

		//["[%1] %2 has linked units %3",_unit,_x,_xLinked] call BIS_fnc_logFormat;

		if !(_unit in _xLinked) then
		{
			_xLinked = _xLinked + [_unit];
			_x setVariable ["BIS_fnc_ambientAnim__linked",_xLinked];

			//["[%1] %2 got a backlink to %1",_unit,_x] call BIS_fnc_logFormat;
		};
	};
}
forEach _linked; _linked = _linked - [objNull];

//["[%1] AFTER CLEAN linked: %2",_unit,_linked] call BIS_fnc_logFormat;

//get the auto snappoint specs
_attachSpecsAuto = switch (_animset) do
{
	case "SIT_AT_TABLE":
	{
		[
			["Land_CampingChair_V2_F",[0,0.08,-0.02],-180],
			["Land_ChairPlastic_F",[0,0.08,-0.02],90],
			["Land_ChairWood_F",[0,0.02,-0.02],-180]
		];
	};
	case "SIT";
	case "SIT1";
	case "SIT2";
	case "SIT3";
	case "SIT_U1";
	case "SIT_U2";
	case "SIT_U3":
	{
		[
			["Land_CampingChair_V2_F",[0,0.08,0.05],-180],
			["Land_ChairPlastic_F",[0,0.08,0.05],90],
			["Land_ChairWood_F",[0,0.02,0.05],-180]
		];
	};

	case "SIT_SAD1":
	{
		[
			["Box_NATO_Wps_F",[0,-0.27,0.03],0]
		];
	};
	case "SIT_SAD2":
	{
		[
			["Box_NATO_Wps_F",[0,-0.3,0.05],0]
		];
	};
	case "SIT_HIGH1":
	{
		[
			["Box_NATO_Wps_F",[0,-0.23,0.03],0]
		];
	};
	case "SIT_HIGH";
	case "SIT_HIGH2":
	{
		[
			["Box_NATO_Wps_F",[0,-0.12,-0.20],0]
		];
	};


	default
	{
		[];
	};
};

//adjust the auto attach data according to the soldiers gear
if ((count _attachSpecsAuto > 0) && !(_gear in ["NONE","LIGHT"])) then
{
	private["_attachPoint","_attachGearFix","_vest"];

	_attachGearFix = 0.06;
	_vest = toLower (vest _unit);

	if (_vest in ["v_platecarrier1_rgr"]) then
	{
		_attachGearFix = _attachGearFix + 0.08;
	};

	{
		_attachPoint = _x select 1;
		_attachPoint set [1, (_attachPoint select 1) + _attachGearFix];
		_x set [1, _attachPoint];
	}
	forEach _attachSpecsAuto;
};

//add the possible helper snappoint
_attachSpecsAuto = _attachSpecsAuto + [["Sign_Pointer_Cyan_F",[0,0,_attachOffset],0]];

if !(isNull _forcedSnapPoint) then
{
	_attachObj = _forcedSnapPoint;
	_attachSpecs = [typeOf _forcedSnapPoint,[0,0,_attachOffset],0];

	//get the attach specs
	{
		if ((_x select 0) == typeOf _forcedSnapPoint) exitWith
		{
			_attachSpecs = _x;
		};
	}
	forEach _attachSpecsAuto;
}
else
{
	//default situation, snappoint not found = using unit position
	_attachSpecs = [typeOf _unit,[0,0,_attachOffset],0];
	_attachObj = _unit;

	//get the snappoint object
	private["_obj"];

	{
		_obj = nearestObject [_unit, _x select 0];

		if (([_obj,_unit] call BIS_fnc_distance2D) < _attachSnap) exitWith
		{
			_attachSpecs = _x;
			_attachObj = _obj;
		};
	}
	forEach _attachSpecsAuto;
};


//store linked units, won't be changed
_unit setVariable ["BIS_fnc_ambientAnim__linked",_linked];		//array of units that should be checked for not playing same animation

//store persistant animation data in the units namespace
_unit setVariable ["BIS_fnc_ambientAnim__anims",_anims];
_unit setVariable ["BIS_fnc_ambientAnim__animset",_animset];
_unit setVariable ["BIS_fnc_ambientAnim__interpolate",_interpolate && _canInterpolate];

//store variable animation data in the units namespace
_unit setVariable ["BIS_fnc_ambientAnim__time",0];			//time when the animation has started

//disable collisions between unit and helper/attach object
_attachObj disableCollisionWith _unit;
_unit disableCollisionWith _attachObj;

//do the delayed operations ------------------------------------------------------------------------
[_unit,_attachObj,_attachSpecs,_azimutFix,_attach] spawn
{
	private["_unit","_attachObj","_attachSpecs","_azimutFix","_group","_attach"];
	private["_attachPos","_logic","_ehAnimDone","_ehKilled"];

	_unit		= _this select 0;
	_attachObj	= _this select 1;
	_attachSpecs	= _this select 2;
	_azimutFix	= (_this select 3) + (_attachSpecs select 2);	//animation dir fix + snappoint (object) direction fix
	_attach		= _this select 4;

	//wait for the simulation to start
	waitUntil{time > 0};

	if (isNil "_unit") exitWith {};
	if (isNull _unit) exitWith {};
	if !(alive _unit && canMove _unit) exitWith {};

	_attachPos = getPosASL _attachObj;

	//create a logic for attaching of the unit
	//_group = createGroup west;
	//_group = group _unit;
	_group = BIS_fnc_ambientAnim__group;

	_logic = _group createUnit ["Logic", [_attachPos select 0,_attachPos select 1,0], [], 0, "NONE"];

	if (isNull _logic) exitWith
	{
		_unit call BIS_fnc_ambientAnim__playAnim;

		if (count units _group == 0) then
		{
			deleteGroup _group;
		};
	};

	_logic setPosASL _attachPos;
	_logic setDir ((getDir _attachObj) + _azimutFix);

	//4debug
	_unit setVariable ["BIS_fnc_ambientAnim__logic",_logic];
	_unit setVariable ["BIS_fnc_ambientAnim__helper",_attachObj];

	//attach the unit to the game logic
	if (_attach) then
	{
		_unit attachTo [_logic,_attachSpecs select 1];
		_unit setVariable ["BIS_fnc_ambientAnim__attached",true];
	};

	//"smart-select" animation that is not played on nearby unit and play it
	_unit call BIS_fnc_ambientAnim__playAnim;

	//play next anim when previous finishes
	_ehAnimDone = _unit addEventHandler
	[
		"AnimDone",
		{
			private["_unit","_anim","_pool"];

			_unit = _this select 0;
			_anim = _this select 1;
			_pool = _unit getVariable ["BIS_fnc_ambientAnim__anims",[]];

			//["[%1] Anim finished: %2",_unit,_anim] call BIS_fnc_logFormat;

			//ignore all non-animset animations
			/*
			if !(_anim in _pool) exitWith
			{
				["[i][%1] Anim '%2' not in unit's animset!",_unit,_anim] call BIS_fnc_logFormat;
			};
			*/

			if (alive _unit) then
			{
				_unit call BIS_fnc_ambientAnim__playAnim;
			}
			else
			{
				_unit call BIS_fnc_ambientAnim__terminate;
			};
		}
	];
	_unit setVariable ["BIS_EhAnimDone", _ehAnimDone];

	//free unit from anim loop if it is killed
	_ehKilled = _unit addEventHandler
	[
		"Killed",
		{
			(_this select 0) call BIS_fnc_ambientAnim__terminate;
		}
	];
	_unit setVariable ["BIS_EhKilled", _ehKilled];
};

//_unit call BIS_fnc_ambientAnim__playAnim;
BIS_fnc_ambientAnim__playAnim =
{
	private["_unit","_anims","_anim","_available","_time","_linkedUnits","_linkedAnims","_xTime","_interpolate"];

	if (isNull _this) exitWith {};
	if !(alive _this && canMove _this) exitWith {};

	_unit = _this;
	_anims 	= _unit getVariable ["BIS_fnc_ambientAnim__anims",[]];

	if (count _anims == 0) exitWith
	{
		["Unit '%1' doesn't have defined ambient anims!",_unit,_anims] call BIS_fnc_logFormat;
	};

	_linkedUnits = _unit getVariable ["BIS_fnc_ambientAnim__linked",[]];

	//find animations that are being played on linked units
	_linkedAnims = [];

	_time = time - 10;

	{
		_xTime = _x getVariable ["BIS_fnc_ambientAnim__time",_time];

		if (_xTime > _time) then
		{
			_linkedAnims = _linkedAnims + [animationState _x];
		};
	}
	forEach _linkedUnits;

	//get animations available for player = not recently played by linked units
	_available = _anims - _linkedAnims;

	if (count _available == 0) then
	{
		["Unit '%1' doesn't have an available/free animation to play",_unit] call BIS_fnc_logFormat;

		_available = _anims;
	};

	//select a random anim from the pool of available animations and play it
	_anim = selectRandom _available;

	_interpolate = _unit getVariable ["BIS_fnc_ambientAnim__interpolate",false];

	if (_interpolate) then
	{
		_unit playMoveNow _anim;
	}
	else
	{
		_unit switchMove _anim;
	};
};

//_unit call BIS_fnc_ambientAnim__terminate;
BIS_fnc_ambientAnim__terminate =
{
	private["_unit","_ehAnimDone","_ehKilled","_fnc_log_disable","_detachCode"];

	_fnc_log_disable = false;

	if (typeName _this == typeName []) exitWith
	{
		{
			_x call BIS_fnc_ambientAnim__terminate;
		}
		forEach _this;
	};

	if (typeName _this != typeName objNull) exitWith {};

	if (isNull _this) exitWith {};

	_unit = _this;

	//["[%1] Terminating an ambient animation ...",_unit] call BIS_fnc_logFormat;

	/*
	if !(alive _unit) exitWith
	{
		["[%1] Ambient animation was not terminated, unit is dead!",_unit] call BIS_fnc_logFormat;
	};
	*/

	/*
	if !(_unit getVariable ["BIS_fnc_ambientAnim__attached",false]) exitWith
	{
		["[%1] Ambient animation was not terminated, unit is not attached!",_unit] call BIS_fnc_logFormat;
	};
	*/

	//enable the unit "intelligence"
	{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];

	//remove the event handlers
	_ehAnimDone 	= _unit getVariable ["BIS_EhAnimDone",-1];
	_ehKilled 	= _unit getVariable ["BIS_EhKilled",-1];

	if (_ehAnimDone != -1) then
	{
		_unit removeEventHandler ["AnimDone",_ehAnimDone];
		_unit setVariable ["BIS_EhAnimDone",-1];
	};
	if (_ehKilled != -1) then
	{
		_unit removeEventHandler ["Killed",_ehKilled];
		_unit setVariable ["BIS_EhKilled",-1];
	};

	_detachCode =
	{
		private["_logic"];

		//exit if object/unit doesn't exist
		if (isNull _this) exitWith {};

		_logic = _this getVariable ["BIS_fnc_ambientAnim__logic",objNull];

		//delete the game logic
		if !(isNull _logic) then
		{
			deleteVehicle _logic;
		};

		//["[%1] Ambient animation-set [%2] terminated!",_this,_this getVariable ["BIS_fnc_ambientAnim__animset",""]] call BIS_fnc_logFormat;

		_this setVariable ["BIS_fnc_ambientAnim__attached",nil];
		_this setVariable ["BIS_fnc_ambientAnim__animset",nil];
		_this setVariable ["BIS_fnc_ambientAnim__anims",nil];
		_this setVariable ["BIS_fnc_ambientAnim__interpolate",nil];
		_this setVariable ["BIS_fnc_ambientAnim__time",nil];
		_this setVariable ["BIS_fnc_ambientAnim__logic",nil];
		_this setVariable ["BIS_fnc_ambientAnim__helper",nil];
		//_this setVariable ["BIS_fnc_ambientAnim__weapon",nil];
		_this setVariable ["BIS_fnc_ambientAnim__linked",nil];

		//detach unit, so it can freely move
		detach _this;
		
		if (alive _this) then {
			_this switchMove "";
		};
	};

	if (time > 0) then
	{
		_unit call _detachCode;
	}
	else
	{
		[_unit,_detachCode] spawn
		{
			sleep 0.3; (_this select 0) call (_this select 1);
		};
	};
};