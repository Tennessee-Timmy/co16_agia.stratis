//POSTINIT
//
//
if !(mission_headless_controller) exitWith { };

//
// [[*spawn logic*,*patrol logic*],*spawn distance*,*patrol distance*,[*side*,*unitArray*],[*patrol buildings*,*stance*,*speed*],*outer spawn*,[*min*,*max*],*offencive*,*skill*,[*startCached*,*limit*,*disabled*],*wave_var*] call aiMaster_fnc_aiSpawnInf;
// [[*spawn logic*,*patrol logic*],*spawn distance*,*patrol distance*,[*side*,*unitArray*],[*only roads*,*stance*,*speed*,*trans*],*outer spawn*,*road spawn*,[*min*,*max*],*offencive*,*skill*,[*startCached*,*limit*,*disabled*],*wave_var*] call aiMaster_fnc_aiSpawnVeh;



//mid_1
[mid_1,100,100,[east,3],[false,"SAFE","LIMITED"],false,[1,2],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


//mid_2
[mid_2,30,30,[east,3],[false,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


//mid_3
[mid_3,30,30,[east,2],[false,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[mid_3,30,30,[east,3],[true,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


//mid_4
[mid_4,30,100,[east,3],[false,"SAFE","LIMITED"],false,[1,1],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


//town_3
[town_3,30,30,[east,2],[false,"SAFE","LIMITED"],false,[4,4],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[town_3,30,30,[east,2],[false,"SAFE","LIMITED"],false,[1,1],[false,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[town_3,75,75,[east,3],[true,"SAFE","LIMITED"],false,[4,4],[false,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;


//town_1
//far
[town_1,800,800,[east,3],[false,"SAFE","LIMITED"],true,[5,5],[true,true],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[town_1,1500,500,[east,3],[false,"SAFE","LIMITED"],true,[10,10],[true,true],1,[true,10,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[town_1,800,800,[east,3],[false,"SAFE","LIMITED"],true,[5,5],[false,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
//close
[town_1,200,200,[east,3],[false,"SAFE","LIMITED"],false,[5,5],[true,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[town_1,200,200,[east,3],[false,"SAFE","LIMITED"],false,[8,8],[false,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[town_1,200,200,[east,3],[true,"SAFE","LIMITED"],true,[5,5],[false,true],1,[true,50,false,false,[350,450]]] call aiMaster_fnc_aiSpawnInf;

// Vehicle
[town_1,250,250,[east,2],[true,"AWARE","LIMITED",false],[false,[0,1]],true,[1,1],[true,false],1,[false,10,true,false]] call aiMaster_fnc_aiSpawnVeh;
[town_1,500,500,[east,1],[true,"AWARE","LIMITED",false],[false,[0,1]],true,[3,3],[true,false],1,[true,10,false,false]] call aiMaster_fnc_aiSpawnVeh;
//backup vehicles
[[backup_1,town_1],250,250,[east,4],[true,"AWARE","LIMITED",false],[false,[1,1]],true,[5,15],[true,true],1,[true,3,false,false]] call aiMaster_fnc_aiSpawnVeh;
[[backup_1,town_1],250,250,[east,1],[true,"AWARE","LIMITED",false],[false,[0,1]],true,[5,15],[true,true],1,[true,3,false,false]] call aiMaster_fnc_aiSpawnVeh;
[[backup_1,town_1],250,250,[east,2],[true,"AWARE","LIMITED",false],[false,[0,1]],true,[1,1],[true,true],1,[true,3,false,false]] call aiMaster_fnc_aiSpawnVeh;


//town_2
[town_2,75,75,[east,3],[false,"SAFE","LIMITED"],false,[4,4],[false,false],1,[true,50,false,false,[700,800]]] call aiMaster_fnc_aiSpawnInf;
[town_2,75,75,[east,3],[true,"SAFE","LIMITED"],true,[4,4],[false,true],1,[true,50,false,false,[350,450]]] call aiMaster_fnc_aiSpawnInf;
