---@meta _

Tinkr = {}

---It is a userdata type used by the Tinkr API to reference an internal
---game object. This direct object reference is the most performant way to pass objects around.
---@class Tinkr.WowGameObject
Tinkr.WowGameObject = {}

---@alias Tinkr.ObjectReference Tinkr.WowGameObject|string Many of the Tinkr APIs accept an Object Reference as their argument

---Attempts to create a given directory.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/CreateDirectory/)<br>
---Example:
---```lua
---local success = CreateDirectory('scripts/myfolder')
---```
---@param dir string
---@return boolean
function Tinkr.CreateDirectory(dir) end

---Attempts to create a given directory.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/CreateDirectory/)<br>
---Example:
---```lua
---local success = CreateFolder('scripts/myfolder')
---```
---@param dir string
---@return boolean
function Tinkr.CreateFolder(dir) end

---Deletes a file from the system.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/DeleteFile/)<br>
---Example:
---```lua
---local exists = DeleteFile('scripts/test.txt')
---```
---@param file string
---@return boolean
function Tinkr.DeleteFile(file) end

---Checks if the given directory exists.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/DirectoryExists/)<br>
---Example:
---```lua
---local exists = DirectoryExists('scripts/myfolder')
---```
---@param dir string
---@return boolean
function Tinkr.DirectoryExists(dir) end

---Checks if the given directory exists.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/DirectoryExists/)<br>
---Example:
---```lua
---local exists = FolderExists('scripts/myfolder')
---```
---@param dir string
---@return boolean
function Tinkr.FolderExists(dir) end

---Checks if the given file exists.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/FileExists/)<br>
---Example:
---```lua
---local exists = FileExists('scripts/test.lua')
---```
---@param file string
---@return boolean
function Tinkr.FileExists(file) end

---List all directories in a given directory.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/ListDirectories/)<br>
---Example:
---```lua
---local files = ListDirectories('scripts')
---
---for _, file in ipairs(files) do
---    print(file)
---end
---```
---@param dir string
---@return string[] files
function Tinkr.ListDirectories(dir) end

---List all directories in a given directory.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/ListDirectories/)<br>
---Example:
---```lua
---local files = ListFolders('scripts')
---
---for _, file in ipairs(files) do
---    print(file)
---end
---```
---@param dir string
---@return string[] files
function Tinkr.ListFolders(dir) end

---List all files in a given directory.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/ListFiles/)<br>
---Example:
---```lua
---local files = ListFiles('scripts')
---
---for _, file in ipairs(files) do
---    print(file)
---end
---```
---@param dir string
---@return string[] files
function Tinkr.ListFiles(dir) end

---List all files in a given zip.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/ListZipEntries/)<br>
---Example:
---```lua
---local files = ListZipEntries('test.zip')
---
---for _, file in ipairs(files) do
---    print(file)
---end
---```
---@param path string
---@return string[] files
function Tinkr.ListZipEntries(path) end

---Reads the contents of a given file.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/ReadFile/)<br>
---Example:
---```lua
---local data = ReadFile('scripts/test.json')
---```
---@param path string
---@return string|boolean
function Tinkr.ReadFile(path) end

---Reads the contents of a given file inside a zip archive.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/ReadZipEntry/)<br>
---Example:
---```lua
---local data = ReadZipEntry('test.zip', 'test.json')
---```
---@param zip string
---@param path string
---@return string|boolean
function Tinkr.ReadZipEntry(zip, path) end

---Writes the data to a given file.<br>
---[Documentation](https://docs.tinkr.site/Lua/Filesystem/WriteFile/)<br>
---Example:
---```lua
---local success = WriteFile('test.txt', 'Hello World', false)
---```
---@param path string
---@param data string
---@param append boolean?
---@return boolean
function Tinkr.WriteFile(path, data, append) end

---Sends an afk clear packet to the server. This is like typing /afk<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/ClearAFK/)<br>
---Example:
---```lua
---ClearAFK()
---```
function Tinkr.ClearAFK() end

---Clears the target object.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/ClearNPCObject/)<br>
---Example:
---```lua
---ClearNPCObject()
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.ClearNPCObject(objectReference) end

---Clears the target object.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/ClearTargetObject/)<br>
---Example:
---```lua
---ClearTargetObject()
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.ClearTargetObject(objectReference) end

