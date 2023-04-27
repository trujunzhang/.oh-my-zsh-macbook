const fs = require('fs')

if (process.argv.length === 2) {
    console.error('Expected at least one argument!');
    process.exit(1);
}
const primary = (process.argv[2]);
const secondary = (process.argv[3]);

const primaryUpper = primary.toUpperCase()
const secondaryUpper = secondary.toUpperCase()

console.log('=========================================================')
console.log('primary font:', primary, ' secondary font:', secondary)
console.log('primaryUpper font:', primaryUpper, ' secondaryUpper font:', secondaryUpper)
console.log('=========================================================')

/**
|--------------------------------------------------
| fonts_const
|--------------------------------------------------
*/
const _generateFontsConsts = (fontType, fontUpper) => {

    return `/**
|--------------------------------------------------
| ${fontUpper}
|--------------------------------------------------
*/
/* {thin} */
export const ${fontType.toUpperCase()}_THIN = '${fontType}-thin'
export const ${fontType.toUpperCase()}_THIN_ITALIC = '${fontType}-thin_italic'
/* {light} */
export const ${fontType.toUpperCase()}_LIGHT = '${fontType}-light'
export const ${fontType.toUpperCase()}_LIGHT_ITALIC = '${fontType}-light-italic'
/* {extra-light} */
export const ${fontType.toUpperCase()}_EXTRALIGHT = '${fontType}-extralight'
export const ${fontType.toUpperCase()}_EXTRALIGHT_ITALIC = '${fontType}-extralight-italic'
/* {regular} */
export const ${fontType.toUpperCase()}_REGULAR = '${fontType}-regular'
export const ${fontType.toUpperCase()}_REGULAR_ITALIC = '${fontType}-regular-italic'
/* {medium} */
export const ${fontType.toUpperCase()}_MEDIUM = '${fontType}-medium'
export const ${fontType.toUpperCase()}_MEDIUM_ITALIC = '${fontType}-medium-italic'
/* {semi-bold} */
export const ${fontType.toUpperCase()}_SEMIBOLD = '${fontType}-semibold'
export const ${fontType.toUpperCase()}_SEMIBOLD_ITALIC = '${fontType}-semibold-italic'
/* {bold} */
export const ${fontType.toUpperCase()}_BOLD = '${fontType}-bold'
export const ${fontType.toUpperCase()}_BOLD_ITALIC = '${fontType}-bold-italic'
/* {extra-bold} */
export const ${fontType.toUpperCase()}_EXTRABOLD = '${fontType}-extrabold'
export const ${fontType.toUpperCase()}_EXTRABOLD_ITALIC = '${fontType}-extrabold-italic'
/* {black} */
export const ${fontType.toUpperCase()}_BLACK = '${fontType}-black'
export const ${fontType.toUpperCase()}_BLACK_ITALIC = '${fontType}-black-italic'
/**
|--------------------------------------------------
| FONT ${fontUpper}
|--------------------------------------------------
*/
/* {thin} */
export const FONT_${fontType.toUpperCase()}_THIN = 'font-${fontType}-thin'
export const FONT_${fontType.toUpperCase()}_THIN_ITALIC = 'font-${fontType}-thin_italic'
/* {light} */
export const FONT_${fontType.toUpperCase()}_LIGHT = 'font-${fontType}-light'
export const FONT_${fontType.toUpperCase()}_LIGHT_ITALIC = 'font-${fontType}-light-italic'
/* {extra-light} */
export const FONT_${fontType.toUpperCase()}_EXTRALIGHT = 'font-${fontType}-extralight'
export const FONT_${fontType.toUpperCase()}_EXTRALIGHT_ITALIC = 'font-${fontType}-extralight-italic'
/* {regular} */
export const FONT_${fontType.toUpperCase()}_REGULAR = 'font-${fontType}-regular'
export const FONT_${fontType.toUpperCase()}_REGULAR_ITALIC = 'font-${fontType}-regular-italic'
/* {medium} */
export const FONT_${fontType.toUpperCase()}_MEDIUM = 'font-${fontType}-medium'
export const FONT_${fontType.toUpperCase()}_MEDIUM_ITALIC = 'font-${fontType}-medium-italic'
/* {semi-bold} */
export const FONT_${fontType.toUpperCase()}_SEMIBOLD = 'font-${fontType}-semibold'
export const FONT_${fontType.toUpperCase()}_SEMIBOLD_ITALIC = 'font-${fontType}-semibold-italic'
/* {bold} */
export const FONT_${fontType.toUpperCase()}_BOLD = 'font-${fontType}-bold'
export const FONT_${fontType.toUpperCase()}_BOLD_ITALIC = 'font-${fontType}-bold-italic'
/* {extra-bold} */
export const FONT_${fontType.toUpperCase()}_EXTRABOLD = 'font-${fontType}-extrabold'
export const FONT_${fontType.toUpperCase()}_EXTRABOLD_ITALIC = 'font-${fontType}-extrabold-italic'
/* {black} */
export const FONT_${fontType.toUpperCase()}_BLACK = 'font-${fontType}-black'
export const FONT_${fontType.toUpperCase()}_BLACK_ITALIC = 'font-${fontType}-black-italic'
`
}

