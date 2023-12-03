'use strict'

const je = require('jencrypt')

/**
 * 
 * @param {string} content 
 * @returns {Promise.<string>}
 */
module.exports.encodeFiles = async function (content) {
    return je.encode(content)
}

