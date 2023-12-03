'use strict'

const { obfuscate } = require('javascript-obfuscator')

/**
 * 
 * @param {string} content 
 * @returns {Promise.<string>}
 */
module.exports.encodeFiles = async function (content) {
    return obfuscate(content).getObfuscatedCode()
}