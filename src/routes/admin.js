const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/customers')
const uploadAdverties = require('../middleware/adverties')
// var upload = multer({ dest:'../images/' });

const adminController = require('../app/controllers/AdminController');

router.post('/login', adminController.loginAdmin);
// router.delete('/delete/product', adminController.DeleteProduct);

router.get('/show/account', adminController.ShowAccount);

router.put('/update/account', adminController.UpdateAccountNoImage);

router.put('/update/account/image',upload.array('image'), adminController.UpdateAccountImage);

// router.delete('/delete/product', adminController.DeleteProduct);

router.get('/show/all/user', adminController.ShowAllUser);

router.put('/update/status/customer',adminController.UpdateStatusCustomer);

router.put('/update/note/customer',adminController.UpdateNoteCustomer);

router.get('/search/customer',adminController.SearchCustomer);

// router.delete('/delete/product', adminController.DeleteProduct);

router.get('/show/all/seller', adminController.ShowAllSeller);

router.put('/update/status/seller',adminController.UpdateStatusSeller);

router.get('/search/seller',adminController.SearchSeller);

// router.put('/update/address', adminController.UpdateAddress);

router.get('/show/advertise', adminController.ShowAdvertise);

router.post('/delete/advertise', adminController.DeleteAdvertise);

router.post('/add/advertise',uploadAdverties.array('image'), adminController.AddAdvertise);

router.get('/show/all/advertise', adminController.ShowAllAdverties);

router.put('/update/advertise/image',uploadAdverties.array('image'), adminController.UpdateAdvertiseImage);

router.put('/update/advertise', adminController.UpdateAdvertiseNoImage);

// router.put('/update/address', adminController.UpdateAddress);

router.get('/show/link/advertise', adminController.ShowLinkAdvertise);

router.post('/add/link/advertise',adminController.AddLinkAdvertise);

router.put('/update/link/advertise', adminController.UpdateLinkAdvertise);

router.delete('/delete/link/advertise', adminController.DeleteLinkAdvertise);


module.exports = router;
