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

    local myRed = { red = 1.0, green = 0.0, blue = 0.0, alpha = 0.5 }

    local textColor = { red = 0.0, green = 0.0, blue = 1.0, alpha = 0.5 }
    if srtFile ~= nil then
        textColor = myRed
    end

    local fancyText = hs.styledtext.new(parentName, {
        font = { name = "Futura", size = 14 },
        color = textColor,
    })

    dict["text"] = fancyText
    dict["mediaFile"] = mediaFilePath
    dict["mediaSrt"] = srtFile

    table.insert(array, dict)
end

function ListAllFilesInMediaFolder(mediaFoldPath)
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

    hs.printf("")

    return myArray
end
