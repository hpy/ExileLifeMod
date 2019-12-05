/**
                    * ExilelifeServer_system_environment_startEffect
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

                    private["_position","_effect","_index","_smoke","_fire","_objectsarray","_brightness","_intensity","_attenuation","_object","_fireobject","_smokesource","_light","_color","_ambient"];
_position = _this select 0;
_effect = _this select 1;
_index = _this select 2;
_smoke = "";
_fire = "";
_objectsarray = [];
switch (_effect) do
{
    case 1:
    {
        _smoke          = "SmallDestructionSmoke";
    };
    case 2:
    {
        _smoke          = "MediumSmoke";
    };
    case 3:
    {
        _smoke          = "BigDestructionSmoke";
    };
    case 4:
    {
        _fire           = "SmallDestructionFire";
        _smoke          = "SmallDestructionSmoke";
    };
    case 5:
    {
        _fire           = "MediumDestructionFire";
        _smoke          = "MediumDestructionSmoke";
        _brightness     = 1.0;
        _intensity      = 400;
        _attenuation    = [0,0,0,2];
    };
    case 6:
    {
        _fire           = "BigDestructionFire";
        _smoke          = "BigDestructionSmoke";
        _brightness     = 1.0;
        _intensity      = 1600;
        _attenuation    = [0,0,0,1.6];
    };
    case 7: 
    {
        _fire           = "MediumDestructionFire";
        _smoke          = "SmallDestructionSmoke";
        _brightness     = 1.0;
        _intensity      = 400;
        _attenuation    = [0,0,0,2];
    };           
};
if (_smoke isEqualTo "") exitWith
{
   format ["StartEffect: %1","Incorrect Classname used! Removing from threadcheck!"] call ExileServer_util_log;   
   ExileLifeEffectArray deleteAt _index;
};
if !(_fire isEqualTo "") then
{
    _object = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "CAN_COLLIDE"];
    _object setPosATL _position;
    _fireobject = "#particlesource" createVehicle _position;
    _fireobject setParticleClass _fire;
    _fireobject attachto [_object, [0,0,0]];
    _objectsarray pushback (netID _fireobject);
    _smokesource = "#particlesource" createVehicle _position;
    _smokesource setParticleClass _smoke;
    _smokesource setPosATL _position;
	_objectsarray pushback (netID _smokesource);
    if (_fire in ["FIRE_BIG","FIRE_MEDIUM"]) then
    {
        _light = createVehicle ["#lightpoint", _position, [], 0, "CAN_COLLIDE"];
        _light attachto [_object, [0,0,0]];
        _light setLightBrightness _brightness;
        _light setLightColor _color;
        _light setLightAmbient _ambient;
        _light setLightIntensity _intensity;
        _light setLightAttenuation _attenuation;
        _light setLightDayLight false;
        _objectsarray pushback (netID _light);
    };
}
else
{
    _smokesource = "#particlesource" createVehicle _position;
    _smokesource setParticleClass _smoke;
    _smokesource setPosATL _position;
    _objectsarray pushback (netID _smokesource);
};
ExileLifeEffectArray select _index set [5, _objectsarray];