---Clicks the ground at the given position. This is useful for casting spells on the ground.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/Click/)<br>
---Example 1:
---```lua
---Click(x, y, z)
----- chainable
---cast(spellid, target):click(x,y,z)
---cast(spellid, target):atcursor()
---cast(spellId, 'none'):clickunit('target')
---```
---
---Example 2:
---```lua
-----Casts a pending ground spell at the targets feet.
---
---local pending = IsSpellPending()
---if pending == 64 then
---    local x, y, z = ObjectPosition('target')
---    Click(x, y, z)
---end
---```
---@param x number
---@param y number
---@param z number
function Tinkr.Click(x, y, z) end

---Checks if a cursor spell cast is pending.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/IsSpellPending/)<br>
---Example:
---```lua
----- Checks if a ground spell cast is pending.
---local pending = IsSpellPending()
---if pending == 64 then
---    -- a ground cast spell is pending
---end
---```
---@return number
function Tinkr.IsSpellPending() end

---Left click an object.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/LeftClickObject/)<br>
---Example:
---```lua
-----Interact with dead unit.
---
---if UnitIsDeadOrGhost('target') then
---    LeftClickObject('target')
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.LeftClickObject(objectReference) end

---Releases an empowered spell.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/ReleaseEmpoweredSpell/)<br>
---Example:
---```lua
---ReleaseEmpoweredSpell(1234)
---```
---@param spellID number
function Tinkr.ReleaseEmpoweredSpell(spellID) end

---Right click an object.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/RightClickObject/)<br>
---Example:
---```lua
-----Interact with dead unit.
---
---if UnitIsDeadOrGhost('target') then
---    RightClickObject('target')
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.RightClickObject(objectReference) end

---Sends a heartbeat packet to the server. This is useful for doing things like disengaging backwards.<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/SendMovementHeartbeat/)<br>
---Example:
---```lua
---SendMovementHeartbeat()
---```
---@return boolean
function Tinkr.SendMovementHeartbeat() end

