const express = require('express');
const router = express.Router();
const uploadProduct = require('../middleware/sellseraddproduct')
const uploadProductImage = require('../middleware/sellseraddproductimage')

const sellerProductController = require('../app/controllers/SellerProductController');

// router.put('/update/save/:id', customerController.update);

// router.get('/search', customerController.search);
// router.put('/user',upload.array('image'), sellerController.update);

// router.put('/user/image',upload.array('image'), sellerController.updateImage);

// router.post('/establish/image',upload.array('image'), sellerController.establish);
// router.post('/establish', sellerController.establishNoImage);

// router.post('/establish/logo',upload.array('image'), sellerController.establishLogo);

// router.post('/establish/show',sellerController.establishShow);

router.post('/product/show/all',sellerProductController.productShowAll);

router.post('/product/add',uploadProduct.array('image'),sellerProductController.productAdd);

router.post('/product/add/image',uploadProductImage.array('image'),sellerProductController.productAddImage);

router.post('/product/add/promotion',sellerProductController.productAddPromotion);

router.get('/product/show/weight',sellerProductController.productShowWeight);

router.get('/product/show/category',sellerProductController.productShowCategory);

router.get('/product/search/name',sellerProductController.productSearch);


//router.get('/', customerController.index);

module.exports = router;
