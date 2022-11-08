const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const orderController = require('../app/controllers/OrderController');

router.get('/user/show', orderController.ShowAllUser);

router.delete('/delete/product', orderController.DeleteProduct);

router.put('/update/address', orderController.UpdateAddress);

router.post('/add/orderproduct', orderController.AddOrderProduct);

router.get('/show/id/order/simulation', orderController.ShowIdSimulation);


module.exports = router;
