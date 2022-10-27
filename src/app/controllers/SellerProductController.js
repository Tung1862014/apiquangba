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

class SellerProductController {
    productShowAll(req, res, next) {
       console.log('traangthai: '+ req.body.SP_trangthai);
       if(req.body.SP_trangthai === 'trangthai'){
        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE NB_id='${req.body.NB_id}'AND SP_trangthai='0' ORDER by SP_id DESC`)])
        .then(([result])=>{
            Promise.all([ mydb.query(`SELECT count(SP_id) as status FROM sanpham WHERE NB_id='${req.body.NB_id}' AND SP_trangthai='0'`)])
            .then(([status])=>{
                res.json({
                    result: result,
                    status: status
                });
            })
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
       }else if(req.body.SP_trangthai === 'trangthaiaction'){
           Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE NB_id='${req.body.NB_id}'AND SP_trangthai='1' ORDER by SP_id DESC`)])
           .then(([result])=>{
              Promise.all([ mydb.query(`SELECT count(SP_id) as status FROM sanpham WHERE NB_id='${req.body.NB_id}' AND SP_trangthai='0'`)])
              .then(([status])=>{
                  res.json({
                      result: result,
                      status: status
                  });
              })
           })
           .catch((err) =>{
              res.send({
                  seller: false,
              })
           })
       }else{
            Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE NB_id='${req.body.NB_id}'AND SP_trangthai!='2' ORDER by SP_id DESC`)])
            .then(([result])=>{
                Promise.all([ mydb.query(`SELECT count(SP_id) as status FROM sanpham WHERE NB_id='${req.body.NB_id}' AND SP_trangthai='0'`)])
                .then(([status])=>{
                    Promise.all([ mydb.query(`SELECT count(SP_id) as number FROM sanpham WHERE NB_id='${req.body.NB_id}'`)])
                        .then(([number])=>{
                            res.json({
                                result: result,
                                status: status,
                                number: number
                            });
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

    productAdd(req, res, next) {
        //const formData = req.body;
        console.log( req.body.NB_id,  req.body.SP_ten,  req.body.SP_soluong,  req.body.SP_gia,  req.body.SP_khuyenmai,  req.body.DM_id);
        if(req.files){
            let paths ='';
             res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_PRODUCT+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.image = paths;  
            Promise.all([ mydb.query(`INSERT INTO sanpham(NB_id, SP_ten, SP_soluong, SP_gia, SP_image, SP_khuyenmai, SP_trongluong, SP_mota, SP_trangthai, DM_id) VALUES ('${req.body.NB_id}','${req.body.SP_ten}','${req.body.SP_soluong}','${req.body.SP_gia}','${req.body.image}','${req.body.SP_khuyenmai}','${req.body.SP_trongluong}','${req.body.SP_mota}','1', '${req.body.DM_id}')`)])
            .then(([result]) => {
                res.json({
                    result: true,
                })
            })
            .catch((err) => {
               
            })
         }
        
            // .then(([result])=>{
            //     res.json({
            //         sellerAdd: true,
            //     })
            // })
            // .catch((error)=>{
            //     res.json({
            //         sellerAdd: true,
            //     })
            // })
    }

    productAddDescribe(req, res, next){
        Promise.all([ mydb.query(`SELECT MAX(SP_id) as max FROM sanpham WHERE NB_id = '${req.body.NB_id}'`)])  
        .then(([max])=>{
            console.log('max: ' + JSON.stringify(max[0].max));
            Promise.all([ mydb.query(`INSERT INTO motasanpham(NB_id, SP_id, TL_id, MTSP_noidung) VALUES ('${req.body.NB_id}', '${max[0].max}', '${req.body.TL_trongluong}', '${req.body.MTSP_noidung}')`)]) 
                
                res.json({
                    sellerAdd: true,
                })
            })
            
        .catch((error)=>{
                res.json({
                    sellerAdd: true,
                })
            })
    }

    productAddImage(req, res, next) {
        //const formData = req.body;
        //console.log( req.body.NB_id,  req.body.SP_ten,  req.body.SP_soluong,  req.body.SP_gia,  req.body.SP_khuyenmai,  req.body.DM_id);
        if(req.files){
            let paths ='';
             res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_PRODUCT+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.image = paths;  
            Promise.all([ mydb.query(`SELECT MAX(SP_id) as max FROM sanpham WHERE NB_id = '${req.body.NB_id}'`)])
                .then(([max])=>{
                    console.log('max: ' + JSON.stringify(max[0].max));
                    Promise.all([ mydb.query(`INSERT INTO hinhanh(SP_id, HA_image) VALUES ('${max[0].max}', '${req.body.image}')`)]) 
                       
                    })
         }
        
            // .then(([result])=>{
            //     res.json({
            //         sellerAdd: true,
            //     })
            // })
            // .catch((error)=>{
            //     res.json({
            //         sellerAdd: true,
            //     })
            // })
    }

    productSearch(req, res, next) {
        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_ten LIKE '%${req.query.SP_ten}%'`)])
            .then(([result])=>{
                Promise.all([ mydb.query(`SELECT count(SP_id) as status FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_trangthai='0'`)])
                .then(([status])=>{
                    Promise.all([ mydb.query(`SELECT count(SP_id) as number FROM sanpham WHERE NB_id='${req.query.NB_id}'`)])
                        .then(([number])=>{
                            res.json({
                                result: result,
                                status: status,
                                number: number
                            });
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

module.exports = new SellerProductController();