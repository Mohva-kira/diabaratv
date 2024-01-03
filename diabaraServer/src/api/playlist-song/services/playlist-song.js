'use strict';

/**
 * playlist-song service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::playlist-song.playlist-song');
