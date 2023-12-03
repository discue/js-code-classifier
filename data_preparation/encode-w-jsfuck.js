'use strict'

const { JSFuck: { encode } } = require('jsfuck')

/**
 * 
 * @param {string} content 
 * @returns {Promise.<string>}
 */
module.exports.encodeFiles = async function (content) {
    return encode(content)
}