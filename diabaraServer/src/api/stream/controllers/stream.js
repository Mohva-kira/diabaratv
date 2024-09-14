'use strict';

/**
 * stream controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::stream.stream');
