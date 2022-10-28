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

class SellerDetailBillController {
    billDetailShowAll(req, res, next) {
       console.log('traangthai: '+ req.body.DH_trangthai);
      
        Promise.all([ mydb.query(`SELECT * FROM donhang as dh, motashop as mts WHERE dh.NB_id=mts.NB_id AND dh.NB_id='${req.body.NB_id}' AND dh.DH_id='${req.body.DH_id}'`)])
        .then(([result])=>{
            for(let i=0; i<result.length; i++){
                Promise.all([ mydb.query(`SELECT  ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image, sp.SP_gia, sp.SP_khuyenmai, nd.ND_hoten, nd.ND_sdt  FROM sanpham as sp, thongtindonhang as ttdh, nguoidung as nd WHERE sp.SP_id = ttdh.SP_id AND nd.ND_id = ttdh.ND_id AND DH_id='${result[i].DH_id}'`)])
                .then(([product]) => {
                    result[i].product = product;
                    if(i === result.length-1){
                        res.json({
                            result: result,
                            // statusconfirm: statusconfirm,
                            // statusdelivered: statusdelivered,
                            // statuscancelOrder: statuscancelOrder,
                            // number: number
                        });
                        }
                })
                .catch((err)=>{
                    console.log('loi');
                })
            } 
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
       
    }

    billDetailPrepare(req, res, next){
        console.log('req.body.DH_id', req.body.DH_id);
        Promise.all([ mydb.query(`UPDATE donhang SET DH_trangthai='${req.body.DH_trangthai}' WHERE NB_id='${req.body.NB_id}' AND DH_id='${req.body.DH_id}'`)])
            .then(([result])=>{
                res.json({
                    update: result,
                })
            })
            .catch((err) =>{
                res.json({
                    update: false,
                })
            })
    }

    billPrint(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}' AND DH_id='${req.body.DH_id}'`)])
        .then(([result])=>{
                    console.log(result.length);
                    for(let i=0; i<result.length; i++){
                        Promise.all([ mydb.query(`SELECT  ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image, sp.SP_gia, nd.ND_hoten, nd.ND_sdt  FROM sanpham as sp, thongtindonhang as ttdh, nguoidung as nd WHERE sp.SP_id = ttdh.SP_id AND nd.ND_id = ttdh.ND_id AND DH_id='${result[i].DH_id}'`)])
                        .then(([product]) => {
                            result[i].product = product;
                            if(i === result.length-1){
                                Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
                                .then(([shop])=>{
                                    result[0].shop = shop;
                                    res.json({
                                        result: result,
                                    });
                                })
                                .catch((err)=>{
                                    console.log('loi shop');
                                })
                            }
                        })
                        .catch((err)=>{
                            console.log('loi');
                        })
                    } 
                
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
    }

}

module.exports = new SellerDetailBillController();