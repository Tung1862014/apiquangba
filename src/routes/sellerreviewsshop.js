const express = require('express');
const router = express.Router();

const sellerReviewsShopController = require('../app/controllers/SellerRevviewShopController');

router.get('/evaluate/show/all',sellerReviewsShopController.billReviewsShowAll);

router.get('/evaluate/show/star',sellerReviewsShopController.ShowNumberStar);

router.put('/update/answer', sellerReviewsShopController.UpdateAnswer)

router.get('/evaluate/show/all/name/product',sellerReviewsShopController.billReviewsShowAllNameProduct);

//router.get('/', customerController.index);

module.exports = router;
