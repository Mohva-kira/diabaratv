'use strict';

/**
 * visitor router
 */

const { createCoreRouter } = require('@strapi/strapi').factories;

module.exports = createCoreRouter('api::visitor.visitor');
