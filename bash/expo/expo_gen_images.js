const fs = require('fs')

const { readdirSync } = require('fs');

const getFileList = (dirName) => {
    let files = [];
    const items = readdirSync(dirName, { withFileTypes: true });

    for (const item of items) {
        if (item.isDirectory()) {
            files = [...files, ...getFileList(`${dirName}/${item.name}`)];
        } else {
            files.push(`${dirName}/${item.name}`);
        }
    }

    return files;
};

const files = getFileList('assets');

console.log(files);


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
