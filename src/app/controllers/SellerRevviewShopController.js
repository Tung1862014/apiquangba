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
            Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE NB_id='${req.query.NB_id}' ORDER by DG_id DESC` )])
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
            Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE NB_id='${req.query.NB_id}' AND DG_sosao='${req.query.DG_sosao}' ORDER by DG_id DESC`)])
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

    UpdateAnswer(req, res, next){
        console.log('id', req.body.DG_id);
        console.log('answer', req.body.DG_traloi);
        if(req.body.DG_traloi !== ''){
            Promise.all([ mydb.query(`UPDATE danhgia SET DG_traloi='${req.body.DG_traloi}' WHERE DG_id='${req.body.DG_id}'`)])
                .then(([result]) => {
                    res.send(result);
                })
                .catch((err) => {
                    console.error(err);
                })
        }
    }

}

module.exports = new SellerDetailBillController();