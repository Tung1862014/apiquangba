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
    billReviewsShowAll(req, res, next) {
       //console.log('traangthai: '+ req.body.DH_trangthai);
      
        if(req.query.DG_sosao === ''){
            Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE NB_id='${req.query.NB_id}'`)])
            .then(([result])=>{
                Promise.all([ mydb.query(`SELECT count(DG_id) as star5 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='5'`)])
                .then(([star5])=>{
                    Promise.all([ mydb.query(`SELECT count(DG_id) as star4 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='4'`)])
                    .then(([star4])=>{
                        Promise.all([ mydb.query(`SELECT count(DG_id) as star3 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='3'`)])
                        .then(([star3])=>{
                            Promise.all([ mydb.query(`SELECT count(DG_id) as star2 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='2'`)])
                            .then(([star2])=>{
                                Promise.all([ mydb.query(`SELECT count(DG_id) as star1 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='1'`)])
                                .then(([star1])=>{
                                    for(let i=0; i<result.length; i++){
                                        Promise.all([ mydb.query(`SELECT dh.DH_id, sp.SP_ten, sp.SP_image, nd.ND_hoten, nd.ND_sdt  FROM sanpham as sp, danhgia as dg, nguoidung as nd, donhang as dh WHERE sp.SP_id = dg.SP_id AND nd.ND_id = dg.ND_id AND dg.DH_id = dh.DH_id AND dg.ND_id='${result[i].ND_id}' AND dg.SP_id ='${result[i].SP_id}'`)])
                                        .then(([product]) => {
                                            result[i].product = product;
                                            if(i === result.length-1){
                                                res.json({
                                                    result: result,
                                                    star5: star5,
                                                    star4: star4,
                                                    star3: star3,
                                                    star2: star2,
                                                    star1: star1,
                                                });
                                                }
                                        })
                                        .catch((err)=>{
                                            console.log('loi');
                                        })
                                    } 
                                })
                                .catch((err)=>{
                                    console.log('loi1');
                                })
                            })
                            .catch((err)=>{
                                console.log('loi2');
                            })
                        })
                        .catch((err)=>{
                            console.log('loi3');
                        })
                    })
                    .catch((err)=>{
                        console.log('loi4');
                    })
                })
                .catch((err)=>{
                    console.log('loi5');
                })
                
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
        }else{
            Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='${req.query.DG_sosao}'`)])
            .then(([result])=>{
                if(result[0] !== undefined){
                    Promise.all([ mydb.query(`SELECT count(DG_id) as star5 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='5'`)])
                    .then(([star5])=>{
                        Promise.all([ mydb.query(`SELECT count(DG_id) as star4 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='4'`)])
                        .then(([star4])=>{
                            Promise.all([ mydb.query(`SELECT count(DG_id) as star3 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='3'`)])
                            .then(([star3])=>{
                                Promise.all([ mydb.query(`SELECT count(DG_id) as star2 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='2'`)])
                                .then(([star2])=>{
                                    Promise.all([ mydb.query(`SELECT count(DG_id) as star1 FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='1'`)])
                                    .then(([star1])=>{
                                        for(let i=0; i<result.length; i++){
                                            Promise.all([ mydb.query(`SELECT dh.DH_id, sp.SP_ten, sp.SP_image, nd.ND_hoten, nd.ND_sdt  FROM sanpham as sp, danhgia as dg, nguoidung as nd, donhang as dh WHERE sp.SP_id = dg.SP_id AND nd.ND_id = dg.ND_id AND dg.DH_id = dh.DH_id AND dg.ND_id='${result[i].ND_id}' AND dg.SP_id ='${result[i].SP_id}'`)])
                                            .then(([product]) => {
                                                result[i].product = product;
                                                if(i === result.length-1){
                                                    res.json({
                                                        result: result,
                                                        star5: star5,
                                                        star4: star4,
                                                        star3: star3,
                                                        star2: star2,
                                                        star1: star1,
                                                    });
                                                    }
                                            })
                                            .catch((err)=>{
                                                console.log('loi');
                                            })
                                        } 
                                    })
                                    .catch((err)=>{
                                        console.log('loi1');
                                    })
                                })
                                .catch((err)=>{
                                    console.log('loi2');
                                })
                            })
                            .catch((err)=>{
                                console.log('loi3');
                            })
                        })
                        .catch((err)=>{
                            console.log('loi4');
                        })
                    })
                    .catch((err)=>{
                        console.log('loi5');
                    }) 
                }else{
                    res.json({
                        result: result,
                    });
                }
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
        }
       
    }

    // billDetailPrepare(req, res, next){
    //     Promise.all([ mydb.query(`UPDATE donhang SET DH_trangthai='${req.body.DH_trangthai}' WHERE NB_id='${req.body.NB_id}' AND DH_id='${req.body.DH_id}'`)])
    //         .then(([result])=>{
    //             res.json({
    //                 update: true,
    //             })
    //         })
    //         .catch((err) =>{
    //             res.json({
    //                 update: false,
    //             })
    //         })
    // }

    // billPrint(req, res, next){
    //     Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}' AND DH_id='${req.body.DH_id}'`)])
    //     .then(([result])=>{
    //                 console.log(result.length);
    //                 for(let i=0; i<result.length; i++){
    //                     Promise.all([ mydb.query(`SELECT  ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image, sp.SP_gia, nd.ND_hoten, nd.ND_sdt  FROM sanpham as sp, thongtindonhang as ttdh, nguoidung as nd WHERE sp.SP_id = ttdh.SP_id AND nd.ND_id = ttdh.ND_id AND DH_id='${result[i].DH_id}'`)])
    //                     .then(([product]) => {
    //                         result[i].product = product;
    //                         if(i === result.length-1){
    //                             Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
    //                             .then(([shop])=>{
    //                                 result[0].shop = shop;
    //                                 res.json({
    //                                     result: result,
    //                                 });
    //                             })
    //                             .catch((err)=>{
    //                                 console.log('loi shop');
    //                             })
    //                         }
    //                     })
    //                     .catch((err)=>{
    //                         console.log('loi');
    //                     })
    //                 } 
                
    //      })
    //      .catch((err) =>{
    //         res.send({
    //             seller: false,
    //         })
    //      })
    // }

}

module.exports = new SellerDetailBillController();