---@meta _

---@class Tinkr
Tinkr = {}

---It is a userdata type used by the Tinkr API to reference an internal
---game object. This direct object reference is the most performant way to pass objects around.
---@class Tinkr.WowGameObject
Tinkr.WowGameObject = {}

---@alias Tinkr.WowObjectType number
---| 0 # Object
---| 1 # Item,
---| 2 # Container,
---| 3 # AzeriteEmpoweredItem,
---| 4 # AzeriteItem,
---| 5 # Unit,
---| 6 # Player,
---| 7 # ActivePlayer,
---| 8 # GameObject,
---| 9 # DynamicObject,
---| 10 # Corpse,
---| 11 # AreaTrigger,
---| 12 # SceneObject,
---| 13 # ConversationData

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

---Returns the flags of a [WowGameObject](lua://Tinkr.WowGameObject).<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectFlags/)<br>
---Example 1:
---```lua
-----Get a units flags.
---
---local flags1, flags2, flags3, flags4, unitFlags1, unitFlags2, dynamicFlags = ObjectFlags('target')
---```
---Example 2:
---```lua
-----Get an objects flags.
---
---local flags, animationFlags = ObjectFlags(object)
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean, number ...
function Tinkr.ObjectFlags(objectReference) end

---Returns the GUID of a [WowGameObject](lua://Tinkr.WowGameObject). This is equal to UnitGUID but supports any object<bR>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectGUID/)<br>
---Example:
---```lua
-----Get a units guid.
---local guid = ObjectGUID('target')
---
-----Check if object is the player
---local pguid = ObjectGUID('player')
---return pguid == guid
---```
---@param objectReference Tinkr.ObjectReference
---@return string|boolean
function Tinkr.ObjectGUID(objectReference) end

---Returns the hight of a [WowGameObject](lua://Tinkr.WowGameObject).<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectHeight/)<br>
---Example 1:
---```lua
-----Get the players height.
---
---local height = ObjectHeight('player')
---```
---Example 2:
---```lua
-----Do something with the heights of all objects.
---
---for i, object in ipairs(Objects()) do
---    local height = ObjectHeight(object)
---    -- do something with height
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectHeight(objectReference) end

---Returns the ID of a WowGameObject.
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectId/)<br>
---Example 1:
---```lua
-----Get the targets id.
---
---local id = ObjectId('target')
---```
---
---Example 2:
---```lua
---for i, object in ipairs(Objects()) do
---    local id = ObjectId(object)
---    -- do something with id
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectId(objectReference) end

---Check if a WowGameObject is outside (AKA not in a cave).<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectIsOutdoors/)<br>
---Example:
---```lua
---local isoutside = ObjectIsOutdoors('target')
---if isoutside then
---    print("OMG The sun")
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.ObjectIsOutdoors(objectReference) end

---Check if a WowGameObject is submerged (AKA in the water).<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectIsSubmerged/)<br>
---Example:
---```lua
---local issubmerged = ObjectIsSubmerged('target')
---if issubmerged then
---    print("OMG The wet")
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.ObjectIsSubmerged(objectReference) end

---Returns if a WowGameObject is lootable or not.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectLootable/)<br>
---```lua
---local lootable = ObjectLootable('target')<br>
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.ObjectLootable(objectReference) end

