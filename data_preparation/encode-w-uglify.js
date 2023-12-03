'use strict'

const { minify } = require('uglify-js')

/**
 * 
 * @param {string} content 
 * @returns {Promise.<string>}
 */
module.exports.encodeFiles = async function (content) {
    const output = minify(content, { compress: true, parse: { bare_returns: true } })
    if (!output.code) {
        const error = new Error('Minify did not return code output')
        error.cause = output
        throw error
    }
    return output.code
}