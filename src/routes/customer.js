const express = require('express');
const router = express.Router();
const upload = require('../middleware/customers');

const customerController = require('../app/controllers/CustomerController');

// router.put('/update/save/:id', customerController.update);

// router.get('/search', customerController.search);
// router.put('/user',upload.array('image'), customerController.update);

// router.put('/user/image',upload.array('image'), customerController.updateImage);
//////////////////////////////////////////////////////////////////Seting customer
router.get('/show/account', customerController.ShowAccount);

router.put('/update/account', customerController.UpdateAccountNoImage);

router.put('/update/account/image',upload.array('image'), customerController.UpdateAccountImage);

//////////////////////////////////////////////////////////////////Login

router.post('/signup',upload.array('image',12), customerController.insert);

router.post('/login', customerController.login);

//router.get('/', customerController.index);

module.exports = router;
