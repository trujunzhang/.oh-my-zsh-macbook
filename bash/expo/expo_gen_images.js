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
            const subProperties = getFileList(`${dirName}/${item.name}`);
            if (subProperties.trim() !== '') { // not empty string
                dict[item.name] = {
                    level: split.length,
                    folder: true,
                    value: subProperties
                }
            }
        } else {
            if (item.name.includes('.png') || item.name.includes('.jpg')) {
                dict[item.name.replace('.png', '').replace('.jpg', '').replaceAll('-', '_')] = {
                    level: split.length,
                    folder: false,
                    value: `${dirName}/${item.name}`.replace('assets/', '')
                };
            }
        }
    }

    let properties = Object.keys(dict)
        .map((key) => {
            const object = dict[key]
            const rootMargins = [
                "",
                "  ",
                "    ",
            ]
            const margins = [
                "",
                "  ",
                "    ",
            ]

            if (object.folder === true) {
                return `${rootMargins[object.level]}${key.toUpperCase()}: {
${'  '}${object.value}
${'  '}${rootMargins[object.level]}}`
            }
            return `${margins[object.level]}${key.toUpperCase()}: require('@app-assets/${object.value}')`
        })
        .join(',\n  ')

    // console.log('properties', properties)

    return properties;
};

const rootProperties = getFileList('assets');

// console.log(rootProperties);

const generate = () => {

    const string = `export const images = {
  ${rootProperties}
}
`

    fs.writeFileSync('plugins/app-config/res/images.ts', string, 'utf8')
}

generate()
