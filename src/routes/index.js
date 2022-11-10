// const typeRoute = require('./type');
const staffRoute = require('./staff');
const customerRoute = require('./customer');
const sellerRoute = require('./seller');
const sellersettingshopRoute = require('./sellersettingshop');
const sellerproductRoute = require('./sellerproduct');
const sellerupdateproductRoute = require('./sellerupdateproduct');
const sellercategoryandweightRoute = require('./sellercategoryandweight');
const sellerbillRoute = require('./sellerbill');
const sellerdetailbillRoute = require('./sellerdetailbill');
const sellerreviewsshopRoute = require('./sellerreviewsshop');
const loginRoute = require('./login');
const homeRoute = require('./home');
// const billRoute = require('./bill');
 const productRoute = require('./product');
 const productdetailRoute = require('./productdetail');
 const productshopRoute = require('./productshop');
 const cartRoute = require('./cart');
 const orderRoute = require('./order');
 const historybillRoute = require('./historybill');
 const searchRoute = require('./search');

 const adminRoute = require('./admin');
// const supplierRoute = require('./supplier');
const chartRoute = require('./chart');
const uploadRoute = require('./uploads');

function route(app) {
    // app.use('/supplier', supplierRoute);
    app.use('/staff', staffRoute);
    app.use('/customer', customerRoute);
    app.use('/seller', sellerRoute);
    app.use('/sellersettingshop',sellersettingshopRoute);
    app.use('/sellerproduct', sellerproductRoute);
    app.use('/sellerupdateproduct',sellerupdateproductRoute);
    app.use('/sellercategoryandweight', sellercategoryandweightRoute);
    app.use('/sellerbill', sellerbillRoute);
    app.use('/sellerdetailbill', sellerdetailbillRoute);
    app.use('/sellerreviewsshop', sellerreviewsshopRoute);
    // app.use('/bill', billRoute);
    app.use('/auth', loginRoute);
    app.use('/product', productRoute);
    app.use('/productdetail', productdetailRoute);
    app.use('/productshop',productshopRoute);
    app.use('/cartcustomer',cartRoute);
    app.use('/order',orderRoute);
    app.use('/historybill',historybillRoute);
    app.use('/search',searchRoute);
    // app.use('/type', typeRoute);
    app.use('/admin',adminRoute);
    app.use('/home', homeRoute);

    app.use('/chart', chartRoute);
    app.use('/uploads', uploadRoute);

    // app.get('/', function (req, res, next) {
    //     console.log('Request URL:')
    //     next()
    //   }, function (req, res, next) {
    //     console.log('Request Type')
    //     next()
    //   });
}

module.exports = route;
