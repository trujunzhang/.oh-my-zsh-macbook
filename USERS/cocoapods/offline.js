const fs = require('fs')
const { lstatSync, readdirSync } = require('fs')
const { join } = require('path')

let cocoapodsResposity = "/Users/djzhang/Documents/Organizations/IDES/cocoapods/.cocoapods/repos/master/Specs/"
let jsonFile = 'config/offline.json'

function getDirectories(path) {
    return fs.readdirSync(path).filter((file) => {
        return fs.statSync(path + '/' + file).isDirectory();
    });
}

function replaceToOffline(line) {
    let localPath = cocoapodsResposity + line['path']
    // console.log('localPath: '+ localPath )

    var folders = getDirectories(localPath)
    for (var i = 0; i < folders.length; i++) {
        var destPath = localPath + "/" + folders[i]
        console.log('destPath: ' + destPath)
    }
}

function replaceEachLine(localPath, line) {

}

try {
    var obj = JSON.parse(fs.readFileSync(jsonFile, 'utf8'));
    var line = obj[2]

    replaceToOffline(line)
    // console.log('djzhang, ' + line )
} catch (e) {
    console.log("Error: restore build.current:", jsonFile)
    // throw e
}