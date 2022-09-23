const express = require('express');
const router = express.Router();
// const multer = require('multer');
const upload = require('../middleware/upload');
// var upload = multer({ dest:'../images/' });

const historyBillController = require('../app/controllers/HistoryBillController');

router.get('/cart/show/all', historyBillController.ShowAllBill);

router.delete('/delete/product', historyBillController.DeleteProduct);

router.put('/update/number/product', historyBillController.UpdateNumber);


module.exports = router;
