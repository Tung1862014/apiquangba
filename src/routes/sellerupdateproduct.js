const express = require('express');
const router = express.Router();
const uploadProduct = require('../middleware/sellseraddproduct')
const uploadProductImage = require('../middleware/sellseraddproductimage')

const sellerUpdateProductController = require('../app/controllers/SellerUpdateProductController');

// router.put('/update/save/:id', customerController.update);

// router.get('/search', customerController.search);
// router.put('/user',upload.array('image'), sellerController.update);

// router.put('/user/image',upload.array('image'), sellerController.updateImage);

// router.post('/establish/image',upload.array('image'), sellerController.establish);
// router.post('/establish', sellerController.establishNoImage);

// router.post('/establish/logo',upload.array('image'), sellerController.establishLogo);

// router.post('/establish/show',sellerController.establishShow);

router.post('/product/show/image',sellerUpdateProductController.productShowImage);

router.post('/product/show/describe',sellerUpdateProductController.productShowDescribe);

router.post('/product/show',sellerUpdateProductController.productShow);

router.post('/product/update',sellerUpdateProductController.productUpdateNoImge);

router.post('/product/update/image',uploadProduct.array('image'),sellerUpdateProductController.productUpdateImge);

router.post('/product/update/describe',sellerUpdateProductController.productUpdateDescribe);

router.post('/product/update/image/subphoto1',uploadProductImage.array('image'),sellerUpdateProductController.productUpdateImgeSubPhoto1);

router.post('/product/update/image/subphoto2',uploadProductImage.array('image'),sellerUpdateProductController.productUpdateImgeSubPhoto2);

router.post('/product/update/image/subphoto3',uploadProductImage.array('image'),sellerUpdateProductController.productUpdateImgeSubPhoto3);

router.post('/product/delete',sellerUpdateProductController.productDelete);

// router.post('/product/add/image',uploadProductImage.array('image'),sellerProductController.productAddImage);


// router.get('/product/show/weight',sellerProductController.productShowWeight);

// router.get('/product/show/category',sellerProductController.productShowCategory);


//router.get('/', customerController.index);

module.exports = router;
