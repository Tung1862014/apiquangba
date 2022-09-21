const express = require('express');
const router = express.Router();
const upload = require('../middleware/establish');
const uploads = require('../middleware/customers');


const sellerSettingShopController = require('../app/controllers/SellerSettingShopController');

////////////////////////////////////////////////////////////////// Motashop

// router.post('/establish/image',upload.array('image'), sellerSettingShopController.establish);

// router.post('/establish', sellerSettingShopController.establishNoImage);


router.post('/establish/show',sellerSettingShopController.establishShow);

router.post('/establish/save/insert',upload.array('image'),sellerSettingShopController.establishSaveInsert);

router.post('/establish/logo',upload.array('image'), sellerSettingShopController.establishLogo);

router.put('/establish/update/image',upload.array('image'), sellerSettingShopController.establishUpdateImage);

router.put('/establish/update/image/logo',upload.array('image'), sellerSettingShopController.establishUpdateImageLogo);

router.put('/establish/update/address', sellerSettingShopController.establishUpdateAddress);

router.get('/establish/show/all/shop', sellerSettingShopController.showShop);


module.exports = router;
