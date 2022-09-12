const express = require('express');
const router = express.Router();
const upload = require('../middleware/establish');
const uploads = require('../middleware/customers');


const sellerController = require('../app/controllers/SellerController');

router.post('/establish/image',upload.array('image'), sellerController.establish);

router.post('/establish', sellerController.establishNoImage);

router.post('/establish/logo',upload.array('image'), sellerController.establishLogo);

router.post('/establish/show',sellerController.establishShow);

router.get('/statistical/show/all',sellerController.statisticalShowAll);

router.post('/signup',uploads.array('image',12), sellerController.insert);

router.post('/login', sellerController.login);

//router.get('/', customerController.index);

module.exports = router;
