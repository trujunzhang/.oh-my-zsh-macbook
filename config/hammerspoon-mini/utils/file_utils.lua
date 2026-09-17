function Get_Parent_Path(strPath)
    -- Matches everything before the last slash (works for / and \)
    return strPath:match("^(.*)[/\\][^/\\]*$")
end

function Get_Parent_Name(strPath)
    return strPath:match("^.+/(.-)/[^/]+$")
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
