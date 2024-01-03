'use strict';

/**
 * revenu service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::revenu.revenu');
