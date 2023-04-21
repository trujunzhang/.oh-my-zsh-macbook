const fs = require('fs')

const { readdirSync } = require('fs');

// import FIREFOX from '@app-assets/svgs/firefox.svg'
// export const svgs = { FIREFOX }

let dict = {};
const getFileList = (dirName) => {
    const items = readdirSync(dirName, { withFileTypes: true });

    for (const item of items) {
        if (item.isDirectory()) {
            getFileList(`${dirName}/${item.name}`);
        } else {
            if (item.name.includes('.svg')) {
                const key = item.name.replace('.svg', '').replaceAll('-', '_').toUpperCase()
                const path = `${dirName}/${item.name}`.replace('assets/', '')
                dict[key] = `import ${key} from '@app-assets/${path}'`
            }
        }
    }

    // let properties = Object.keys(dict)
    //     .map((key) => {
    //         const object = dict[key]
    //         return `${margins[object.level]}${key.toUpperCase()}: require('@app-assets/${object.value}')`
    //     })
    //     .join(',\n  ')

};

getFileList('assets');

let imports = Object.value(dict)
    .map((value) => {
        return value
    })
    .join('\n  ')

const generate = () => {

    const string = `
  ${imports}
`

    fs.writeFileSync('plugins/app-config/res/svgs.ts', string, 'utf8')
}

generate()
