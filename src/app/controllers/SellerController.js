const Customer = require('../models/Customer');
const uploadDir = require('../../uploads');
const fs = require("fs");
// const {
//     multipleMongooseToObject,
//     mongooseToObject,
// } = require('../../util/mongoose');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class SellerController {

    insert(req, res, next) {
        console.log('image: '+ JSON.stringify(req.files))
        const formData = req.body;
        console.log(req.body.ND_username);
        let testUserName = '';
         Promise.all([mydb.query(`SELECT * FROM nguoidung WHERE ND_username='${formData.ND_username}' AND ND_quyen=1`)])
         .then(([results]) => {
            console.log(results[0]);
            if(results[0] !== undefined) {
                res.json(
                    {
                        ND_username: false,
                    }
                )
            }else {
                if(req.files){
                    let paths ='';
                     res.json(req.files)
                    const arr =  req.files;
                    arr.forEach(function(e, index, arr){
                       paths = paths + process.env.URL_IMAGE_CUSTOMER+ e.filename +',';
                    })
                    paths = paths.substring(0, paths.lastIndexOf(','));
                    formData.image = paths;
                    
                 }else{
                    console.log('loi image')
                }
                Promise.all([mydb.query(`INSERT INTO nguoidung( ND_hoten, ND_username, ND_password, ND_image, ND_email, ND_diachi, ND_ngay, ND_sdt, ND_quyen) VALUES (
                    '${formData.ND_hoten}','${formData.ND_username}','${formData.ND_password}','${formData.image}','${formData.ND_email}','${formData.ND_diachi}','${formData.ND_ngay}','${formData.ND_sdt}','1'
                    )`)])        
            }
         })
         .catch((err) => {
             res.send('Loi khong tim user')
         })   
    }

    //POST LOGIN
    login(req, res, next){
        console.log(req.body.userName)
        Promise.all([mydb.query(`SELECT * FROM nguoiban WHERE NB_email='${req.body.userName}'`) ])
        .then(([result]) =>{
            if(result){
                //let user = result[0];
                res.json({result: result[0]})
            }else{
                res.json({tt:'Tài khoản không tồn tại'})
            } 
        }
        )
            .catch(err => res.json({tt:'Tài khoản không tồn tại sss'}))
    }
    

    //[POST]  /establish
    establish(req, res, next){
        //console.log('iamge: '+ req.files);
        if(req.files){
            Promise.all([ mydb.query(`SELECT MTS_image FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
            .then(([result1])=>{
                //console.log('iamge: '+result1[0].MTS_image)
                if(result1[0]){
                    //console.log('iamge: '+uploadDir)
                    const uploadImage  = uploadDir+ result1[0].MTS_image.split('/').slice(4,5);
                    // console.log('iamge: '+uploadImage)
                    fs.unlink(uploadImage, (error) => {
                        // if any error
                        if (error) {
                        console.error(error);
                        return;
                        }
                        console.log("Successfully deleted file!");
                    }); 
                }
            })
            .catch(err => res.json({err: true, promise: false, errorCode: 'loi'})) 
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_SHOP+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.image = paths;
         }
         Promise.all([ mydb.query(`SELECT count(MTS_id) as exist FROM motashop WHERE MTS_ten='${req.body.MTS_ten}'`)])
         .then(([exist]) =>{
            if(exist[0].exist <=0){
                Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
                .then(([result])=>{
                   console.log(result[0]);
                    if(result[0] !== undefined){
                       //console.log(req.body.image);
                       if(req.body.image === '' && req.body.MTS_diachi !== ''){
                           Promise.all([ mydb.query(`UPDATE motashop SET MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`)])
                           .then(([result])=>{
                               res.json({
                                   seller: true,
                               })
                           })
                       }else if(req.body.image !== '' && req.body.MTS_diachi !== ''){
                           Promise.all([ mydb.query(`UPDATE motashop SET MTS_image='${req.body.image}', MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`)])
                           .then(([result])=>{
                               res.json({
                                   seller: true,
                               })
                           })
                       }else if(req.body.image !== '' && req.body.MTS_diachi === ''){
                           Promise.all([ mydb.query(`UPDATE motashop SET MTS_image='${req.body.image}' WHERE NB_id='${req.body.NB_id}'`)])
                           .then(([result])=>{
                               res.json({
                                   seller: true,
                               })
                           })
                       }
                    }else{
                     Promise.all([ mydb.query(`INSERT INTO motashop(NB_id, MTS_ten, MTS_image, MTS_diachi) VALUES ('${req.body.NB_id}','${req.body.MTS_ten}','${req.body.image}','${req.body.MTS_diachi}')`)])
                    }
                })
                .catch((err) =>{
                    res.send({
                        seller: false,
                    })
                })
            }else{
                res.json({
                    seller: false,
                    exist: true,
                })
            }
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
    }
    establishNoImage(req, res, next){
        //console.log('iamge: '+ req.files);
        Promise.all([ mydb.query(`SELECT count(MTS_id) as exist FROM motashop WHERE MTS_ten='${req.body.MTS_ten}'`)])
            .then(([exist]) =>{
                console.log(exist[0].exist);
                if(exist[0].exist <=0){
                    Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
                        .then(([result])=>{
                            if(result){
                                if(req.body.MTS_diachi !== ''){
                                    Promise.all([ mydb.query(`UPDATE motashop SET MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`)])
                                    .then(([result])=>{
                                        res.json({
                                            seller: true,
                                        })
                                    })
                                }
                            }else{
                                Promise.all([ mydb.query(`INSERT INTO motashop(NB_id, MTS_ten, MTS_image, MTS_diachi) VALUES ('${req.body.NB_id}','${req.body.MTS_ten}','${req.body.image}','${req.body.MTS_diachi}')`)])
                                .then(([result])=>{
                                    res.json({
                                        seller: true,
                                    })
                                })
                            }
                        })
                        .catch((err) =>{
                            res.send({
                                seller: false,
                            })
                        })
                }else{
                    res.json({
                        seller: false,
                        exist: true,
                    })
                }
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
    }
    establishShow(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
         .then(([result])=>{
            res.json({result: result[0]})
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
    }
    establishLogo(req, res, next){
        //console.log(req.files);
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_SHOP+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.image = paths;
            console.log(req.body.image);
            Promise.all([ mydb.query(`UPDATE motashop SET MTS_logo='${req.body.image}' WHERE NB_id='${req.body.NB_id}'`)])
            .then(([result])=>{
               
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
        }
    }

    //
    statisticalShowAll(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.query.NB_id}' ORDER by DH_id DESC`)])
            .then(([result])=>{
                Promise.all([ mydb.query(`SELECT count(DH_id) as statusconfirm FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='1'`)])
                .then(([statusconfirm])=>{
                    Promise.all([ mydb.query(`SELECT count(DH_id) as statusdelivered FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='2'`)])
                        .then(([statusdelivered])=>{
                            Promise.all([ mydb.query(`SELECT count(DH_id) as statuscancelOrder FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='3'`)])
                                .then(([statuscancelOrder])=>{
                                    Promise.all([ mydb.query(`SELECT count(SP_id) as statusoutOfStock FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_trangthai='0'`)])
                                        .then(([statusoutOfStock])=>{
                                            Promise.all([ mydb.query(`SELECT count(DH_id) as number FROM donhang WHERE NB_id='${req.query.NB_id}'`)])
                                            .then(([number])=>{
                                                for(let i=0; i<result.length; i++){
                                                    Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                                                    .then(([num]) => {
                                                        result[i].soluong = num;
                                                            if(i === result.length-1){
                                                                for(let j=0; j<result.length; j++){
                                                                Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                                                .then(([use]) => {
                                                                    result[j].nguoidung = use;
                                                                    if(j === result.length-1){
                                                                    res.json({
                                                                        result: result,
                                                                        statusconfirm: statusconfirm,
                                                                        statusdelivered: statusdelivered,
                                                                        statuscancelOrder: statuscancelOrder,
                                                                        statusoutOfStock: statusoutOfStock,
                                                                        number: number
                                                                    });
                                                                    }
                                                                })
                                                                .catch((err) =>{
                                                                    console.log('loi')
                                                                })
                                                                }
                                                             }
                                                    })
                                                    .catch((err) =>{
                                                        console.log('loi cc')
                                                    })
                                                }
                                            })
                                        })
                                })
                        })
                })
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
    }
}

module.exports = new SellerController();