---Sets the mouseover to a [ObjectReference](lua://Tinkr.ObjectReference)<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/SetMouseover/)<br>
---Example:
---```lua
---local target = Object('target')
---SetMouseover(target)
----- do something with "mouseover"
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.SetMouseover(objectReference) end

---Sets the NPC object object to a [ObjectReference](lua://Tinkr.ObjectReference)<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/SetNPCObject/)<br>
---Example:
---```lua
---local focus = Object('focus')
---SetNPCObject(focus)
----- do something with "target"
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.SetNPCObject(objectReference) end

---Sets the target object to a [ObjectReference](lua://Tinkr.ObjectReference)<br>
---[Documentation](https://docs.tinkr.site/Lua/Interaction/SetTargetObject/)<br>
---Example:
---```lua
---local focus = Object('focus')
---SetTargetObject(focus)
----- do something with "target"
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.SetTargetObject(objectReference) end

---Returns the position of the camera.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/CameraPosition/)<br>
---Example:
---```lua
---local x, y, z = CameraPosition()
---```
---@return number x, number y, number z
function Tinkr.CameraPosition() end

---Face the player in the direction given (in radians).<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/FaceDirection/)<br>
---Example:
---```lua
-----Face the player north.
---
---FaceDirection(0, true)
---```
---@param dir number
---@param update boolean?
function Tinkr.FaceDirection(dir, update) end

---Face the player at a [ObjectReference](lua://Tinkr.ObjectReference)<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/FaceObject/)<br>
---Example:
---```lua
-----Face the target.
---
---FaceObject('target')
---```
---@param objectReference Tinkr.ObjectReference
function Tinkr.FaceObject(objectReference) end

---GeneratePath a path between two positions for the given map ID.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/GeneratePath/)<br>
---Path Types:
---```lua
---local PathTypes = {
---    PATHFIND_BLANK = 0x00, -- path not built yet
---    PATHFIND_NORMAL = 0x01, -- normal path
---    PATHFIND_SHORTCUT = 0x02, -- travel through obstacles, terrain, air, etc (old behavior)
---    PATHFIND_INCOMPLETE = 0x04, -- we have partial path to follow - getting closer to target
---    PATHFIND_NOPATH = 0x08, -- no valid path at all or error in generating one
---    PATHFIND_NOT_USING_PATH = 0x10, -- used when we are either flying/swiming or on map w/o mmaps
---    PATHFIND_SHORT = 0x20, -- path is longer or equal to its limited path length
---}
---```
---Example:
---```lua
-----Generate a path between the player and target.
---
---local x1, y1, z1 = ObjectPosition('player')
---local x2, y2, z2 = ObjectPosition('target')
---local mapId = GetMapID()
---local path, pathType = GeneratePath(x1, y1, z1, x2, y2, z2, mapId)
---if pathType == PathTypes.PATHFIND_NORMAL then
---    for index, point in ipairs(path) do
---        -- do something with each point
---        -- point.x, point.y, point.z
---    end
---end
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param mapId number
---@return {x:number, y:number, z:number}[] points, number pathType 
function Tinkr.GeneratePath(x1, y1, z1, x2, y2, z2, mapId) end

---GeneratePath a path between two positions for the given map ID, attaching an extra weight to each poly edge examined.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/GeneratePathWeighted/)<br>
---Example:
---```lua
----- Generate a path between the player and target.
---
---local px, py, pz = ObjectPosition('player')
---local tx, ty, tz = ObjectPosition('target')
---local mapID = GetMapID()
--- 
---local weighted = function(ax, ay, az, bx, by, bz)
---    local extraWeight = 0.0 -- float
---    -- poly edge A is ax, ay, az
---    -- poly edge B is bx, by, bz
---    -- callback is for movement between poly edge A and B
--- 
---    -- higher weights are avoided
---    return extraWeight
---end
--- 
---local path = GeneratePathWeighted(px, py, pz, tx, ty, tz, mapID, weighted)
---```
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param mapId number
---@param callback fun(x1:number, y1:number, z1:number, x2:number, y2:number, z2:number):number
---@return {x:number, y:number, z:number}[] points
function Tinkr.GeneratePathWeighted(x1, y1, z1, x2, y2, z2, mapId, callback) end

---Returns the current area info.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/GetAreaInfo/)<br>
---Example:
---```lua
---local areaInfo = GetAreaInfo()
---local continent = areaInfo.continentID
---```
---@return {continentID:number, areaID:number, parentAreaID:number}
function Tinkr.GetAreaInfo() end

---Returns the position of the players corpse.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/GetCorpsePosition/)<br>
---Example:
---```lua
---local x, y, z = GetCorpsePosition(x, y, z)
---```
---@return number x, number y, number z
function Tinkr.GetCorpsePosition() end

---Returns the position of the players corpse.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/GetCorpsePosition/)<br>
---Example:
---```lua
---local x, y, z = GetCorpseLocation(x, y, z)
---```
---@return number x, number y, number z
function Tinkr.GetCorpseLocation() end

---Returns the current mapID for use with GeneratePath.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/GetMapID/)<br>
---Example:
---```lua
---local mapID = GetMapID()
---```
---@return number
function Tinkr.GetMapID() end

---Get the players current pitch<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/GetPitch/)<br>
---Example:
---```lua
-----Slightly angle the character
---
---local theta = GetPitch() + 0.1
---SetPitch(theta)
---```
---
function Tinkr.GetPitch() end

---Click to Move to a given position.<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/MoveTo/)<br>
---Example:
---```lua
-----Click to move to the target position.
---
---local x, y, z = ObjectPosition('target')
---MoveTo(x, y, z)
---```
---@param x number
---@param y number
---@param z number
function Tinkr.MoveTo(x, y, z) end

---Click to Move to a raw position ignoring transport world relativity<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/MoveToRaw/)<br>
---Example:
---```lua
---
---local x, y, z = ObjectRawPosition('target')
---MoveToRaw(x, y, z)
---```
function Tinkr.MoveToRaw(x, y, z) end

---Set your players rotation instantly to face a direction using the games input controller<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/SetHeading/)<br>
---Example:
---```lua
---local theta = ObjectRotation('player') + 0.1
---SetHeading(theta)
---```
---@param theta number
function Tinkr.SetHeading(theta) end

