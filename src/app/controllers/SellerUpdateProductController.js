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

class SellerUpdateProductController {
    productShow(req, res, next) {
        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE NB_id='${req.body.NB_id}'AND SP_id='${req.body.SP_id}'`)])
        .then(([result])=>{
            Promise.all([ mydb.query(`SELECT * FROM danhmuc WHERE DM_id='${result[0].DM_id}'`)])
            .then(([category])=>{
                res.json({
                    result: result,
                    category: category,
                });
            })
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
      
    }

    productShowDescribe(req, res, next) {
        Promise.all([ mydb.query(`SELECT * FROM motasanpham WHERE SP_id='${req.body.SP_id}'`)])
        .then(([result])=>{
            if(result){
                console.log(result[0].TL_id);
                Promise.all([ mydb.query(`SELECT * FROM trongluong WHERE TL_id='${result[0].TL_id}'`)])
                .then(([weight])=>{
                    //console.log(weight[0].TL_trongluong);
                    res.json({
                        result: result,
                        weight: weight,
                    });
                })
            }
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
    }

    productShowImage(req, res, next) {
        Promise.all([ mydb.query(`SELECT * FROM hinhanh WHERE SP_id='${req.body.SP_id}'`)])
        .then(([result])=>{
            if(result){
                res.json({
                    image1: result[0],
                    image2: result[1],
                    image3: result[2],
                });
                
            }
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
    }

    //[GET] /show/weight
    productShowWeight(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM trongluong WHERE NB_id = '${req.query.seller}'`)])
            .then(([result])=>{
                res.json({
                result: result,
                weight: true,
            });
            })
            .catch((err) =>{
                res.json({
                    weight: false,
                })
            })
            
    }

    //[GET] /show/category
    productShowCategory(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM danhmuc WHERE NB_id = '${req.query.seller}'`)])
            .then(([result])=>{
                res.json({
                result: result,
                category: true,
            });
            })
            .catch((err) =>{
                res.json({
                    category: false,
                })
            })
            
    }


    //[POST] /product/update
    productUpdateNoImge(req, res, next){
        let urlImage;
        if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_soluong='${req.body.SP_soluong}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}', SP_soluong='${req.body.SP_soluong}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}', SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_soluong='${req.body.SP_soluong}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_soluong='${req.body.SP_soluong}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_soluong='${req.body.SP_soluong}',SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_soluong='${req.body.SP_soluong}',SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }
        Promise.all([ mydb.query(urlImage)])
        .then(([result])=>{
            res.json(
                {
                    update: true,
                }
            );
        })
        .catch((err)=>{
            res.json(
                {
                    update: false,
                }
            );
        })
    }

    productUpdateImge(req, res, next){
        
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_PRODUCT+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.SP_image = paths;  
            //Promise.all([ mydb.query(`INSERT INTO sanpham(NB_id, SP_ten, SP_soluong, SP_gia, SP_image, SP_khuyenmai, SP_trangthai, DM_id) VALUES ('${req.body.NB_id}','${req.body.SP_ten}','${req.body.SP_soluong}','${req.body.SP_gia}','${req.body.image}','${req.body.SP_khuyenmai}','1', '${req.body.DM_id}')`)])  
         
        let urlImage;
        if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_soluong='${req.body.SP_soluong}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}', SP_soluong='${req.body.SP_soluong}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}', SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_soluong='${req.body.SP_soluong}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_soluong='${req.body.SP_soluong}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_soluong='${req.body.SP_soluong}',SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_soluong='${req.body.SP_soluong}',SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong === '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia === '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai === '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten !== '' && req.body.SP_soluong !== '' && req.body.SP_gia !== '' && req.body.SP_khuyenmai !== '' && req.body.DM_id !== ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}', SP_ten='${req.body.SP_ten}',SP_soluong='${req.body.SP_soluong}', SP_gia='${req.body.SP_gia}', SP_khuyenmai='${req.body.SP_khuyenmai}', DM_id='${req.body.DM_id}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }else if(req.body.SP_ten === '' && req.body.SP_soluong === '' && req.body.SP_gia === '' && req.body.SP_khuyenmai === '' && req.body.DM_id === ''){
            urlImage = `UPDATE sanpham SET SP_image='${req.body.SP_image}' WHERE NB_id = '${req.body.NB_id}' AND SP_id = '${req.body.SP_id}'`;
        }
        Promise.all([ mydb.query(urlImage)])
        .then(([result])=>{
            res.json(
                {
                    update: true,
                }
            );
        })
        .catch((err)=>{
            res.json(
                {
                    update: false,
                }
            );
        })
    }
    }


    productUpdateDescribe(req, res, next){
        let urlImage;
        if(req.body.TL_id === ''){
            urlImage = `UPDATE motasanpham SET MTSP_noidung WHERE SP_id='${req.body.SP_id}'`;
        }else{
            urlImage = `UPDATE motasanpham SET TL_id='${req.body.TL_id}', MTSP_noidung='${req.body.MTSP_noidung}' WHERE SP_id='${req.body.SP_id}'`;
        }
        Promise.all([ mydb.query(urlImage)])
        .then(([result])=>{
            res.json(
                {
                    update: true,
                }
            );
        })
        .catch((err)=>{
            res.json(
                {
                    update: false,
                }
            );
        })
    }

    productUpdateImgeSubPhoto1(req, res, next){
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_PRODUCT+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.HA_image = paths; 
            Promise.all([mydb.query(`SELECT * FROM hinhanh WHERE SP_id='${req.body.SP_id}'`)])
            .then(([result]) =>{
                console.log(result[0].HA_id);
                Promise.all([mydb.query(`UPDATE hinhanh SET HA_image='${req.body.HA_image}' WHERE SP_id='${req.body.SP_id}' AND HA_id='${result[0].HA_id}'`)])
            })
            .catch((err) =>{})
        }
    }
    productUpdateImgeSubPhoto2(req, res, next){
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_PRODUCT+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.HA_image = paths; 
            Promise.all([mydb.query(`SELECT * FROM hinhanh WHERE SP_id='${req.body.SP_id}'`)])
            .then(([result]) =>{
                console.log(result[1].HA_id);
                Promise.all([mydb.query(`UPDATE hinhanh SET HA_image='${req.body.HA_image}' WHERE SP_id='${req.body.SP_id}' AND HA_id='${result[1].HA_id}'`)])
            })
            .catch((err) =>{})
        }
    }
    productUpdateImgeSubPhoto3(req, res, next){
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_PRODUCT+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.HA_image = paths; 
            Promise.all([mydb.query(`SELECT * FROM hinhanh WHERE SP_id='${req.body.SP_id}'`)])
            .then(([result]) =>{
                console.log(result[2].HA_id);
                Promise.all([mydb.query(`UPDATE hinhanh SET HA_image='${req.body.HA_image}' WHERE SP_id='${req.body.SP_id}' AND HA_id='${result[2].HA_id}'`)])
            })
            .catch((err) =>{})
        }
    }

    productDelete(req, res, next){
        Promise.all([mydb.query(`DELETE FROM sanpham WHERE SP_id='${req.body.SP_id}'`)])
        .then(([result]) =>{
            Promise.all([mydb.query(`DELETE FROM motasanpham WHERE SP_id='${req.body.SP_id}'`)])
            Promise.all([mydb.query(`DELETE FROM hinhanh WHERE SP_id='${req.body.SP_id}'`)])
            res.json(
                {
                    delete: true,
                }
            )
        })
        .catch((err) =>{
            res.json(
                {
                    delete: false,
                }
            )
        })
    }
}

module.exports = new SellerUpdateProductController();