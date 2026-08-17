local function generateArrayWithAllFiles(mediaExt, array, mediaFilePath)
    local parentName = mediaFilePath:match("^.+/(.-)/[^/]+$")
    print("Found " .. mediaExt .. " file: " .. mediaFilePath)
    print("Found " .. mediaExt .. " parent folder: " .. parentName)
    local dict = {}
    dict["text"] = parentName
    dict["tag"] = mediaFilePath

    table.insert(array, dict)
end

function ListAllFilesInMediaFolder(mediaFoldPath)
    -- Get all non-hidden files
    -- local files = hs.fs.fileListForPath(mediaFoldPath)

    -- for _, filepath in ipairs(files) do
    --     print(filepath)
    -- end

    local myArray = {}

    -- Get all files including hidden dot-files and subdirectories
    local allFiles = hs.fs.fileListForPath(mediaFoldPath, { subdirs = true, ignore = {} })

    local targetMkvExt = "mkv" -- Do not include the dot here
    local targetMp4Ext = "mp4" -- Do not include the dot here

    for _, filepath in ipairs(allFiles) do
        -- Match the extension at the end of the path string
        if filepath:match("%." .. targetMkvExt .. "$") then
            generateArrayWithAllFiles(targetMkvExt, myArray, filepath)
        elseif filepath:match("%." .. targetMp4Ext .. "$") then
            generateArrayWithAllFiles(targetMp4Ext, myArray, filepath)
        end
    end

    return myArray
end
