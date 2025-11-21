function CheckContainSubString(str, subStr)
    str = str:gsub("-", "")
    str = str:gsub("_", "")
    str = str:gsub("'", "")
    subStr = subStr:gsub("-", "")
    subStr = subStr:gsub("_", "")
    subStr = subStr:gsub("'", "")

    return string.find(str, subStr)
end
