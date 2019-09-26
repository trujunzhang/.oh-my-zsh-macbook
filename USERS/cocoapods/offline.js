const fs = require('fs')

let cocoapodsResposity = "/Users/djzhang/Documents/Organizations/IDES/cocoapods/.cocoapods/repos/master/Specs/"
let offlineFolder = 'file:///Users/djzhang/Documents/Organizations/__CACHES/github/'
let jsonFile = 'config/offline.json'

function getDirectories(path) {
    return fs.readdirSync(path).filter((file) => {
        return fs.statSync(path + '/' + file).isDirectory();
    });
}

function replaceToOffline(obj, line) {
    const last = obj['source']['git']
    // console.log('last: ' + last)
    if (last === line['git']) {
        obj['source']['git'] = offlineFolder + line['folder']
    }
    return obj;
}

function offlineJsonFile(destFile, line) {

    try {
        var obj = JSON.parse(fs.readFileSync(destFile, 'utf8'))
        const offlineObj = replaceToOffline(obj, line)
        const content = JSON.stringify(offlineObj, null, 4)

        // console.log('content: ' + content)
        fs.writeFileSync(destFile, content);
    } catch (e) {
        console.log("Error: offline file, ", pkgFile)
        // throw e
    }
}

function replaceEachFiles(line) {
    let localPath = cocoapodsResposity + line['path']
    // console.log('localPath: '+ localPath )

    var folders = getDirectories(localPath)
    for (var i = 0; i < folders.length; i++) {
        var destPath = localPath + "/" + folders[i] + "/" + line['filename'] + ".podspec.json"
        offlineJsonFile(destPath, line)
        console.log('destPath: ' + destPath)
    }
}

try {
    var obj = JSON.parse(fs.readFileSync(jsonFile, 'utf8'));
    // var line = obj[2]
    var line = obj[obj.length - 1]

    replaceEachFiles(line)
    // console.log('djzhang, ' + line )
} catch (e) {
    console.log("Error: restore build.current:", jsonFile)
    // throw e
}