const fs = require('fs')

let cocoapodsResposity = "/Users/djzhang/.cocoapods/repos/master/Specs/"
let trunkResposity = "/Users/djzhang/.cocoapods/repos/trunk/Specs/"
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
    console.log('replace to: git=' + last)
  }else {
    //console.log('replace to: last=' + last)
  }
  return obj;
}

function offlineJsonFile(destFile, line) {
  try {
    var obj = JSON.parse(fs.readFileSync(destFile, 'utf8'))
    const offlineObj = replaceToOffline(obj, line)
    const content = JSON.stringify(offlineObj, null, 4)

    //console.log('content: ' + content)
    fs.writeFileSync(destFile, content);
  } catch (e) {
    console.log("Error: offline file, ", destFile)
    // throw e
  }
}

function replaceJsonFile(line,localPath){
  var folders = getDirectories(localPath)
  for (var i = 0; i < folders.length; i++) {
    var destPath = localPath + "/" + folders[i] + "/" + line['filename']
    console.log('destPath: ' + destPath)
    offlineJsonFile(destPath, line)
  }
}

function replaceEachFiles(line,spacesPath) {
  if (line['type'] !== 'git' && line['type'] !== 'zip') {
    return
  }
  let localPath = spacesPath + line['path']
  // console.log('localPath: '+ localPath )

  fs.stat(localPath, function(err, stats) {
    //Check if error defined and the error code is "not exists"
    // if (err && err.errno === 34) {
    if (err) {
      console.log('read file error: '+ err)
    } else {
      //just in case there was a different error:
      replaceJsonFile(line,localPath)
    }
  })
}

var i = 0
try {
  var obj = JSON.parse(fs.readFileSync(jsonFile, 'utf8'));
  var length = obj.length
  for(i; i< length; i++){
    // var line = obj[1]
    var line = obj[i]
    // console.log('djzhang, ' + line['filename'] )
    replaceEachFiles(line,cocoapodsResposity)
    replaceEachFiles(line,trunkResposity)
  }
} catch (e) {
  //console.log("Error: restore build.current:", jsonFile)
  console.log("Error: restore build.current: index= ", i)
  throw e
}
