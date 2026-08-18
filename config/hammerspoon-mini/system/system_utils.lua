local function getFilesWithExtension(path, ext)
    local allFiles = hs.fs.fileListForPath(path, { subdirs = true, ignore = {} })

    local foundFile = nil

    for _, filepath in ipairs(allFiles) do
        if filepath:match("%." .. ext .. "$") then
            foundFile = filepath
        end
    end
    return foundFile
end

local function generateArrayWithAllFiles(mediaExt, array, mediaFilePath)
    local parentName = Get_Parent_Name(mediaFilePath)
    local parentPath = Get_Parent_Path(mediaFilePath)

    local srtFile = getFilesWithExtension(parentPath, "srt")

    hs.printf("Found %s file: %s", mediaExt, mediaFilePath)
    hs.printf("Found %s srt file: %s", mediaExt, srtFile)
    hs.printf("Found %s parent file: %s", mediaExt, parentName)

    local dict = {}
    dict["text"] = parentName
    dict["mediaFile"] = mediaFilePath
    dict["mediaSrt"] = srtFile

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
