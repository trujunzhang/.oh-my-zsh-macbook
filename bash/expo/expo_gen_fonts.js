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

const generateConsts = (name, upperName) => {

    return `/**
|--------------------------------------------------
| POPPINS
|--------------------------------------------------
*/
/* {thin} */
export const PRIMARY_THIN = 'primary-thin'
export const PRIMARY_THIN_ITALIC = 'primary-thin_italic'
/* {light} */
export const PRIMARY_LIGHT = 'primary-light'
export const PRIMARY_LIGHT_ITALIC = 'primary-light-italic'
/* {extra-light} */
export const PRIMARY_EXTRALIGHT = 'primary-extralight'
export const PRIMARY_EXTRALIGHT_ITALIC = 'primary-extralight-italic'
/* {regular} */
export const PRIMARY_REGULAR = 'primary-regular'
export const PRIMARY_REGULAR_ITALIC = 'primary-regular-italic'
/* {medium} */
export const PRIMARY_MEDIUM = 'primary-medium'
export const PRIMARY_MEDIUM_ITALIC = 'primary-medium-italic'
/* {semi-bold} */
export const PRIMARY_SEMIBOLD = 'primary-semibold'
export const PRIMARY_SEMIBOLD_ITALIC = 'primary-semibold-italic'
/* {bold} */
export const PRIMARY_BOLD = 'primary-bold'
export const PRIMARY_BOLD_ITALIC = 'primary-bold-italic'
/* {extra-bold} */
export const PRIMARY_EXTRABOLD = 'primary-extrabold'
export const PRIMARY_EXTRABOLD_ITALIC = 'primary-extrabold-italic'
/* {black} */
export const PRIMARY_BLACK = 'primary-black'
export const PRIMARY_BLACK_ITALIC = 'primary-black-italic'
`
}


const generate = () => {

    const string =
        `

`

    fs.writeFileSync('tailwind-config/src/theme/extend/fonts/fonts_const.ts', string, 'utf8')
}

// generate()
