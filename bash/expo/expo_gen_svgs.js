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
};

getFileList('assets');

let importRows = Object.values(dict).join('\n')

let exportRows = Object.keys(dict)
    .map((key, index) => {
        if (index >= Object.keys(dict).length - 1) { // Last row
            return `${key} // ${key}`
        }
        return `${key}, // ${key}`
    })
    .join('\n  ')

const generate = () => {

    const string = `${importRows}

export const svgs = {
  ${exportRows}
}
`

    fs.writeFileSync('plugins/app-config/res/svgs.ts', string, 'utf8')
}

generate()
