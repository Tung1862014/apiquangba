const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const productShopController = require('../app/controllers/ProductShopController');

router.get('/shop/show', productShopController.ShowProduct);

router.get('/shop/product/show/all', productShopController.ShowAllProduct);


module.exports = router;
