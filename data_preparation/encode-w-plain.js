'use strict'

const { encodeFilesInFolder } = require('./encoder.js')

/**
 * 
 * @param {string} content 
 * @returns {Promise.<string>}
 */
async function encodeFiles() {
    await encodeFilesInFolder({
        callback: async (content) => content
    })
}

encodeFiles()