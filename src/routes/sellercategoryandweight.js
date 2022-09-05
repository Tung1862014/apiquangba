const express = require('express');
const router = express.Router();
// const uploadProduct = require('../middleware/sellseraddproduct')
// const uploadProductImage = require('../middleware/sellseraddproductimage')

const sellerCategoryAndWeightController = require('../app/controllers/SellerCategoryAndWeightController');

// router.put('/update/save/:id', customerController.update);

// router.get('/search', customerController.search);
// router.put('/user',upload.array('image'), sellerController.update);

// router.put('/user/image',upload.array('image'), sellerController.updateImage);

// router.post('/establish/image',upload.array('image'), sellerController.establish);
// router.post('/establish', sellerController.establishNoImage);

// router.post('/establish/logo',upload.array('image'), sellerController.establishLogo);

// router.post('/establish/show',sellerController.establishShow);

router.post('/category/add',sellerCategoryAndWeightController.categoryAdd);

router.put('/category/update',sellerCategoryAndWeightController.categoryUpdate);

router.delete('/category/delete',sellerCategoryAndWeightController.categoryDelete);

router.post('/weight/add',sellerCategoryAndWeightController.weightAdd);

router.put('/weight/update',sellerCategoryAndWeightController.weightUpdate);

router.delete('/weight/delete',sellerCategoryAndWeightController.weightDelete);

// router.post('/product/add/image',uploadProductImage.array('image'),sellerProductController.productAddImage);


// router.get('/product/show/weight',sellerProductController.productShowWeight);

// router.get('/product/show/category',sellerProductController.productShowCategory);


//router.get('/', customerController.index);

module.exports = router;
