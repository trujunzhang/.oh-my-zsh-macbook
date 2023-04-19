const fs = require('fs')

const { readdirSync } = require('fs');


const getFileList = (dirName) => {
    let dict = {};
    const items = readdirSync(dirName, { withFileTypes: true });

    for (const item of items) {
        if (item.isDirectory()) {
            const path = `${dirName}/${item.name}`
            const subProperties = getFileList(path);
            const split = path.replace('assets/', '').split('/')
            // console.log('path:', path)
            // console.log('length:', length)
            dict[item.name] = {
                level: split,
                folder: true,
                value: subProperties
            }
        } else {
            dict[item.name.replace('.png', '').replace('.jpg', '').replaceAll('-', '_')] = {
                folder: false,
                value: `${dirName}/${item.name}`.replace('assets/', '')
            };
        }
    }

    let properties = Object.keys(dict)
        .map((key) => {
            const object = dict[key]
            if (object.folder === true) {
                const level = object.level
                const margin = level.map((item) => { return "    " })
                return `${key}: {
${margin}${object.value}
${margin}}`
            }
            return `${key}: require('@app-assets/${object.value}')`
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