---Returns the current movement state of a Unit<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectMovementFlag/)<br>
---Example:
---```lua
---local Flags = {
---  NONE = 0x00000000,
---  FORWARD = 0x00000001,
---  BACKWARD = 0x00000002,
---  STRAFELEFT = 0x00000004,
---  STRAFERIGHT = 0x00000008,
---  TURNLEFT = 0x00000010,
---  TURNRIGHT = 0x00000020,
---  PITCHUP = 0x00000040,
---  PITCHDOWN = 0x00000080,
---  WALKMODE = 0x00000100,
---  ONTRANSPORT = 0x00000200,
---  LEVITATING = 0x00000400,
---  ROOT = 0x00000800,
---  FALLING = 0x00001000,
---  FALLINGFAR = 0x00002000,
---  PENDINGSTOP = 0x00004000,
---  PENDINGSTRAFESTOP = 0x00008000,
---  PENDINGFORWARD = 0x00010000,
---  PENDINGBACKWARD = 0x00020000,
---  PENDINGSTRAFELEFT = 0x00040000,
---  PENDINGSTRAFERIGHT = 0x00080000,
---  PENDINGROOT = 0x00100000,
---  SWIMMING = 0x00200000,
---  ASCENDING = 0x00400000,
---  DESCENDING = 0x00800000,
---  CAN_FLY = 0x01000000,
---  FLYING = 0x02000000,
---  SPLINEELEVATION = 0x04000000,
---  SPLINEENABLED = 0x08000000,
---  WATERWALKING = 0x10000000,
---  SAFEFALL = 0x20000000,
---  HOVER = 0x40000000
---}
---local flag = ObjectMovementFlag('target')
---if flag == Flags.FORWARD then print("YAY WALKING FORWARD") end
---```
---@param objectReference Tinkr.ObjectReference
---@return number
function Tinkr.ObjectMovementFlag(objectReference) end

---Returns the objectReference that the WowGameObject is moving on.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectMover/)<br>
---Example:
---```lua
---local mover = ObjectMover('player')
---```
---@param objectReference Tinkr.ObjectReference
---@return Tinkr.ObjectReference|boolean
function Tinkr.ObjectMover(objectReference) end

---Returns the name of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectName/)<br>
---Example 1:
---```lua
-----Get the players name.
---
---local name = ObjectName('player')
---```
---Example 2:
---```lua
-----Do something with the names of all objects.
---
---for i, object in ipairs(Objects()) do
---    local name = ObjectName(object)
---    -- do something with name
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return string|boolean
function Tinkr.ObjectName(objectReference) end

---Returns the position of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectPosition/)<br>
---Example 1:
---```lua
-----Get the players current position.
---
---local x, y, z = ObjectPosition('player')
---```
---Example 2:
---```lua
-----Do something with the position of all objects.
---
---for i, object in ipairs(Objects()) do
---    local x, y, z = ObjectPosition(object)
---    -- do something with x, y, z
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number x, number y, number z
function Tinkr.ObjectPosition(objectReference) end

---Returns the raw position of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectRawPosition/)<br>
---Example 1:
---```lua
-----Get the players current position.
---
---local x, y, z = ObjectRawPosition('player')
---```
---Example 2:
---```lua
-----Do something with the position of all objects.
---
---for i, object in ipairs(Objects()) do
---    local x, y, z = ObjectRawPosition(object)
---    -- do something with x, y, z
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number x, number y, number z
function Tinkr.ObjectRawPosition(objectReference) end

---Returns the raw rotation of a WowGameObject in radians.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectRawRotation/)<br>
---Example 1:
---```lua
---Get the players rotation.
---
---local rotation = ObjectRawRotation('player')
---```
---Example 2:
---```lua
-----Do something with the rotations of all objects.
---
---for i, object in ipairs(Objects()) do
---    local rotation = ObjectRawRotation(object)
---    -- do something with rotation
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean rotation
function Tinkr.ObjectRawRotation(objectReference) end

---Returns the rotation of a WowGameObject in radians.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectRotation/)<br>
---Example 1:
---```lua
---Get the players rotation.
---
---local rotation = ObjectRotation('player')
---```
---Example 2:
---```lua
-----Do something with the rotations of all objects.
---
---for i, object in ipairs(Objects()) do
---    local rotation = ObjectRotation(object)
---    -- do something with rotation
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean rotation
function Tinkr.ObjectRotation(objectReference) end

---Returns if a WowGameObject is skinned or not.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectSkinnable/)<br>
---Example:
---```lua
---local skinnable = ObjectSkinnable('target')
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.ObjectSkinnable(objectReference) end

---Returns the skinning type of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectSkinningType/)<br>
---Example:
---```lua
-----enum SkinType : int {
-----  HERBALISM = 0x100,
-----  MINING = 0x200,
-----  ENGINEERING = 0x8000
-----};
---
---local skintype = ObjectSkinningType('target')
---if skintype == HERBALISM then
---    print("OMG A HERB")
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectSkinningType(objectReference) end

---Returns the spec ID of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectSpecializationID/)<br>
---Example:
---```lua
----- look IDs at documentation page
---local spec = ObjectSpecializationID('target')
---if spec == Specs.BrewMaster then
---    print("OMG A TANK")
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectSpecializationID(objectReference) end

