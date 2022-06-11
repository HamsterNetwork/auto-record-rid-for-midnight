local time = system.time() + 5
local json = require("lib/json")
local files = require("lib/files")
local config = nil
function OnFrame()
    config = json.decode(files.load_file(fs.get_dir_product().."config/auto record rid/config.json"))
    if config["enable"] then
        if time < system.time() then
            local players = player.get_hosts_queue()
            for i=1,#players do
                ply = players[i]
                if fs.file_load_txt("RID.txt") == "" then
                    if string.find(fs.file_load_txt("RID.txt"),"Rid: "..player.get_rid(ply)) == nil then
                        fs.file_write("RID.txt", "主机RID: "..player.get_rid(player.get_session_host()).."\n主机名字: "..player.get_name(player.get_session_host()).."\nRid: "..player.get_rid(ply).."\n名字: "..player.get_name(ply))
                    end
                else
                    if string.find(fs.file_load_txt("RID.txt"),"Rid: "..player.get_rid(ply)) == nil then
                        fs.file_append("RID.txt", "\n----------------------------------------------\n主机RID: "..player.get_rid(player.get_session_host()).."\n主机名字: "..player.get_name(player.get_session_host()).."\nRid: "..player.get_rid(ply).."\n名字: "..player.get_name(ply))
                    end
                end
            end
            time = system.time() + 5
        end
    end
end