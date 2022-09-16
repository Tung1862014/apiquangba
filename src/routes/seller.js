const express = require('express');
const router = express.Router();
const upload = require('../middleware/customers');
const uploads = require('../middleware/customers');


const sellerController = require('../app/controllers/SellerController');

////////////////////////////////////////////////////////////////// Thong tin tai khoan
router.get('/show/account', sellerController.ShowAccount);

router.put('/update/account', sellerController.UpdateAccountNoImage);

router.put('/update/account/image',upload.array('image'), sellerController.UpdateAccountImage);

////////////////////////////////////////////////////////////////// Thong ke

router.get('/statistical/show/all',sellerController.statisticalShowAll);

//////////////////////////////////////////////////////////////////Dang ky / Dang nhap

router.post('/signup',uploads.array('image',12), sellerController.insert);

router.post('/login', sellerController.login);

//router.get('/', customerController.index);

module.exports = router;
