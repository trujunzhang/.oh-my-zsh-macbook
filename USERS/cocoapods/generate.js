const fs = require('fs')

let cocoapodsResposity = "/Users/djzhang/Documents/Organizations/IDES/cocoapods/.cocoapods/repos/master/Specs/"
let jsonFile = 'generate.json'
// let folderNumbers = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']
let folderNumbers = ['0']

function getDirectories(path) {
    return fs.readdirSync(path).filter((file) => {
        return fs.statSync(path + '/' + file).isDirectory();
    });
}

var items = []


for (var i = 0; i < folderNumbers.length; i++) {
    for (var j = 0; j < folderNumbers.length; j++) {
        for (var k = 0; k < folderNumbers.length; k++) {
            let folder = cocoapodsResposity + folderNumbers[i] + "/" + folderNumbers[j] + "/" + folderNumbers[k]
            // console.log("folder : ", folder)
            let children = getDirectories(folder)
            // console.log("children: ", children)
            for (var x = 0; x < children.length; x++) {
                var child = children[x]
                let item = {
                    'name': child,
                    'path': i + "/" + j + "/" + k + "/" + child
                }
                // console.log("item: ", JSON.stringify(item))
                items.push(item)
            }
        }
    }
}

try {
    let generateJsonPath = __dirname + '/generate.json'
    console.log("generateJsonPath : ", generateJsonPath)
    const content = JSON.stringify(items, null, 4)
    fs.writeFileSync(generateJsonPath, content);
} catch (e) {
    console.log("Error: offline file, ", pkgFile)
    // throw e
}