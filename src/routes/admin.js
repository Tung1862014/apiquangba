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

// router.put('/update/address', adminController.UpdateAddress);

router.get('/backup/show/user', adminController.BackupShowUser);

router.get('/backup/show/product', adminController.BackupShowProduct);

router.get('/backup/show/image', adminController.BackupShowImage);

router.get('/backup/show/promotion', adminController.BackupShowPromotion);

router.get('/backup/show/shop', adminController.BackupShowShop);

router.get('/backup/show/cart', adminController.BackupShowCart);

router.get('/backup/show/order', adminController.BackupShowOder);

router.get('/backup/show/infomation/order', adminController.BackupShowInfomationOrder);

router.get('/backup/show/customer', adminController.BackupShowCustomer);

router.get('/backup/show/delivery/address', adminController.BackupShowDeliveryAddress);

router.get('/backup/show/seller', adminController.BackupShowSeller);

router.get('/backup/show/advertise', adminController.BackupShowAdvertise);

router.get('/backup/show/link', adminController.BackupShowLink);



module.exports = router;
