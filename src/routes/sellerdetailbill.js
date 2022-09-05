const express = require('express');
const router = express.Router();

const sellerBillController = require('../app/controllers/SellerDetailBillController');

router.post('/bill/show/all',sellerBillController.billDetailShowAll);

router.put('/bill/update/prepare',sellerBillController.billDetailPrepare);

router.post('/bill/print',sellerBillController.billPrint);


//router.get('/', customerController.index);

module.exports = router;
