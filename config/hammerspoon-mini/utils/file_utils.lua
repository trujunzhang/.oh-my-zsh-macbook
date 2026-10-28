function DoesGameTagFileExist(app_name, game_foler_name, runApp, existFunc, notExistFunc)
    local filePath = TAGGameFolder .. FixGameAppName(app_name)
    if hs.fs.attributes(filePath) then
        OpenGameStatus = "open"
        existFunc(app_name, runApp)
    else
        OpenGameStatus = "verify"
        notExistFunc(app_name, game_foler_name, runApp)
    end
end

function DoesFileExist(path)
    return hs.fs.attributes(path)
end

function DoesDirectoryExist(path)
    local attr = hs.fs.attributes(path)
    return attr and attr.mode == "directory"
end

function Get_Parent_Path(strPath)
    -- Matches everything before the last slash (works for / and \)
    return strPath:match("^(.*)[/\\][^/\\]*$")
end

function Get_Parent_Name(strPath)
    return strPath:match("^.+/(.-)/[^/]+$")
end

function Get_File_Name_From_Path(strPath)
    return strPath:match("^.+/(.+)$")
end

function GetFilesWithExtension(path, ext, isExtension, withQuote)
    local allFiles = hs.fs.fileListForPath(path, { subdirs = true, ignore = {} })

    local foundFiles = {}

    for _, filepath in ipairs(allFiles) do
        if isExtension == true then
            if filepath:match("%." .. ext .. "$") then
                table.insert(foundFiles, filepath)
            end
        end
        if isExtension == false then
            if filepath:match(ext) then
                if withQuote == true then
                    table.insert(foundFiles, "'" .. filepath .. "'")
                else
                    table.insert(foundFiles, filepath)
                end
            end
        end
    end
    return foundFiles
end

function ListSubfolders(path, name, customFunc)
    local folders = {}
    -- Clean up path by removing trailing slash if present
    path = path:gsub("/$", "")

    if not DoesDirectoryExist(path) then
        return folders
    end

    -- Iterate through the directory
    for file in hs.fs.dir(path) do
        if file ~= "." and file ~= ".." then
            local fullPath = path .. "/" .. file
            local attrs = hs.fs.attributes(fullPath)

            -- Check if the item is a directory
            if attrs and attrs.mode == "directory" then
                table.insert(folders, file)

                if customFunc ~= nil then
                    customFunc(file, name)
                end
            end
        end
    end
    return folders
end

function ModifyGamePlistConfig(path, key, value)
    -- local path = os.getenv("HOME") .. "/Library/Preferences/com.example.app.plist"

    -- 1. Read the plist file into a Lua table
    local data = hs.plist.read(path)

    if data then
        -- 2. Modify the values in the Lua table
        -- data["SomeKey"] = "NewValue"
        data[key] = value

        -- 3. Write the table back to the plist file (set true for binary, false for XML/text)
        local success = hs.plist.write(path, data, false)
        if success then
            hs.printf("Plist updated successfully! %s = %s", key, value)
            -- print("Plist updated successfully!")
        else
            hs.printf("Failed to write plist. %s = %s", key, value)
            -- print("Failed to write plist.")
        end
    end
end
