/**
                    * ExileClientOverwrites_util_item_getMainStats
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

                    private["_itemClassName","_itemType","_stats","_armor","_mass","_containerClass","_capacity","_ammoClassName","_damage","_aoeRadius","_maxControlRange","_triggerRadius","_maxRange","_explosionTime","_typicalSpeed","_tracersEvery","_attributeName","_attributeId","_effectValue","_effectDuration","_effectSign","_effectUnit","_remainingQuanity","_modes","_highestRange","_lowestDispersion","_lowestReloadTime","_roundsPerMinute","_traderZone","_tax","_salesPrice","_taxAmount","_popTabs"];
_itemClassName = _this;
_itemType = [_itemClassName] call BIS_fnc_itemType;
_stats = []; 
switch (_itemType select 0) do
{
	case "Equipment": 
	{
		switch (_itemType select 1) do
		{
			case "Headgear": 
			{	
				_armor = _itemClassName call ExileClient_util_item_getArmor;
				_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
				_stats pushBack
				[
					"ARMOR", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _armor],
					linearConversion [0, 12, _armor, 0, 1, true]
				];
				_stats pushBack
				[
					"MASS", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
					linearConversion [0, 60, _mass, 0, 1, true]
				];
			};
			case "Vest":
			{
				_containerClass = getText(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "containerClass");
				_capacity = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
				_armor = _itemClassName call ExileClient_util_item_getArmor;
				_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
				_stats pushBack
				[
					"ARMOR", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _armor],
					linearConversion [0, 204, _armor, 0, 1, true]
				];
				_stats pushBack
				[
					"CAPACITY", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _capacity],
					linearConversion [0, 160, _capacity, 0, 1, true]
				];
				_stats pushBack
				[
					"MASS", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
					linearConversion [0, 120, _mass, 0, 1, true]
				];
			};
			case "Backpack":
			{
				_capacity = getNumber(configFile >> "CfgVehicles" >> _itemClassName >> "maximumLoad");
				_mass = getNumber(configFile >> "CfgVehicles" >> _itemClassName >> "mass");
				_stats pushBack
				[
					"CAPACITY", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _capacity],
					linearConversion [0, 320, _capacity, 0, 1, true]
				];
				_stats pushBack
				[
					"MASS", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
					linearConversion [0, 380, _mass, 0, 1, true]
				];
			};
			case "Uniform":
			{
				_containerClass = getText(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "containerClass");
				_capacity = getNumber(configFile >> "CfgVehicles" >> _containerClass >> "maximumLoad");
				_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
				_stats pushBack
				[
					"CAPACITY", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _capacity],
					linearConversion [0, 500, _capacity, 0, 1, true]
				];
				_stats pushBack
				[
					"MASS", 
					format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
					linearConversion [0, 100, _mass, 0, 1, true]
				];
			};
		};
	};
	case "Mine": 
	{
		_mass = getNumber(configFile >> "CfgMagazines" >> _itemClassName >> "mass");
		_ammoClassName = getText(configFile >> "CfgMagazines" >> _itemClassName >> "ammo");
		_damage = 10 * (getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "hit") + getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "indirectHit"));
		_aoeRadius = getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "indirectHitRange");
		_maxControlRange = getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "maxControlRange");
		_triggerRadius = getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "mineBoundingDist");
		_stats pushBack
		[
			"CONTROL RANGE", 
			format["<t size='1' font='puristaMedium' align='right'>%1m</t>", _maxControlRange],
			linearConversion [0, 1000, _maxControlRange, 0, 1, true]
		];
		if (_triggerRadius > 0) then
		{
			_stats pushBack
			[
				"TRIGGER RADIUS", 
				format["<t size='1' font='puristaMedium' align='right'>%1m</t>", _triggerRadius],
				linearConversion [0, 5, _triggerRadius, 0, 1, true]
			];
		};
		_stats pushBack
		[
			"AOE", 
			format["<t size='1' font='puristaMedium' align='right'>%1m</t>", _aoeRadius],
			linearConversion [0, 50, _aoeRadius, 0, 1, true]
		];
		_stats pushBack
		[
			"DAMAGE", 
			format["<t size='1' font='puristaMedium' align='right'>%1 HP</t>", _damage],
			linearConversion [0, 10000, _damage, 0, 1, true]
		];
		_stats pushBack
		[
			"MASS", 
			format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
			linearConversion [0, 1200, _mass, 0, 1, true]
		];
	};
	case "Item":
	{
		switch (_itemType select 1) do 
		{
			case "AccessorySights":
			{
				_maxRange = 0;
				{
					_maxRange = _maxRange max getNumber(_x >> "distanceZoomMax");
				}
				forEach ("true" configClasses (configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "OpticsModes"));
				_stats pushBack
				[
					"ZOOM", 
					format["<t size='1' font='puristaMedium' align='right'>%1m</t>", _maxRange],
					linearConversion [0, 2500, _maxRange, 0, 1, true]
				];				
			};
		};
		_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "ItemInfo" >> "mass");
		_stats pushBack
		[
			"MASS", 
			format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
			linearConversion [0, 1200, _mass, 0, 1, true]
		];
	};
	case "Magazine":
	{
		switch (_itemType select 1) do 
		{
			case "Grenade":
			{
				if !(_itemClassName isEqualTo "Exile_Item_ZipTie") then 
				{
					_ammoClassName = getText(configFile >> "CfgMagazines" >> _itemClassName >> "ammo");
					_explosionTime = getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "explosionTime");
					_damage = 10 * (getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "hit") + getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "indirectHit"));
					_aoeRadius = getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "indirectHitRange");
					_stats pushBack
					[
						"DAMAGE", 
						format["<t size='1' font='puristaMedium' align='right'>%1 HP</t>", _damage],
						linearConversion [0, 10000, _damage, 0, 1, true]
					];
					_stats pushBack
					[
						"AOE", 
						format["<t size='1' font='puristaMedium' align='right'>%1m</t>", _aoeRadius],
						linearConversion [0, 50, _aoeRadius, 0, 1, true]
					];
					if (_explosionTime > 0) then
					{
						_stats pushBack
						[
							"COUNTDOWN", 
							format["<t size='1' font='puristaMedium' align='right'>%1s</t>", _explosionTime],
							linearConversion [0, 60, _explosionTime, 0, 1, true]
						];
					};
				};
			};
			case "SmokeShell":
			{
			};
			case "Shell":
			{
			};
			case "Bullet":
			{
				_ammoClassName = getText(configFile >> "CfgMagazines" >> _itemClassName >> "ammo");
				_damage = getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "hit");
				_typicalSpeed = getNumber(configFile >> "CfgAmmo" >> _ammoClassName >> "typicalSpeed");
				_tracersEvery = getNumber(configFile >> "CfgMagazines" >> _itemClassName >> "tracersEvery");
				_stats pushBack
				[
					"DAMAGE", 
					format["<t size='1' font='puristaMedium' align='right'>%1 HP</t>", _damage],
					linearConversion [0, 550, _damage, 0, 1, true]
				];
				_stats pushBack
				[
					"SPEED", 
					format["<t size='1' font='puristaMedium' align='right'>%1m/s</t>", _typicalSpeed],
					linearConversion [0, 6000, _typicalSpeed, 0, 1, true]
				];
				if (_tracersEvery > 0) then 
				{
					_stats pushBack
					[
						"TRACERS", 
						format["<t size='1' font='puristaMedium' align='right'>1:%1</t>", _tracersEvery],
						linearConversion [0, _tracersEvery, 1, 0, 1, true]
					];
				};
			};
			case "UnknownMagazine":
			{
				if (isArray(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Consuming" >> "effects")) then
				{
					{
						_attributeName = '';
						_attributeId = _x select 0;
						_effectValue = _x select 1;
						_effectDuration = _x select 2;
						_effectSign = if (_effectValue > 0) then {"+"} else {"-"};
						_effectUnit = "%";
						switch (_attributeId) do
						{
							case 2: 			{ _attributeName = "HUNGER"; };
							case 3: 			{ _attributeName = "THIRST"; };
							case 1: 		{ _attributeName = "STAMINA"; };
							case 6: 		{ _attributeName = "WETNESS"; };
							case 5:		{ _attributeName = "TEMPERATURE"; _effectUnit = "°C"; };
							case 4: 		{ _attributeName = "BLOOD ALC."; _effectUnit = "‰"; };
							default 						{ _attributeName = "HEALTH"; };
						};
						if (_effectDuration > 0) then
						{
							_stats pushBack
							[
								_attributeName,
								format["<t size='1' font='puristaMedium' align='right'>%1%2%3/%4s</t>", _effectSign, abs _effectValue, _effectUnit, _effectDuration],
								linearConversion [0, 100, _effectValue, 0, 1, true]
							];
						}
						else 
						{
							_stats pushBack
							[
								_attributeName,
								format["<t size='1' font='puristaMedium' align='right'>%1%2%3</t>", _effectSign, abs _effectValue, _effectUnit],
								linearConversion [0, 100, _effectValue, 0, 1, true]
							];
						};
					}
					forEach getArray(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Consuming" >> "effects");
				};
			};
		};
		_mass = getNumber(configFile >> "CfgMagazines" >> _itemClassName >> "mass");
		_stats pushBack
		[
			"MASS", 
			format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
			linearConversion [0, 1200, _mass, 0, 1, true]
		];
		_remainingQuanity = [player,_itemClassName] call ExileLifeClient_util_inventory_quantityCarried;
		_stats pushBack
		[
			"QUANTITY", 
			format["<t size='1' font='puristaMedium' align='right'>%1</t>", _remainingQuanity],
			linearConversion [0, 0, _remainingQuanity, 0, 1, true]
		];
	};
	case "Weapon":
	{
		switch (_itemType select 1) do
		{
			case "Throw":
			{
			};
			case "MachineGun";
			case "Rifle";
			case "SniperRifle";
			case "AssaultRifle";
			case "SubmachineGun";
			case "Handgun":
			{
				_modes = getArray(configFile >> "CfgWeapons" >> _itemClassName >> "modes");
				if (count _modes > 0) then
				{
					_highestRange = 0;
					_lowestDispersion = 999;
					_lowestReloadTime = 999;
					{
						_highestRange = _highestRange max getNumber(configFile >> "CfgWeapons" >> _itemClassName >> _x >> "maxRange");
						_lowestDispersion = _lowestDispersion min getNumber(configFile >> "CfgWeapons" >> _itemClassName >> _x >> "dispersion");
						_lowestReloadTime = _lowestReloadTime min getNumber(configFile >> "CfgWeapons" >> _itemClassName >> _x >> "reloadTime");
					}
					forEach _modes;
					_roundsPerMinute = ceil(60 / _lowestReloadTime);
					_stats pushBack
					[
						"RANGE", 
						format["<t size='1' font='puristaMedium' align='right'>%1m</t>", _highestRange],
						linearConversion [0, 2200, _highestRange, 0, 1, true]
					];
					_stats pushBack
					[
						"ACCURACY", 
						"",
						linearConversion [0.00035, 0.00493, _lowestDispersion, 1, 0, true] 
					];
					_stats pushBack
					[
						"FIRE RATE", 
						format["<t size='1' font='puristaMedium' align='right'>%1rpm</t>", _roundsPerMinute],
						linearConversion [0, 4000, _roundsPerMinute, 0, 1, true]
					];
				};
			};
		};
		_mass = getNumber(configFile >> "CfgWeapons" >> _itemClassName >> "WeaponSlotsInfo" >> "mass");
		_stats pushBack
		[
			"MASS", 
			format["<t size='1' font='puristaMedium' align='right'>%1</t>", _mass],
			linearConversion [0, 1200, _mass, 0, 1, true]
		];
	};
};
_traderZone = [player] call ExileLifeClient_util_world_findGangTerritory;
if (_traderZone == "none")then 
{
	_traderZone = "Guard";
};
_tax = missionNamespace getVariable [format["ExileLifeGangTax:%1",_traderZone],0];
_salesPrice = getNumber(missionConfigFile >> "CfgExileArsenal" >> _itemClassName >> "price");
_taxAmount = abs(_popTabs - _salesPrice);
_popTabs = [_itemClassName] call ExileClient_util_gear_calculateTotalPrice;
_stats pushBack
[
	"PURCHASE PRICE", 
	format["<t size='1' font='puristaMedium' align='right'>%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", _popTabs],
	0
];
_popTabs = 0;
_popTabs = _itemClassName call ExileClient_util_gear_calculateSellPrice;
_stats pushBack
[
	"RESALE PRICE", 
	format["<t size='1' font='puristaMedium' align='right'>%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='1' shadow='true' /></t>", _popTabs],
	0
];
_stats pushBack
[
	"SALES TAX", 
	format["<t size='1' font='puristaMedium' align='right'>%1%2</t>", _tax,"%"],
	0
];
_stats
