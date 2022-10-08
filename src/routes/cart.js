const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const cartController = require('../app/controllers/CartController');

router.get('/cart/show/all', cartController.ShowAllProduct);

router.get('/cart/show/number/product', cartController.ShowNumberProduct);

router.delete('/delete/product', cartController.DeleteProduct);

router.put('/update/number/product', cartController.UpdateNumber);


module.exports = router;
