const fs = require('fs')

const { readdirSync } = require('fs');


const getFileList = (dirName) => {
    let dict = {};
    const items = readdirSync(dirName, { withFileTypes: true });

    const split = dirName.replace('assets/', '').replace('assets', '').split('/').filter(i => i)
    // console.log('dirName', dirName)
    // console.log('split', split.length)

    for (const item of items) {
        if (item.isDirectory()) {
            const path = `${dirName}/${item.name}`
            const subProperties = getFileList(path);
            dict[item.name] = {
                level: split,
                folder: true,
                value: subProperties
            }
        } else {
            dict[item.name.replace('.png', '').replace('.jpg', '').replaceAll('-', '_')] = {
                level: split,
                folder: false,
                value: `${dirName}/${item.name}`.replace('assets/', '')
            };
        }
    }

    let properties = Object.keys(dict)
        .map((key) => {
            const object = dict[key]
            const margin = object.level.map((item) => { return "    " }).join('')

            if (object.folder === true) {
                return `${key}: {
${object.value}
${margin}}`
            }
            return `${margin}${key}: require('@app-assets/${object.value}')`
        })
        .join(',\n  ')

    // console.log('properties', properties)

    return properties;
};

const rootProperties = getFileList('assets');

// console.log(rootProperties);

const generate = () => {

    const string = `export const Images = {
  ${rootProperties}
}

`

    fs.writeFileSync('plugins/app-config/images.ts', string, 'utf8')
}

generate()
