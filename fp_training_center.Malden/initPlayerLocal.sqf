/*
	Executed locally when player joins mission (includes both mission start and JIP).
  	This script guarantees that player object exists. Init.sqf does not
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

//[] call compile preprocessFileLineNumbers "briefing.sqf";

// add tp to flags 
fpa_fnc_tp = {
  private _flags = allMissionObjects "Flag_Nato_F";
  private _missions = [];
  {
    private _args = _x getVariable ["fpa_tp", []];
    if !(_args isEqualTo []) then {
      private _pos = getPos _x;
      _args params [["_name", ""], ["_desc", ""]];
      private _onSelect = {player setPos ([param [9, getPos player], 10, "CAManBase"] call fpa_common_fnc_findSafePos)};
      _missions pushBack ([_pos, _onSelect, _name, _desc, "", "", 1, _pos]);
    };
  } forEach _flags;
  [_missions, _missions param [0] param [0]] call fpa_common_fnc_respawnMenu;
};
private _actionCondition = "vehicle ace_player == ace_player && {count (nearestObjects [player, ['Flag_Nato_F'], 3, true]) > 0}";
[["<t color='#FF00FF'>Teleport</t>", fpa_fnc_tp, 0, 99,false,true,"",_actionCondition]] call CBA_fnc_addPlayerAction;

// Apply loadout
if (!isNil "FP_fnc_getLoadout") then {
  private _added = [player, typeOf player] call FP_fnc_getLoadout;

  // Respawn with gear
  if (_added) then {
    player addEventHandler ["Respawn", {
      [player, typeOf player] call FP_fnc_getLoadout;
    }];
  };

  if (!isMultiplayer) then {
    // Give AI loadouts
    {
      [_x, typeOf _x] call FP_fnc_getLoadout;
    } forEach (switchableUnits - (entities "HeadlessClient_F" + [player]));
  };
};

// Easier arsenal in editor, validate mission
if (!isMultiplayer) then {
  // Make arsenal easier to enter
  [["<t color='#ffff00'>[ Arsenal ]</t>", {["Open", true] spawn bis_fnc_arsenal}, 0, -85, false, true, "", ""]] call CBA_fnc_addPlayerAction;
  
  // Validate unit descriptions and callsigns. Can be removed (description.ext)
  private _cfg = getMissionConfig "MissionSQM";
  if (!isNull _cfg) then {
    [_cfg] call fpa_common_fnc_validateMission;
  };
};
