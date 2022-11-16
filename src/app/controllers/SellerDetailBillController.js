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
                Promise.all([ mydb.query(`SELECT  ttdh.TTDH_soluong, ttdh.TTDH_gia, ttdh.TTDH_phantram, sp.SP_id,sp.SP_soluongban, sp.SP_ten, sp.SP_image, sp.SP_gia, nd.ND_hoten, nd.ND_sdt  FROM sanpham as sp, thongtindonhang as ttdh, nguoidung as nd WHERE sp.SP_id = ttdh.SP_id AND nd.ND_id = ttdh.ND_id AND DH_id='${result[i].DH_id}'`)])
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
        console.log('req.body.DH_id', req.body.DH_id, req.body.SP_id, req.body.TTDH_soluong, req.body.SP_soluongban);
        Promise.all([ mydb.query(`UPDATE donhang SET DH_trangthai='${req.body.DH_trangthai}', DH_ghichuhuy='${req.body.DH_ghichuhuy}' WHERE NB_id='${req.body.NB_id}' AND DH_id='${req.body.DH_id}'`)])
            .then(([result])=>{
                if( req.body.SP_id !== 0){
                    for(let i=0; i<req.body.SP_id.length; i++){
                        Promise.all([ mydb.query(`UPDATE sanpham SET SP_soluongban='${Number(req.body.TTDH_soluong[i]) +  Number(req.body.SP_soluongban[i])}' WHERE NB_id='${req.body.NB_id}' AND SP_id = '${req.body.SP_id[i]}'`)])
                            .then(([product]) => {
                                if(i === req.body.SP_id.length - 1){
                                    res.json({
                                        update: result,
                                    })
                                }
                            })
                            .catch((err) =>{
                                res.json({
                                    update: false,
                                })
                            })
                    }
                }else{
                    res.json({
                        update: result,
                    })
                }
                
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
                    Promise.all([ mydb.query(`SELECT * FROM motashop as mts, nguoidung as nb WHERE mts.NB_id=nb.ND_id AND mts.NB_id='${req.body.NB_id}'`)])
                    .then(([shop])=>{
                        result[0].shop = shop;
                        for(let i=0; i<result.length; i++){
                            Promise.all([ mydb.query(`SELECT  ttdh.TTDH_soluong, ttdh.TTDH_gia, ttdh.TTDH_phantram, sp.SP_ten, sp.SP_image, sp.SP_gia, nd.ND_hoten, nd.ND_sdt  FROM sanpham as sp, thongtindonhang as ttdh, nguoidung as nd WHERE sp.SP_id = ttdh.SP_id AND nd.ND_id = ttdh.ND_id AND DH_id='${result[i].DH_id}'`)])
                            .then(([product]) => {
                                result[i].product = product;
                                if(i === result.length-1){
                                    res.json({
                                        result: result,
                                    });
                                    
                                }
                            })
                            .catch((err)=>{
                                console.log('loi');
                            })
                        } 
                        
                    })
                    .catch((err)=>{
                        console.log('loi shop');
                    })  
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
    }

}

module.exports = new SellerDetailBillController();