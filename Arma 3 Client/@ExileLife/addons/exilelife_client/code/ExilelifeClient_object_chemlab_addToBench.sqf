/**
                    * ExilelifeClient_object_chemlab_addToBench
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_itemclassname","_item","_benchItem","_array","_cnt","_selectionName"];
_itemclassname = _this select 0;
_item = _this select 1;
_benchItem = "";
try
{ 
	switch (_item) do 
	{ 
		case 0 : 
		{
			if ((ExileClientCurrentInventoryContainer getVariable ["item_beaker_mixing",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_mixing",[true,true,0,"item_beaker_mixing_empty_clean"],true];
				throw "item_beaker_mixing_empty_clean";
			}
			else
			{
				if ((ExileClientInteractionObject getVariable ["item_beaker_filter_from",[]]) isEqualTo []) then 
				{
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_filter_from",[true,true,0,"item_beaker_filter_from"],true];
					throw "item_beaker_filter_from";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};													
			};
		}; 
		case 1 : 
		{
			if ((ExileClientCurrentInventoryContainer getVariable ["item_beaker_mixing",[]]) isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_mixing",[true,false,0,"item_beaker_mixing_empty_dirty"],true];
				throw "item_beaker_mixing_empty_dirty";
			}
			else
			{
				if ((ExileClientCurrentInventoryContainer getVariable ["item_beaker_filter_from",[]]) isEqualTo []) then 
				{
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_filter_from",[true,false,0,"item_beaker_filter_from"],true];
					throw "item_beaker_filter_from";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};													
			};
		}; 		
		case 2 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_beaker_acetone",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_acetone",[true,true,0,"item_beaker_acetone"],true];
				throw "item_beaker_acetone";
			}
			else
			{
				if ((_array select 3) isEqualTo "item_beaker_acetone_empty") then 
				{
					[ExileClientCurrentInventoryContainer,player,"ExileLife_Item_Beaker_Dirty"] call ExileLifeClient_util_containerCargo_takeFromContainer;				
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_acetone",[true,true,0,"item_beaker_acetone"],true];
					throw "item_beaker_acetone";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};
			};
		 }; 	
		case 3 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_beaker_phosphoricacid",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_phosphoricacid",[true,true,0,"item_beaker_phosphoricacid"],true];
				throw "item_beaker_phosphoricacid";
			}
			else
			{
				if ((_array select 3) isEqualTo "item_beaker_phosphoricacid_empty") then 
				{
					[ExileClientCurrentInventoryContainer,player,"ExileLife_Item_Beaker_Dirty"] call ExileLifeClient_util_containerCargo_takeFromContainer;				
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_phosphoricacid",[true,true,0,"item_beaker_phosphoricacid"],true];
					throw "item_beaker_phosphoricacid";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};
			};
		 }; 			
		case 4 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_beaker_hydrochloricacid",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_hydrochloricacid",[true,true,0,"item_beaker_hydrochloricacid"],true];
				throw "item_beaker_hydrochloricacid";
			}
			else
			{
				if ((_array select 3) isEqualTo "item_beaker_hydrochloricacid_empty") then 
				{
					[ExileClientCurrentInventoryContainer,player,"ExileLife_Item_Beaker_Dirty"] call ExileLifeClient_util_containerCargo_takeFromContainer;				
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_hydrochloricacid",[true,true,0,"item_beaker_hydrochloricacid"],true];
					throw "item_beaker_hydrochloricacid";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};
			};
		 }; 
		case 5 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_beaker_acetone",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_acetone",[true,false,0,"item_beaker_acetone"],true];
				throw "item_beaker_acetone";
			}
			else
			{
				if ((_array select 3) isEqualTo "item_beaker_acetone_empty") then 
				{
					[ExileClientCurrentInventoryContainer,player,"ExileLife_Item_Beaker_Dirty"] call ExileLifeClient_util_containerCargo_takeFromContainer;				
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_acetone",[true,false,0,"item_beaker_acetone"],true];
					throw "item_beaker_acetone";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};
			};
		 }; 				
		case 6 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_beaker_phosphoricacid",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_phosphoricacid",[true,false,0,"item_beaker_phosphoricacid"],true];
				throw "item_beaker_phosphoricacid";
			}
			else
			{
				if ((_array select 3) isEqualTo "item_beaker_phosphoricacid_empty") then 
				{
					[ExileClientCurrentInventoryContainer,player,"ExileLife_Item_Beaker_Dirty"] call ExileLifeClient_util_containerCargo_takeFromContainer;				
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_phosphoricacid",[true,false,0,"item_beaker_phosphoricacid"],true];
					throw "item_beaker_phosphoricacid";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};
			};
		 }; 
		case 7 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_beaker_hydrochloricacid",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_beaker_hydrochloricacid",[true,false,0,"item_beaker_hydrochloricacid"],true];
				throw "item_beaker_hydrochloricacid";
			}
			else
			{
				if ((_array select 3) isEqualTo "item_beaker_hydrochloricacid_empty") then 
				{
					[ExileClientCurrentInventoryContainer,player,"ExileLife_Item_Beaker_Dirty"] call ExileLifeClient_util_containerCargo_takeFromContainer;				
					ExileClientCurrentInventoryContainer setVariable ["item_beaker_hydrochloricacid",[true,false,0,"item_beaker_hydrochloricacid"],true];
					throw "item_beaker_hydrochloricacid";
				}
				else
				{
					[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
				};
			};
		 }; 
		case 11 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_ovencleaner",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_ovencleaner",[true,true,0,"item_ovencleaner"],true];
				throw "item_ovencleaner";
			}
			else
			{
				[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
			};
		 }; 
		case 12 : 
		{  
			_array = ExileClientCurrentInventoryContainer getVariable ["item_cooker",[]];
			if (_array isEqualTo []) then 
			{
				ExileClientCurrentInventoryContainer setVariable ["item_cooker",[true,true,0,"item_cooker"],true];
				throw "item_cooker";
			}
			else
			{
				[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
			};
		 }; 
		case 8 : 
		{ 
			_cnt = [ExileClientCurrentInventoryContainer,_itemclassname] call ExileLifeClient_util_containerCargo_quantity;
			if (_cnt < 7) then 
			{
				_selectionName = format ["item_vishpirin_%1",_cnt];
				ExileClientCurrentInventoryContainer setVariable ["item_vishpirin",[true,true,1,_selectionName],true];				
				throw _selectionName; 
			}
			else
			{
				[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
			};
		}; 	
		case 9 : 
		{ 
			_cnt = [ExileClientCurrentInventoryContainer,_itemclassname] call ExileLifeClient_util_containerCargo_quantity;
			if (_cnt < 3) then 
			{
				_selectionName = format ["item_filter_%1",_cnt];
				ExileClientCurrentInventoryContainer setVariable ["item_filter",[true,true,1,_selectionName],true];				
				throw _selectionName; 
			}
			else
			{
				[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
			};
		}; 
		default 
		{
			[ExileClientCurrentInventoryContainer,player,_itemclassname] call ExileLifeClient_util_containerCargo_takeFromContainer;
		}; 
	};	
}
catch
{
	_benchItem = _exception;
};
if ((_benchItem isEqualTo "") || (isNil "_benchItem")) exitWith {};
ExileClientCurrentInventoryContainer animate [_benchItem, 0];  //turn on