const _generateFontsConstExports = (fontName, fontUpperName) => {
    const rowMargin = "    "
    return `  ${fontUpperName}: {
${rowMargin}${fontName}Thin: '${fontName}-Thin',
${rowMargin}${fontName}ThinItalic: '${fontName}-Thin-Italic',
${rowMargin}${fontName}Light: '${fontName}-Light',
${rowMargin}${fontName}LightItalic: '${fontName}-Light-Italic',
${rowMargin}${fontName}ExtraLight: '${fontName}-ExtraLight',
${rowMargin}${fontName}ExtraLightItalic: '${fontName}-ExtraLight-Italic',
${rowMargin}${fontName}Regular: '${fontName}-Regular',
${rowMargin}${fontName}RegularItalic: '${fontName}-Regular-Italic',
${rowMargin}${fontName}Medium: '${fontName}-Medium',
${rowMargin}${fontName}MediumItalic: '${fontName}-Medium-Italic',
${rowMargin}${fontName}SemiBold: '${fontName}-SemiBold',
${rowMargin}${fontName}SemiBoldItalic: '${fontName}-SemiBold-Italic',
${rowMargin}${fontName}Bold: '${fontName}-Bold',
${rowMargin}${fontName}BoldItalic: '${fontName}-Bold-Italic',
${rowMargin}${fontName}ExtraBold: '${fontName}-ExtraBold',
${rowMargin}${fontName}ExtraBoldItalic: '${fontName}-ExtraBold-Italic',
${rowMargin}${fontName}Black: '${fontName}-Black',
${rowMargin}${fontName}BlackItalic: '${fontName}-BlackItalic'
  }`
}

/**
|--------------------------------------------------
| Index.ts
|--------------------------------------------------
*/
const _generateIndexImports = (fontType) => {
    const rowMargin = "  "
    return `${rowMargin}// ${fontType}
${rowMargin}${fontType.toUpperCase()}_THIN,
${rowMargin}${fontType.toUpperCase()}_THIN_ITALIC,
${rowMargin}${fontType.toUpperCase()}_LIGHT,
${rowMargin}${fontType.toUpperCase()}_LIGHT_ITALIC,
${rowMargin}${fontType.toUpperCase()}_EXTRALIGHT,
${rowMargin}${fontType.toUpperCase()}_EXTRALIGHT_ITALIC,
${rowMargin}${fontType.toUpperCase()}_REGULAR,
${rowMargin}${fontType.toUpperCase()}_REGULAR_ITALIC,
${rowMargin}${fontType.toUpperCase()}_MEDIUM,
${rowMargin}${fontType.toUpperCase()}_MEDIUM_ITALIC,
${rowMargin}${fontType.toUpperCase()}_SEMIBOLD,
${rowMargin}${fontType.toUpperCase()}_SEMIBOLD_ITALIC,
${rowMargin}${fontType.toUpperCase()}_BOLD,
${rowMargin}${fontType.toUpperCase()}_BOLD_ITALIC,
${rowMargin}${fontType.toUpperCase()}_EXTRABOLD,
${rowMargin}${fontType.toUpperCase()}_EXTRABOLD_ITALIC,
${rowMargin}${fontType.toUpperCase()}_BLACK,
${rowMargin}${fontType.toUpperCase()}_BLACK_ITALIC, `
}


