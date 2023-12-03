'use strict'

const { readFile, writeFile, stat, readdir } = require('fs/promises')
const path = require('path')

const [, , baseFolder] = process.argv

const encoders = {
    jjencode: require('./encode-w-jjencode.js'),
    jsconfuser: require('./encode-w-jsconfuser.js'),
    // jsfuck: require('./encode-w-jsfuck.js'),
    obfuscate: require('./encode-w-obfuscate.js'),
    // sake: require('./encode-w-sake.js'),
    uglify: require('./encode-w-uglify.js')
}

/**
 * 
 * @param {string} path 
 * @returns {Promise.<boolean>}
 */
async function doesFileExist(path) {
    try {
        const stats = await stat(path)
        return stats.isFile()
    } catch (_) {
        return false
    }
}

const encodeFilesInFolder = async function () {
    console.log('Encoding all files')
    const input = `${baseFolder}/plain-es5`

    const files = await readdir(input)
    console.log(`Found ${files.length} files in source folder`)

    for (const file of files) {
        try {
            const inputFilePath = path.join(input, file)
            const content = await readFile(inputFilePath, 'utf-8')

            const encodePromises = Promise.all(Object.keys(encoders).map((category) => {
                return new Promise((resolve, reject) => {
                    const output = `${baseFolder}/${category}`
                    const outputFilePath = path.join(output, file).replace(/js$/, 'txt')
                    doesFileExist(outputFilePath).then(async (exists) => {
                        if (!exists) {
                            try {
                                const encodedContent = await encoders[category].encodeFiles(content)
                                const data = Buffer.from(encodedContent, 'utf8')
                                resolve({
                                    outputFilePath, data
                                })
                            } catch (e) {
                                console.error('Encoding error', e)
                                reject(e)
                            }
                        } else {
                            resolve({})
                        }
                    })
                })
            }))

            const encodedFiles = await encodePromises

            await Promise.all(encodedFiles.map(({ outputFilePath, data }) => {
                if (!outputFilePath) {
                    return Promise.resolve()
                }
                return writeFile(outputFilePath, data, 'utf-8')
            }))

        } catch (err) {
            console.error('Error reading directory:', err)
        }
    }
}

encodeFilesInFolder()