// uses https://github.com/SanderRonde/prettier-plugin-sort-imports/issues/2#issuecomment-1237556280

// const pluginSortImports = require('prettier-plugin-sort-imports')
// const pluginTailwindcss = require('prettier-plugin-tailwindcss')

// /** @type {import("prettier").Parser}  */
// const myParser = {
//   ...pluginSortImports.parsers.typescript,
//   parse: pluginTailwindcss.parsers.typescript.parse,
// }

// /** @type {import("prettier").Plugin}  */
// const myPlugin = {
//   parsers: {
//     typescript: myParser,
//   },
// }

const config = {
  useTabs: false,
  printWidth: 80,
  singleQuote: true,
  bracketSameLine: true,
  tabWidth: 2,
  trailingComma: "es5",
  semi: false,
};

export default config;
