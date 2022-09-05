const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const productController = require('../app/controllers/ProductController');

router.get('/show/suggestions/all', productController.ShowSuggestions);

router.get('/show/promotion/all', productController.ShowPromotion);

module.exports = router;
