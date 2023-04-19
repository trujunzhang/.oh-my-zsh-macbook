const fs = require('fs')

const { readdirSync } = require('fs');

const dictionary = {}
const getFileList = (dirName, root) => {
    let files = [];
    const items = readdirSync(dirName, { withFileTypes: true });

    for (const item of items) {
        if (item.isDirectory()) {
            subFiles = getFileList(`${dirName}/${item.name}`, false);
            dictionary[item.name] = subFiles
        } else {
            files.push(`${dirName}/${item.name}`);
        }
    }

    return files;
};

const rootFiles = getFileList('assets', true);
dictionary['assets'] = subFiles

// console.log(rootFiles);
console.log(rootFiles);


const imageFileNames = () => {
    const array = fs
        .readdirSync('assets')
        .filter((file) => {
            return file.endsWith('.png') || file.endsWith('.jpg')
        })
        .map((file) => {
            return file.replace('@2x.png', '').replace('@3x.png', '')
        })

    return Array.from(new Set(array))
}

const generate = () => {
    let properties = imageFileNames()
        .map((name) => {
            return `${name}: require('./images/${name}.png')`
        })
        .join(',\n  ')

    const string = `export const Images = {
  ${properties}
}

`

    fs.writeFileSync('plugins/app-config/images.ts', string, 'utf8')
}

generate()