---Returns the spellID of a WowGameObject representation of an Area Trigger<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/AreaTriggerSpell/)<br>
---Example:
---```lua
---local id = AreaTriggerSpell(object)
---```
---@param object Tinkr.ObjectReference
---@return number spellID
function Tinkr.AreaTriggerSpell(object) end

---Returns the gameobject type of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/GameObjectType/)<br>
---Example:
---```lua
-----enum eGameObjType { 
-----  GOT_Door=0, 
-----  GOT_Button=1, 
-----  GOT_QuestGiver=2, 
-----  GOT_Chest=3, 
-----  GOT_Binder=4, 
-----  GOT_Generic=5, 
-----  GOT_Trap=6, 
-----  GOT_Chair=7, 
-----  GOT_SpellFocus=8, 
-----  GOT_Text=9, 
-----  GOT_Goober=0xa, 
-----  GOT_Transport=0xb, 
-----  GOT_AreaDamage=0xc, 
-----  GOT_Camera=0xd, 
-----  GOT_WorldObj=0xe, 
-----  GOT_MapObjTransport=0xf, 
-----  GOT_DuelArbiter=0x10, 
-----  GOT_FishingNode=0x11, 
-----  GOT_Ritual=0x12, 
-----  GOT_Mailbox=0x13, 
-----  GOT_AuctionHouse=0x14, 
-----  GOT_SpellCaster=0x16, 
-----  GOT_MeetingStone=0x17, 
-----  GOT_Unkown18=0x18, 
-----  GOT_FishingPool=0x19, 
-----  GOT_FORCEDWORD=0xFFFFFFFF, 
-----};
---local type = GameObjectType('target')
---if type == 7 then
---    print("OMG A chair, lets sit")
---end
---```
---@return number|boolean
function Tinkr.GameObjectType(object) end

---Gets a list of all Missiles.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/Missiles/)<br>
---Example 1:
---```lua
---local Missiles = Missiles()
--- 
---for i, missile in ipairs(Missiles) do
---    -- handle missile
---end 
---```
---Example 2:
---```lua
---for m in ObjectManager:Missiles() do
---  -- inital -> hit
---  -- draw:SetColor(255, 255, 255, 128)
---  draw:Line(m.ix, m.iy, m.iz, m.hx, m.hy, m.hz)
---
---  -- current -> hit
---  -- draw:SetColor(3, 252, 11, 256)
---  draw:Line(m.cx, m.cy, m.cz, m.hx, m.hy, m.hz)
---
---  -- model -> hit
---  if m.mx and m.my and m.mz then
---    -- draw:SetColor(3, 252, 252, 256)
---    draw:Line(m.mx, m.my, m.mz, m.hx, m.hy, m.hz)
---  end
---
---  -- draw:SetColor(255, 255, 255, 255)
---  local cdt = Common.Distance(m.cx, m.cy, m.cz, m.hx, m.hy, m.hz)
---  local spell = GetSpellInfo(m.spellId)
---  draw:Text((spell or m.spellId), "NumberFont_Small", m.cx, m.cy, m.cz + 1.35)
---end
---```
function Tinkr.Missiles() end

