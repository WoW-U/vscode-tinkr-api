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