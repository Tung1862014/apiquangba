const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const adminController = require('../app/controllers/AdminController');

router.post('/login', adminController.loginAdmin);

router.get('/show/account', adminController.ShowAccount);

// router.delete('/delete/product', adminController.DeleteProduct);

router.get('/show/all/user', adminController.ShowAllUser);

router.put('/update/status/customer',adminController.UpdateStatusCustomer);

router.get('/search/customer',adminController.SearchCustomer);

// router.delete('/delete/product', adminController.DeleteProduct);

router.get('/show/all/seller', adminController.ShowAllSeller);

router.put('/update/status/seller',adminController.UpdateStatusSeller);

router.get('/search/seller',adminController.SearchSeller);

// router.put('/update/address', adminController.UpdateAddress);


module.exports = router;
