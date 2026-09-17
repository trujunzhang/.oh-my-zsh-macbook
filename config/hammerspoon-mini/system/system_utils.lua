local function generateArrayWithAllFiles(mediaExt, array, mediaFilePath)
    local parentName = Get_Parent_Name(mediaFilePath)
    local parentPath = Get_Parent_Path(mediaFilePath)

    local srtFiles = GetFilesWithExtension(parentPath, "srt", true, false)
    local srtFile = nil
    local length = #srtFiles
    if length ~= 0 then
        srtFile = srtFiles[1]
    end

    -- hs.printf("Found %s srt file length: %s", mediaExt, length)

    -- hs.printf("Found %s file: %s", mediaExt, mediaFilePath)
    -- hs.printf("Found %s srt file: %s", mediaExt, srtFile)
    -- hs.printf("Found %s parent file: %s", mediaExt, parentName)

    local textColor = GFileNotFoundColor
    if srtFile ~= nil then
        textColor = GFileExistedColor
    end

    local fancyText = hs.styledtext.new(parentName, {
        font = { name = "Futura", size = 16 },
        color = textColor,
    })

    local dict = {}
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

    -- hs.printf("")

    return myArray
end
