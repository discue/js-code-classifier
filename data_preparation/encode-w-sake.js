'use strict'

const sake = require('sake-js')

/**
 * 
 * @param {string} content 
 * @returns {Promise.<string>}
 */
module.exports.encodeFiles = async function(content) {
    return sake.obfuscate(content, { random: true })
}