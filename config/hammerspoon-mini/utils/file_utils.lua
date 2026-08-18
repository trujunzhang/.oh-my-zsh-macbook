function Get_Parent_Path(strPath)
    -- Matches everything before the last slash (works for / and \)
    return strPath:match("^(.*)[/\\][^/\\]*$")
end

function Get_Parent_Name(strPath)
    return strPath:match("^.+/(.-)/[^/]+$")
end
