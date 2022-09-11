const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const orderController = require('../app/controllers/OrderController');

router.get('/user/show', orderController.ShowAllUser);

router.delete('/delete/product', orderController.DeleteProduct);

router.put('/update/address', orderController.UpdateAddress);


module.exports = router;