---Returns the type of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectType/)<br>
---Example 1:
---```lua
-----Get the players current position.
---
---local name = ObjectType('player')
---```
---Example 2:
---```lua
-----Do something with the names of all objects.
---
---for i, object in ipairs(Objects()) do
---    local name = ObjectType(object)
---    -- do something with name
---end
---```
---
---Object Types:
---```lua
---Object = 0,
---Item = 1,
---Container = 2,
---AzeriteEmpoweredItem = 3,
---AzeriteItem = 4,
---Unit = 5,
---Player = 6,
---ActivePlayer = 7,
---GameObject = 8,
---DynamicObject = 9,
---Corpse = 10,
---AreaTrigger = 11,
---SceneObject = 12,
---ConversationData = 13
---```
---@param objectReference Tinkr.ObjectReference
---@return number|boolean
function Tinkr.ObjectType(objectReference) end

---Returns the world position of a WowGameObject. This is the position with any transport object accounted for.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/ObjectWorldPosition%20copy/)<br>
---Example 1:
---```lua
-----Get the players current position.
---
---local x, y, z = ObjectWorldPosition('player')
---```
---Example 2:
---```lua
-----Do something with the position of all objects.
---
---for i, object in ipairs(Objects()) do
---    local x, y, z = ObjectWorldPosition(object)
---    -- do something with x, y, z
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return number x, number y, number z
function Tinkr.ObjectWorldPosition(objectReference) end

---Gets a list of all objects.<br>
---Note: All WowGameObject references are ephemeral, and should never be stored for use later.
---Use the object inside the context of the iteration or directly after obtaining it. There is no
---guarantee on an objects lifetime and they will be garbage collected as soon as possible.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/Objects/)<br>
---Example:
---```lua
-----Iterate through all WowGameObject's.
---
---local objects = Objects()
---
---for i, object in ipairs(objects) do
---    -- handle object
---end
---```
---@param filterTypeID Tinkr.WowObjectType
---@return Tinkr.WowGameObject[]
function Tinkr.Objects(filterTypeID) end

---Returns the duel team of a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/UnitDuelTeam/)<br>
---Example:
---```lua
-----If two units are on the same team don't continue your rotation on them.
---
---local pdt = UnitDuelTeam('player')
---local tdt = UnitDuelTeam('target')
---if pdt == tdt then return end
---```
---@param objectReference Tinkr.ObjectReference
---@return any
function Tinkr.UnitDuelTeam(objectReference) end

---Check if a WowGameObject is mounted.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/UnitIsMounted/)<br>
---Example:
---```lua
---local ismounted = UnitIsMounted('target')
---if ismounted then
---    print("Dismount that alliance scum")
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.UnitIsMounted(objectReference) end

