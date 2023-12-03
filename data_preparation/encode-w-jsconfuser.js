'use strict'

const jsconfuser = require('js-confuser')

/**
 * 
 * @param {string} content 
 * @returns {Promise.<string>}
 */
module.exports.encodeFiles = async function (content) {
    return jsconfuser.obfuscate(content, { target: 'node', deadCode: true, minify: false, preset: 'high', })
}