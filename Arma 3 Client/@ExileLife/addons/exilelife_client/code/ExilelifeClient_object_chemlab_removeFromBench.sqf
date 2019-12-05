/**
                    * ExilelifeClient_object_chemlab_removeFromBench
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemclassname","_item","_benchItem","_array","_selection","_cnt","_selectionName","_selectionName2","_itemClassName"];
_itemclassname = _this select 0;
_item = _this select 1;
_benchItem = "";
try
{ 
	switch (_item) do 
	{ 
		case 0 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_mixing",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_mixing",[],true];
				throw "item_beaker_mixing_empty_clean";
			}
			else
			{
				if !((ExileClientInteractionObject getVariable ["item_beaker_filter_from",[]]) isEqualTo []) then 
				{
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_filter_from",[],true];
					throw "item_beaker_filter_from";
				};
			};
		}; 
		case 1 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_mixing",[]]) isEqualTo []) then 
			{
				{
					_array = ExileClientCurrentInventoryContainer getVariable [_x,[]];
					if !(_array isEqualTo []) then 
					{
						_selection = format ["%1_empty_dirty",_x];
						if ((_array select 3) isEqualTo _selection) exitWith
						{
							ExileClientCurrentInventoryContainer setVariable [_x,[],true];
							throw _selection;
						};
					};
				}forEach 
				[
					"item_beaker_acetone",
					"item_beaker_phosphoricacid",
					"item_beaker_hydrochloricacid",
					"item_beaker_mixing"
				];
			};
			if !((ExileClientInteractionObject getVariable ["item_beaker_filter_from",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_filter_from",[],true];
				throw "item_beaker_filter_from";
			};
		}; 
		case 2 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_acetone",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_acetone",[],true];
				throw "item_beaker_acetone";
			};
		}; 	
		case 3 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_phosphoricacid",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_phosphoricacid",[],true];
				throw "item_beaker_phosphoricacid";
			};
		}; 		
		case 4 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_hydrochloricacid",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_hydrochloricacid",[],true];
				throw "item_beaker_hydrochloricacid";
			};
		}; 	
		case 5 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_acetone",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_acetone",[],true];
				throw "item_beaker_acetone";
			};
		}; 			
		case 6 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_phosphoricacid",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_phosphoricacid",[],true];
				throw "item_beaker_phosphoricacid";
			};
		}; 	
		case 7 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_beaker_hydrochloricacid",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_hydrochloricacid",[],true];
				throw "item_beaker_hydrochloricacid";
			};
		}; 	
		case 11 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_ovencleaner",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_ovencleaner",[],true];
				throw "item_ovencleaner";
			};
		}; 	
		case 12 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_cooker",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_cooker",[],true];
				throw "item_cooker";
			};
		}; 	
		case 8 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_vishpirin",[]]) isEqualTo []) then 
			{
				_cnt = [ExileClientCurrentInventoryContainer,_itemclassname] call ExileLifeClient_util_containerCargo_quantity;
				if (_cnt > 0) then 
				{
					_selectionName = format ["item_vishpirin_%1",(_cnt + 1)]; 
					_selectionName2 = format ["item_vishpirin_%1",_cnt]; 
					ExileClientCurrentInventoryContainer animate [_selectionName2, 0]; 
					ExileClientCurrentInventoryContainer setVariable ["item_vishpirin",[true,true,1,_selectionName2],true];				
					throw _selectionName; 
				}
				else
				{
					ExileClientCurrentInventoryContainer setVariable ["item_vishpirin",[],true];	
					throw "item_vishpirin_1"; 
				};
			};
		}; 	
		case 9 : 
		{
			if !((ExileClientCurrentInventoryContainer getVariable ["item_filter",[]]) isEqualTo []) then 
			{
				_cnt = [ExileClientCurrentInventoryContainer,_itemclassname] call ExileLifeClient_util_containerCargo_quantity;
				if (_cnt > 0) then 
				{
					_selectionName = format ["item_filter_%1",(_cnt + 1)]; 
					_selectionName2 = format ["item_filter_%1",(_cnt)]; 
					ExileClientCurrentInventoryContainer animate [_selectionName2, 0]; 
					ExileClientCurrentInventoryContainer setVariable ["item_filter",[true,true,1,_selectionName2],true];				
					throw _selectionName; 
				}
				else
				{
					ExileClientCurrentInventoryContainer setVariable ["item_filter",[],true];	
					throw "item_filter_1"; 
				};
			};
		}; 	
		default 
		{
			[ExileClientCurrentInventoryContainer,player,_itemClassName] call ExileLifeClient_util_containerCargo_takeFromContainer;
		}; 
	};	
}
catch
{
	_benchItem = _exception;
};
if ((_benchItem isEqualTo "") || (isNil "_benchItem")) exitWith {};
ExileClientCurrentInventoryContainer animate [_benchItem, 1];  
