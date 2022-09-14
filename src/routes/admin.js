const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const adminController = require('../app/controllers/AdminController');

router.post('/login', adminController.loginAdmin);

router.get('/show/all/user', adminController.ShowAllUser);

router.put('/update/status/customer',adminController.UpdateStatusCustomer);

router.get('/search/customer',adminController.SearchCustomer);

// router.delete('/delete/product', adminController.DeleteProduct);

// router.put('/update/address', adminController.UpdateAddress);


module.exports = router;
