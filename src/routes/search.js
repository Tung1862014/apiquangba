const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const searchController = require('../app/controllers/SearchController');

//router.get('/shop/show', productShopController.ShowProduct);

router.get('/product/show/all', searchController.ShowAllProduct);


module.exports = router;
