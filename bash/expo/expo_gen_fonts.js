if (process.argv.length === 2) {
    console.error('Expected at least one argument!');
    process.exit(1);
}
const primary = (process.argv[2]);
const secondary = (process.argv[3]);

console.log('primary:', primary, ' secondary:', secondary)

const generate = () => {

    const string = `${importRows}

export const svgs = {
  ${exportRows}
}
`

    fs.writeFileSync('tailwind-config/src/theme/extend/fonts/fonts_const.ts', string, 'utf8')
}

// generate()