---Gets a single object.<br> All [WowGameObject](lua://Tinkr.WowGameObject) references are ephemeral, and should never 
---be stored for use later. Use the object inside the context of the iteration or directly after obtaining it. 
---There is no guarantee on an objects lifetime and they will be garbage collected as soon as possible.
---[Documentation](https://docs.tinkr.site/Lua/Objects/Object/)<br>
---Example:
---```lua
-----Geth a WowGameObject reference to the player.
---
---local object = Object('player')
-- handle object
---```
---@param unitID string
---@return Tinkr.WowGameObject
function Tinkr.Object(unitID) end

---Get an objects hidden aura<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectAura/)<br>
---Example:
---```lua
---for i = 1, 40 do
---    local _, _, count, _, _, _, _, _, _, spellId, _, _, _, _, _ = UnitAura("player", i, "HELPFUL")
---    -- Do something with spellId
---end
---```
---@param object Tinkr.ObjectReference
---@param index number
---@return any, any, number count, _, _, _, _, _, _, number spellID, _, _, _, _, _
function Tinkr.ObjectAura(object, index) end

---Returns the bounding radius of a [WowGameObject](lua://Tinkr.WowGameObject) in radians. This is the size of the object 
---used for calculating attack range.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectBoundingRadius/)<br>
---Example 1:
---```lua
-----Get the players radius.
---
---local radius = ObjectBoundingRadius('player')
---```
---Example 2:
---```lua
-----Do something with the radius of all objects.
---
---for i, object in ipairs(Objects()) do
---    local radius = ObjectBoundingRadius(object)
---    -- do something with radius
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number
function Tinkr.ObjectBoundingRadius(objectReference) end

---Returns the casting and channeling spell of a [WowGameObject](lua://Tinkr.WowGameObject).<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectCastingInfo/)<br>
---Example:
---```lua
---local casting, channeling = ObjectCastingInfo('player')
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean, number
function Tinkr.ObjectCastingInfo(objectReference) end

---Returns a [WowGameObject](lua://Tinkr.WowGameObject) representing the destination for a units current spell cast.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectCastingTarget/)<br>
---Example:
---```lua
---local target = ObjectCastingTarget('player')
---```
---@param objectReference Tinkr.ObjectReference
---@return Tinkr.WowGameObject|boolean
function Tinkr.ObjectCastingTarget(objectReference) end

---Returns the combat reach of a [WowGameObject](lua://Tinkr.WowGameObject).This is how far the unit 
---can account an object from its position.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectCombatReach/)<br>
---Example 1:
---```lua
-----Get the players current reach.
---
---local reach = ObjectCombatReach('player')
---```
---Example 2:
---```lua
-----Do something with the reach of all objects.
---
---for i, object in ipairs(Objects()) do
---    local reach = ObjectCombatReach(object)
---    -- do something with reach
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectCombatReach(objectReference) end

---Returns the creator of the [WowGameObject](lua://Tinkr.WowGameObject). This would be used to check the 
---creator of a fishing bobber for example.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectCreator/)<br>
---Example:
---```lua
---local creator = ObjectCreator(object)<br>
---```
---@param objectReference Tinkr.ObjectReference
---@return Tinkr.ObjectReference|boolean
function Tinkr.ObjectCreator(objectReference) end

---Returns the creature type of a [WowGameObject](lua://Tinkr.WowGameObject).<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectCreatureType/)<br>
---Example 1:
---```lua
-----Get the targets creature type.
---
---local type, typeStr = ObjectCreatureType('target')
---```
---Example 2:
---```lua
-----Do something with the create type of all objects.
---
---for i, object in ipairs(Objects()) do
---    local type, typeStr = ObjectCreatureType('target')
---    print('target type is', type, 'a', typeStr)
---    -- do something with type
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectCreatureType(objectReference) end

---Returns the distance between two [WowGameObject](lua://Tinkr.WowGameObject)'s.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectDistance/)<br>
---Example 1:
---```lua
-----Get the distance between the player and the target.
---
---local distance = ObjectDistance('player', 'target')
---```
---Example 2:
---```lua
-----Do something with the distance between the player and all objects.
---
---for i, object in ipairs(Objects()) do
---    local distance = ObjectDistance('player', object)
---    -- do something with distance
---end
---```
---@param objectReference1 Tinkr.ObjectReference
---@param objectReference2 Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectDistance(objectReference1, objectReference2) end

---Set your players rotation instantly to face a direction using the games input controller<br>
---[Documentation](https://docs.tinkr.site/Lua/Movement/SetPitch/)<br>
---Example:
---```lua
---local theta = GetPitch() + 0.1
---SetPitch(theta)
---```
---@param theta number
function Tinkr.SetPitch(theta) end

---@class Tinkr.Util
Tinkr.Util = {}

---@class Tinkr.Util.HTTP
Tinkr.Util.HTTP = {}


---@param request {url:string, headers: string[], body: string, fields: table<string, any>, files: table<string, string>, method:string, callback:fun(status:number, response: string)}
function Tinkr.Util.HTTP:Request(request) end
