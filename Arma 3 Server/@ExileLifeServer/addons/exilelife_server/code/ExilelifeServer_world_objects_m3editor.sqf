/**
                    * ExilelifeServer_world_objects_m3editor
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

                    private["_vehicles","_vehicle"];
private _vehicles =
[
    ["ExileLife_ConveyorBelt_Static",[5893.69,20184.7,225.992],[-0.028445,0.995792,-0.0871205],[0,0.0871557,0.996195],false],
    ["WaterPump_01_sand_F",[5896.81,20181.3,225.39],[0.999559,-0.0297012,0],[0,0,1],false],
    ["ExileLife_GarbageBin_Static",[5945,20150,224.37],[0.994714,0.00233978,-0.10266],[0.102656,0.00175122,0.994715],false],
    ["Land_Factory_Conv1_End_F",[5902.55,20138.3,227.188],[-0.00535947,-0.999986,0],[0,0,1],false],
    ["ExileLife_ConveyorBelt_Static",[5906.51,20185,225.919],[-0.028445,0.995792,-0.0871205],[0,0.0871557,0.996195],false],
    ["WaterPump_01_sand_F",[5903.59,20181.7,225.578],[-0.999979,-0.00647539,0],[0,0,1],false],
    ["ExileLife_GarbageBin_Static",[5944.92,20156.7,223.875],[0.994714,0.00233978,-0.10266],[0.102656,0.00175122,0.994715],false],
    ["Land_Factory_Conv1_End_F",[5900.26,20138.3,227.192],[-0.00535947,-0.999986,0],[0,0,1],false],
    ["Land_IndPipe1_valve_F",[5897.16,20082.3,228.154],[-0.831383,0.553078,-0.0539278],[-0.0452855,0.0292901,0.998545],false],
    ["Land_FuelStation_Feed_F",[4237.76,15076.8,19.6445],[-1,-0.000762451,0],[0,0,1],false],
    ["Land_FuelStation_Shed_F",[4233.67,15079.6,18.9197],[0.999854,-0.0170858,0],[0,0,1],false],
    ["Land_PowerGenerator_F",[4197.83,15033.6,17.7286],[-0.0148879,0.999883,-0.0034483],[-0.05193,0.00267082,0.998647],false],
    ["Land_PowerGenerator_F",[4198.84,15033.6,17.7812],[-0.026068,0.999652,-0.00402905],[-0.05193,0.00267082,0.998647],false],
    ["Land_ExtensionCord_F",[4203.99,15034.8,17.8814],[0,0.999999,-0.00133721],[-0.012,0.00133712,0.999927],false],
    ["Land_FuelStation_Feed_F",[4237.74,15075.5,19.6374],[0.999995,0.00308986,0],[0,0,1],false],
    ["Land_FuelStation_Feed_F",[4237.83,15083.7,19.6898],[-1,-0.000762451,0],[0,0,1],false],
    ["Land_FuelStation_Feed_F",[4237.81,15082.4,19.669],[0.999995,0.00308986,0],[0,0,1],false],
    ["Land_PortableLight_double_F",[4204.63,15035.3,17.8886],[0.830722,-0.556687,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4187.19,15083.9,27.5638],[0.844827,-0.535039,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4187.41,15098,20.4346],[0.972696,0.232081,0],[0,0,1],true],
    ["Land_PortableLight_single_F",[4175.8,15090.9,22.3395],[-0.950692,0.310137,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4193.04,15090.4,23.7562],[0.999315,0.0370117,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4173.07,15082.3,29.0373],[-0.89868,-0.438605,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4199.05,15055.6,23.3717],[0.0363426,0.999339,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4237.52,15069.4,19.3604],[0.185866,-0.982575,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4199.75,15056.6,23.437],[-0.999997,-0.00244902,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4172.01,15057.2,23.4659],[0.999991,-0.00425926,0],[0,0,1],true],
    ["Land_PortableLight_double_F",[4172.88,15056.4,23.4061],[-0.0117522,0.999931,0],[0,0,1],true],
    ["Land_PCSet_01_screen_F", [3272.29, 12968, 15.3447], [0.0361132, -0.999348, 0], [0, 0, 1], false], 
    ["ExileLife_Guard_PrisonCell", [3277.41, 12968.5, 14.2661], [-0.0200576, 0.999799, 0], [0, 0, 1], true],
    ["ExileLife_Guard_PrisonCell", [3279.73, 12968.5, 14.2658], [-0.0200576, 0.999799, 0], [0, 0, 1], true]
];
{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosASL (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
}
forEach _vehicles;
