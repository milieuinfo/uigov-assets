import path from 'path';
import fs from 'fs-extra';

const wrapAsStylesObject = (content) => `import { css, CSSResult } from 'lit';\n\nconst style: CSSResult = css\`\n${content}\`;\nexport default style;`;

const wrapCssInJs = (directoryToSearch, jsSuffix, removeOriginal) => {
    const pattern = '.css';
    fs.readdirSync(directoryToSearch).forEach((file) => {
        const filePath = path.resolve(directoryToSearch, file);
        const stat = fs.statSync(filePath);
        if (stat.isDirectory()) {
            wrapCssInJs(filePath, jsSuffix, removeOriginal);
        }
        if (stat.isFile() && filePath.endsWith(pattern)) {
            const scssJsFile = filePath.replace(/.css$/, jsSuffix);
            fs.readFile(filePath, 'utf8', (err, data) => {
                // replace one \ with two \\ to escape the escape character
                data = data.replace(/\\/g, '\\\\');
                fs.outputFile(scssJsFile, wrapAsStylesObject(data));
                console.log('processed css file to:', scssJsFile);
                if (removeOriginal) {
                    // remove the original file, keep the map file
                    fs.unlink(filePath);
                }
            });
        }
    });
};

// post process
wrapCssInJs('dist', '.css.ts', true);

// npx sass src/lib:dist/src/lib --no-source-map --load-path ./node_modules
// node post-process-libs.mjs
// npx tsc dist/**/*.ts --declaration --emitDeclarationOnly
