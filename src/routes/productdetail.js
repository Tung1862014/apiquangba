const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const productDetailController = require('../app/controllers/ProductDetailController');

router.get('/product/show/all', productDetailController.ShowAllProduct);

router.get('/detail/product', productDetailController.ShowProduct);

router.post('/add/product/customer', productDetailController.AddProduct);


module.exports = router;
