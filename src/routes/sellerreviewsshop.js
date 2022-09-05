const express = require('express');
const router = express.Router();

const sellerReviewsShopController = require('../app/controllers/SellerRevviewShopController');

router.get('/evaluate/show/all',sellerReviewsShopController.billReviewsShowAll);

//router.get('/', customerController.index);

module.exports = router;
