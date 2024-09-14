'use strict';

/**
 * stream service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::stream.stream');
