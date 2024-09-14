'use strict';

/**
 * visitor controller
 */

const { createCoreController } = require('@strapi/strapi').factories;

module.exports = createCoreController('api::visitor.visitor');
