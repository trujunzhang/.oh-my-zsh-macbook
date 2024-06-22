const fs = require("fs");

let cocoapodsResposity = process.env.HOME + "/.cocoapods/repos/master/Specs/";
let trunkResposity = process.env.HOME + "/.cocoapods/repos/trunk/Specs/";
let offlineGitFolder =
  "file://" + process.env.HOME + "/Documents/Organizations/__CACHES/github/";
let offlineHttpFolder = "http://localhost:8000/@http/";
let jsonFile = "config/offline.json";

function getDirectories(path) {
  return fs.readdirSync(path).filter((file) => {
    return fs.statSync(path + "/" + file).isDirectory();
  });
}

function jsonToLowerString(str) {
  if (str === null || str === undefined) {
    return str;
  }
  return str.toLowerCase();
}

// ========================================================
function replaceToOffline(obj, line) {
  const lineGit = jsonToLowerString(line["git"]);
  const lastGit = jsonToLowerString(obj["source"]["git"]);
  const lastHttp = jsonToLowerString(obj["source"]["http"]);
  console.log("replaceToOffline<lineGit>: " + line["git"]);
  console.log("replaceToOffline<lastGit>: " + lastGit);

  if (line["type"] == "git" && lastGit === lineGit) {
    obj["source"]["git"] = offlineGitFolder + line["folder"];
    console.log("replace to: git=" + lastGit);
  } else if (line["type"] == "http" && lastHttp === line["http"]) {
    obj["source"]["http"] = offlineHttpFolder + line["file"];
    console.log("replace to: http=" + lastHttp);
  } else {
    console.log("replaceToOffline: not match: " + line["type"]);
    //console.log('replace to: lastGit=' + lastGit)
  }
  return obj;
}
// ========================================================

function offlineJsonFile(destFile, line) {
  try {
    // First of all, read the json file.
    var obj = JSON.parse(fs.readFileSync(destFile, "utf8"));
    const offlineObj = replaceToOffline(obj, line);
    const content = JSON.stringify(offlineObj, null, 4);

    //console.log('content: ' + content)
    fs.writeFileSync(destFile, content);
  } catch (e) {
    console.log("Error: offline file, ", destFile);
    // throw e
  }
}

function replaceJsonFile(line, localPath) {
  var folders = getDirectories(localPath);
  for (var i = 0; i < folders.length; i++) {
    var destPath = localPath + "/" + folders[i] + "/" + line["filename"];
    console.log("destPath: " + destPath);
    offlineJsonFile(destPath, line);
  }
}

function replaceEachFiles(line, spacesPath) {
  if (
    line["type"] !== "git" &&
    line["type"] !== "zip" &&
    line["type"] !== "http"
  ) {
    return;
  }
  let localPath = spacesPath + line["path"];
  // console.log('localPath: '+ localPath )

  fs.stat(localPath, function (err, stats) {
    //Check if error defined and the error code is "not exists"
    // if (err && err.errno === 34) {
    if (err) {
      console.log("read file error: " + err);
    } else {
      //just in case there was a different error:
      replaceJsonFile(line, localPath);
    }
  });
}

var i = 0;
try {
  var obj = JSON.parse(fs.readFileSync(jsonFile, "utf8"));
  var length = obj.length;
  for (i; i < length; i++) {
    // var line = obj[1]
    var line = obj[i];
    var enable = line["enable"];
    if (enable !== "true") {
      continue;
    }
    // console.log('djzhang, ' + line['filename'] )
    replaceEachFiles(line, cocoapodsResposity);
    replaceEachFiles(line, trunkResposity);
  }
} catch (e) {
  //console.log("Error: restore build.current:", jsonFile)
  console.log("Error: restore build.current: index= ", i);
  throw e;
}