---Check if a WowGameObject is sitting.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/UnitIsSitting/)<br>
---Example:
---```lua
---local issitting = UnitIsSitting('target')
---if issitting then
---    print("Stand up you lazy bum!")
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.UnitIsSitting(objectReference) end

---Return item levels for a WowGameObject.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/UnitItemLevels/)<br>
---Example:
---```lua
---local equipped, current, avg, max = UnitItemLevels('player')
---```
---@param objectReference Tinkr.ObjectReference
---@return number equipped, number current, number avg, number max
function Tinkr.UnitItemLevels(objectReference) end

---Returns a WowGameObject representing the current loot target of an object.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/UnitLootTarget/)<br>
---Example:
---```lua
---local target = ObjectLootTarget('player')
---```
---@param objectReference Tinkr.ObjectReference
---@return Tinkr.WowGameObject|boolean
function Tinkr.UnitItemLevels(objectReference) end

---Returns a WowGameObject shapeshift ID.<br>
---[Documentation](https://docs.tinkr.site/Lua/Objects/UnitShapeShiftID/)<br>
---Example:
---```lua
---local isshifted = UnitShapeShiftID('target')
---if isshifted then
---    print("Druids and warriors are not cool!")
---end
---```
---@param objectReference Tinkr.ObjectReference
---@return boolean
function Tinkr.UnitShapeShiftID(objectReference) end

---Bring a window to the foreground<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/BringWindowToForeground/)<br>
---Example:
---```lua
---if UnitIsDeadOrGhost('player') then BringWindowToForeground() end
---```
function Tinkr.BringWindowToForeground() end

---Crash a client<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/Crash/)<br>
---Example:
---```lua
---Crash()
---```
function Tinkr.Crash() end

---Runs lua code in a unprotected environment.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/Eval/)<br>
---Example:
---```lua
---Eval("JumpOrAscendStart()", "example.lua")<br>
---```
---@param code string
---@param file string This file name is used in the Lua error dialog should something go wrong.
function Tinkr.Eval(code, file) end

---Calculates the distance in C land quicker than it can be done in Lua.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/FastDistance/)<br>
---Example:
---```lua
-----Checks the distance between the player and target.
---
---local x1, y1, z1 = ObjectPosition('player')
---local x2, y2, z2 = ObjectPosition('target')
---local dist = FastDistance(x1, y1, z1, x2, y2, z2)
---```
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@return number
function Tinkr.FastDistance(x1, y1, z1, x2, y2, z2) end

---Calculates the 2D distance in C land quicker than it can be done in Lua.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/FastDistance2D/)<br>
---Example:
---```lua
---local x1, y1, z1 = ObjectPosition('player')
---local x2, y2, z2 = ObjectPosition('target')
---local dist = FastDistance2D(x1, y1, x2, y2)
---```
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function Tinkr.FastDistance2D(x1, y1, x2, y2) end

---Returns the architecture of a tinkr build<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/GetArchitecture/)<br>
---Example:
---```lua
---local build = GetArchitecture()
---if build == 'arm64' then return end
---```
---@return string architecture arm64/x86_64
function Tinkr.GetArchitecture() end

---Gets information about an auction (this is classic only).<br>
---Returns current auction info for the given type and page index<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/GetAuctionInfo/)<br>
---@param type string|"list"|"bidder"|"owner"
---@param index number
---@return number itemID, number expiresAt, number expiresAtString, string currentBid, number currentBidString, string, number buyout, string buyoutString, string creator
function Tinkr.GetAuctionInfo(type, index) end

---Gets the last time a game tick happened.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/GetGameTick/)<br>
---Example:
---```lua
---local time = GetGameTick()
---```
---@return number time
function Tinkr.GetGameTick() end

---Gets the last time a game tick happened.<br>
---See https://github.com/phracker/MacOSX-SDKs/blob/master/MacOSX10.6.sdk/System/Library/Frameworks/Carbon.framework/Versions/A/Frameworks/HIToolbox.framework/Versions/A/Headers/Events.h#L198 <br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/GetKeyState/)<br>
---Example:
---```lua
---local keybindings = {}
---
---function OnKeysDown(keys)
---    for k, v in pairs(keys) do
---        if not GetKeyState(v) then
---            return false
---        end
---    end
---    return true
---end
---
---function RegisterKeyBinding(keys, callback)
---    table.insert(keybindings, { keys = keys, callback = callback })
---end
---
---C_Timer.NewTicker(0.001, function()
---    for k, v in pairs(keybindings) do
---        if OnKeysDown(v.keys) then
---            if not v.fired then
---                v.fired = true
---                v.callback(true)
---            end
---        else
---            v.fired = nil
---        end
---    end
---end)
---
---RegisterKeyBinding({ 0x38, 0x00 }, function()
---    print("Shift+a executed")
---end)
---
---```
---@param CGKeyCode any
---@return boolean
function Tinkr.GetKeyState(CGKeyCode) end

---GetLastHardwareActionTime returns the last time your game client received a hardware interaction<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/GetLastHardwareActionTime/)<br>
---Example:
---```lua
---SetLastHardwareActionTime(GetLastHardwareActionTime() + 100)
---```
---@return number
function Tinkr.GetLastHardwareActionTime() end

---Check if a window is in the foreground<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/GetWindowStatus/)<br>
---Example:
---```lua
----- Don't run rotation in the background
---
---if not GetWindowStatus() then return end
---```
---@return boolean
function Tinkr.GetWindowStatus() end

---Check if a the player is in the game world<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/IsInGame/)<br>
---Example:
---```lua
---if not IsInGame() then return end
---```
---@return boolean
function Tinkr.IsInGame() end

---[Documentation](https://docs.tinkr.site/Lua/Utility/JSON-BSON/)<br>
---@param string string json string
---@return any
function Tinkr.JsonDecode(string) end

---[Documentation](https://docs.tinkr.site/Lua/Utility/JSON-BSON/)<br>
---Example:
---```lua
---local object = { foo: "bar", baz: 123 }
---local json = JsonEncode(object)
---local bson = BsonEncode(object)
---```
---@param table any variable to encode
---@return string
function Tinkr.JsonEncode(table) end

---[Documentation](https://docs.tinkr.site/Lua/Utility/JSON-BSON/)<br>
---@param data any
---@return any
function Tinkr.BsonDecode(data) end

---[Documentation](https://docs.tinkr.site/Lua/Utility/JSON-BSON/)<br>
---Example:
---```lua
---local object = { foo: "bar", baz: 123 }
---local json = JsonEncode(object)
---local bson = BsonEncode(object)
---```
---@param table any variable to encode
---@return any
function Tinkr.BsonEncode(table) end

---Kill a client<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/Kill/)<br>
---Example:
---```lua
---Kill()
---```
function Tinkr.Kill() end

---Log output to the console<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/Log/)<br>
---Example:
---```lua
-----Print the player name to console.
---
---Log(ObjectName('player'))
---```
---@param str string
function Tinkr.Log(str) end

---Rotate a vector (x,y,z) and apply a distance calculation to it. <br>
---For instance getting the vector 10 yards infront of the players facing direction.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/RotateVector/)<br>
---Example:
---```lua
-----Get the Vector 10 yards infront of the direction of the player.
---
---local px, py, pz = ObjectPosition('player')
---local theta = ObjectRotation('player')
---local height = ObjectHeight('player')
---
---local X, Y, Z = RotateVector(px, py, pz, theta, 10);
---```
---@param x number
---@param y number
---@param z number
---@param theta number
---@param distance number
function Tinkr.RotateVector(x, y, z, theta, distance) end

---Returns the world position of a screen coordinate.<br>
---The x and y paramaters should be between -1 and 1, (0,0) being the center of the screen, (-1,1) being the bottom left.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/ScreenToWorld/)<br>
---Example:
---```lua
---Sets the mouseover unit to the target.
---
---local sx, sy = 0, 0
---local hitFlags = bit.bor(0x1, 0x10, 0x100, 0x100000)
---local x, y, z = ScreenToWorld(sx, sy, hitFlags)
---```
---Hit Flags:
---```lua
---M2Collision = 0x1
---M2Render = 0x2
---WMOCollision = 0x10
---WMORender = 0x20
---Terrain = 0x100
---WaterWalkableLiquid = 0x10000
---Liquid = 0x20000
---EntityCollision = 0x100000
---Unknown = 0x200000
---```
---@param x number
---@param y number
---@param hitFlags number
function Tinkr.ScreenToWorld(x, y, hitFlags) end

---Force a frame to not be forbidden, allowing lua interactiosn on it<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/SetForbiddenFrame/)<br>
---Example:
---```lua
-----Allow lua click on a frame like the mailbox to send gold
---
---if SecureTransferDialog.Button1 and SecureTransferDialog.Button1:IsShown() and SecureTransferDialog.Button1:IsVisible() then
---    SetForbiddenFrame(SecureTransferDialog.Button1, false)
---    SetForbiddenFrame(SecureTransferButton.Button1[0], false)
---
---    Eval("SecureTransferButton.Button1:Click()", "eval")
---end
---```
---@param frame any
---@return boolean
function Tinkr.SetForbiddenFrame(frame) end

---SetLastHardwareActionTime updates the last input interaction time in the game client, mainly used to prevent AFK behaviors<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/SetLastHardwareActionTime/)<br>
---Example:
---```lua
---SetLastHardwareActionTime(GetGameTick())
---```
---@param value number
function Tinkr.SetLastHardwareActionTime(value) end

---Returns the position of the camera.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/TraceLine/)<br>
---Example:
---```lua
-----Checks the line of sight between the player and target.
---
---local x1, y1, z1 = ObjectPosition('player')
---local x2, y2, z2 = ObjectPosition('target')
---local hitFlags = bit.bor(0x1, 0x10, 0x100, 0x100000)
---local x, y, z = TraceLine(x1, y1, z1, x2, y2, z2, hitFlags)
---```
---Hit Flags:
---```lua
---M2Collision = 0x1
---M2Render = 0x2
---WMOCollision = 0x10
---WMORender = 0x20
---Terrain = 0x100
---WaterWalkableLiquid = 0x10000
---Liquid = 0x20000
---EntityCollision = 0x100000
---Unknown = 0x200000
---```
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param hitFlags number
---@return number x, number y, number z
function Tinkr.TraceLine(x1, y1, z1, x2, y2, z2, hitFlags) end

---Returns the screen position of a world coordinate.<br>
---The x and y values are values between -1 and 1, (0,0) being the center of the screen, (-1,1) being the bottom left.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/WorldToScreen/)<br>
---Example:
---```lua
-----Sets the mouseover unit to the target.
---
---local x, y = WorldToScreen(x, y, z)
---```
---@param x number
---@param y number
---@param z number
---@return number x, number y
function Tinkr.WorldToScreen(x, y, z) end

---Check if tinkr would have injected lua into the client (Sanity check mainly, if it would return false it wouldn't exist (probably))<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/WouldInject/)<br>
---Example:
---```lua
-----Don't run rotation if we can't inject
---
---if not WouldInject() then return end
---```
---@return boolean
function Tinkr.WouldInject() end

---Do Zlib compression in C land.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/Zlib/)<br>
---Example:
---```lua
-----Compress a string using the highest compression level.
---
---local input = ('This will be my long string.'):rep(10000)
---local compressed = Defalte(input, 9)
---local decompressed = Inflate(compressed)
---print(decompressed == input and "Success!" or "Failure!")
---```
---@param string string
---@param level number
---@return any data
function Tinkr.Defalte(string, level) end

---Do Zlib decompression in C land.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/Zlib/)<br>
---Example:
---```lua
-----Compress a string using the highest compression level.
---
---local input = ('This will be my long string.'):rep(10000)
---local compressed = Defalte(input, 9)
---local decompressed = Inflate(compressed)
---print(decompressed == input and "Success!" or "Failure!")
---```
---@param data any
---@return string
function Tinkr.Inflate(data) end

---loadstring but without lua taint.<br>
---[Documentation](https://docs.tinkr.site/Lua/Utility/loadstringsecure/)<br>
---Example:
---```lua
-----JumpOrAscendStart unlocked
---
---local lua = loadstringsecure("JumpOrAscendStart()")
---lua() -- Execute the string loaded into the function
---```
---@param code string
---@return function
function Tinkr.loadstringsecure(code) end

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

---@class Tinkr.Util.Commands
Tinkr.Util.Commands = {}

---[Documentation](https://docs.tinkr.site/Modules/Util/Commands/)<br>
---@param prefix string
---@return Tinkr.Util.Commands
function Tinkr.Util.Commands:New(prefix) end

---[Documentation](https://docs.tinkr.site/Modules/Util/Commands/)<br>
---@param command string|string[]
---@param handler function
---@param help string
---@param arguments string[]
function Tinkr.Util.Commands:Register(command, handler, help, arguments) end

---@class Tinkr.Common
Tinkr.Common = {}

---@class Tinkr.Common.HitFlags
Tinkr.Common.HitFlags = {
    M2Render = 0x2,
    WMOCollision = 0x10,
    WMORender = 0x20,
    Terrain = 0x100,
    WaterWalkableLiquid = 0x10000,
    Liquid = 0x20000,
    EntityCollision = 0x100000,
    Unknown = 0x200000,
    WaterOrLiquid = 1, -- todo: set proper value
    All = 1,           -- todo: set proper value
    Most = 1,          -- todo: set proper value
}

---@param number number
---@param decimals number
---@return number
function Tinkr.Common.Round(number, decimals) end

---@param x number
---@param y number
---@param flags number
---@return number x, number y, number z
function Tinkr.Common.ScreenToWorld(x, y, flags) end

---@param length number
---@return string
function Tinkr.Common.RandomVariable(length) end