const _generateIndexFontFamily = (fontType, fontName, fontUpperName) => {
    const rowMargin = "  "
    return `${rowMargin}// ${fontType}
${rowMargin}[${fontType.toUpperCase()}_THIN]: [Fonts.${fontUpperName}.${fontName}Thin],
${rowMargin}[${fontType.toUpperCase()}_THIN_ITALIC]: [Fonts.${fontUpperName}.${fontName}ThinItalic],
${rowMargin}[${fontType.toUpperCase()}_LIGHT]: [Fonts.${fontUpperName}.${fontName}Light],
${rowMargin}[${fontType.toUpperCase()}_LIGHT_ITALIC]: [Fonts.${fontUpperName}.${fontName}LightItalic],
${rowMargin}[${fontType.toUpperCase()}_EXTRALIGHT]: [Fonts.${fontUpperName}.${fontName}ExtraLight],
${rowMargin}[${fontType.toUpperCase()}_EXTRALIGHT_ITALIC]: [Fonts.${fontUpperName}.${fontName}ExtraLightItalic],
${rowMargin}[${fontType.toUpperCase()}_REGULAR]: [Fonts.${fontUpperName}.${fontName}Regular],
${rowMargin}[${fontType.toUpperCase()}_REGULAR_ITALIC]: [Fonts.${fontUpperName}.${fontName}RegularItalic],
${rowMargin}[${fontType.toUpperCase()}_MEDIUM]: [Fonts.${fontUpperName}.${fontName}Medium],
${rowMargin}[${fontType.toUpperCase()}_MEDIUM_ITALIC]: [Fonts.${fontUpperName}.${fontName}MediumItalic],
${rowMargin}[${fontType.toUpperCase()}_SEMIBOLD]: [Fonts.${fontUpperName}.${fontName}SemiBold],
${rowMargin}[${fontType.toUpperCase()}_SEMIBOLD_ITALIC]: [Fonts.${fontUpperName}.${fontName}SemiBoldItalic],
${rowMargin}[${fontType.toUpperCase()}_BOLD]: [Fonts.${fontUpperName}.${fontName}Bold],
${rowMargin}[${fontType.toUpperCase()}_BOLD_ITALIC]: [Fonts.${fontUpperName}.${fontName}BoldItalic],
${rowMargin}[${fontType.toUpperCase()}_EXTRABOLD]: [Fonts.${fontUpperName}.${fontName}ExtraBold],
${rowMargin}[${fontType.toUpperCase()}_EXTRABOLD_ITALIC]: [Fonts.${fontUpperName}.${fontName}ExtraBoldItalic],
${rowMargin}[${fontType.toUpperCase()}_BLACK]: [Fonts.${fontUpperName}.${fontName}Black],
${rowMargin}[${fontType.toUpperCase()}_BLACK_ITALIC]: [Fonts.${fontUpperName}.${fontName}BlackItalic]`
}

const generate = () => {

    /**
    |--------------------------------------------------
    | fonts_const
    |--------------------------------------------------
    */
    const fontsConstString =
        `${_generateFontsConsts('primary', primaryUpper)}
${_generateFontsConsts('secondary', secondaryUpper)}
export const Fonts = {
${_generateFontsConstExports(primary, primaryUpper)},
${_generateFontsConstExports(secondary, secondaryUpper)}
}
`

    fs.writeFileSync('plugins/app-themes/fonts/fonts_const.ts', fontsConstString, 'utf8')
    fs.writeFileSync('tailwind-config/src/theme/extend/fonts/fonts_const.ts', fontsConstString, 'utf8')

    /**
    |--------------------------------------------------
    | Index.ts
    |--------------------------------------------------
    */
    const indexString =
        `import {
  Fonts,
 ${_generateIndexImports('Primary')}
${_generateIndexImports('Secondary')}
} from './fonts_const'

export const fontFamily = {
${_generateIndexFontFamily('Primary', primary, primaryUpper)},
${_generateIndexFontFamily('Secondary', secondary, secondaryUpper)}
}
`

    fs.writeFileSync('tailwind-config/src/theme/extend/fonts/index.ts', indexString, 'utf8')
}

generate()
