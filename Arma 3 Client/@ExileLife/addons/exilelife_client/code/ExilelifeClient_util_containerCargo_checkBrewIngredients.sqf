/**
                    * ExilelifeClient_util_containerCargo_checkBrewIngredients
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

                    private["_container","_contents","_result","_brewtypes","_contains","_recipe","_ingredients","_tools","_ingredient","_quantity"];
_container = _this; 
_contents = []; 
_result = ""; 
_contents = _container call ExileClient_util_containerCargo_list; 
_brewtypes = getArray(missionConfigFile >> "CfgResources" >> "CfgBrewingRecipes" >> "TypesofBrew");  
{ 
  _contains = true;
  _recipe = _x; 
  _ingredients = getArray(missionConfigFile >> "CfgResources" >> "CfgBrewingRecipes" >> _recipe >> "ingredients"); 
  _tools = getArray(missionConfigFile >> "CfgResources" >> "CfgBrewingRecipes" >> _recipe >> "tools"); 
  { 
    _ingredient = _x select 0; 
    _quantity = _x select 1; 
    if (({_x == _ingredient} count _contents) < _quantity) exitWith 
    {
      _contains = false;
    }; 
  }forEach _ingredients; 
  if (_contains) exitWith 
  {
    _result = _recipe;
  }; 
}forEach _brewtypes;
ExileLifeBrewingRecipe = _result;
_result