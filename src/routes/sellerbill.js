const express = require('express');
const router = express.Router();

const sellerBillController = require('../app/controllers/SellerBillController');

router.post('/bill/show/all',sellerBillController.billShowAll);

router.get('/bill/show/number',sellerBillController.ShowNumberBill);

router.get('/bill/search/id',sellerBillController.billSearchId);


//router.get('/', customerController.index);

module.exports = router;
