const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class ProductDetailController {
    
    ShowProduct(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id=${req.query.SP_id}`)])
            .then(([results])=>{
                Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE SP_id='${req.query.SP_id}'`)])
                    .then(([evaluation])=>{
                        console.log('evaluation',evaluation[0]);
                        let num = 0;
                        if(evaluation[0] !== undefined){
                            for(let i = 0; i < evaluation.length; i++){
                                Promise.all([ mydb.query(`SELECT ND_hoten, ND_username, ND_image, ND_email, ND_diachi, ND_ngay, ND_sdt FROM nguoidung WHERE ND_id = '${evaluation[i].ND_id}'`)])
                                    .then(([user])=>{
                                        //console.log(user[0]);
                                        num = num + evaluation[i].DG_sosao;
                                        evaluation[i].userName = user[0];
                                        if(i == evaluation.length-1){
                                            Promise.all([ mydb.query(`SELECT * FROM hinhanh WHERE SP_id='${req.query.SP_id}'`)])
                                                .then(([image])=>{
                                                    results[0].image = image;
                                                    Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${results[0].NB_id}'`)])
                                                        .then(([shop])=>{
                                                            results[0].shop = shop;
                                                            Promise.all([ mydb.query(`SELECT * FROM khuyenmai WHERE SP_id='${req.query.SP_id}'`)])
                                                                .then(([promotion])=>{
                                                                    
                                                                    if(promotion.length > 0) {
                                                                        res.json({
                                                                            results: results,
                                                                            evaluation: evaluation,
                                                                            evaluationNum: evaluation.length,
                                                                            evaluationStar: Math.round(num/evaluation.length),
                                                                            promotion: promotion,
                                                                        });
                                                                    }else{
                                                                        res.json({
                                                                            results: results,
                                                                            evaluation: evaluation,
                                                                            evaluationNum: evaluation.length,
                                                                            evaluationStar: Math.round(num/evaluation.length),
                                                                            promotion: promotion,
                                                                        });
                                                                    }
                                                                })
                                                                .catch((error)=>{
                                                                    console.log('loi anh nha');
                                                                })
                                                        })
                                                        .catch((error)=>{
                                                            console.log('loi anh nha');
                                                        })
                                                    
                                                })
                                                .catch((error)=>{
                                                    console.log('loi anh nha');
                                                })
                                        }
                                        
                                    })
                                    .catch((error)=>{
                                        console.log('loi nha');
                                    })    
                            }
                        }else{
                            Promise.all([ mydb.query(`SELECT ND_hoten, ND_username, ND_image, ND_email, ND_diachi, ND_ngay, ND_sdt FROM nguoidung WHERE ND_id = '${results[0].ND_id}'`)])
                            .then(([user])=>{
                                //console.log(user[0]);
                                //num = num + evaluation[i].DG_sosao;
                                results[0].userName = user[0];
                                Promise.all([ mydb.query(`SELECT * FROM hinhanh WHERE SP_id='${req.query.SP_id}'`)])
                                .then(([image])=>{
                                    results[0].image = image;
                                    Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${results[0].NB_id}'`)])
                                        .then(([shop])=>{
                                            results[0].shop = shop;
                                            Promise.all([ mydb.query(`SELECT * FROM khuyenmai WHERE SP_id='${req.query.SP_id}'`)])
                                            .then(([promotion])=>{
                                                                    
                                                if(promotion.length > 0) {
                                                    res.json({
                                                        results: results,
                                                        evaluation: evaluation,
                                                        evaluationNum: evaluation.length,
                                                        evaluationStar: Math.round(num/evaluation.length),
                                                        promotion: promotion,
                                                    });
                                                }else{
                                                    res.json({
                                                        results: results,
                                                        evaluation: evaluation,
                                                        evaluationNum: evaluation.length,
                                                        evaluationStar: Math.round(num/evaluation.length),
                                                        promotion: promotion,
                                                    });
                                                }
                                            })
                                            .catch((error)=>{
                                                console.log('loi anh nha');
                                            })
                                        })
                                        .catch((error)=>{
                                            console.log('loi anh nha');
                                        })
                                    
                                })
                                .catch((error)=>{
                                    console.log('loi anh nha');
                                })
                                
                            })
                            .catch((error)=>{
                                console.log('loi nha');
                            }) 
                        }
                    })
                    .catch((err) =>{
                        console.log('loi');
                    })
            })
            .catch((err) =>{
                console.log('loi');
            })
       
    }

    //[GET]  /show/all
    ShowAllProduct(req, res, next){
        //console.log(req.query.NB_id);
        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' ORDER by SP_id DESC`)])
            .then((results)=>{
                res.json({
                    results: results[0],
                })
            })
            .catch((err) => {
                console.log('loi show');
            })
    }

    //[POST]  /add/product/customer
    AddProduct(req, res, next){
        //console.log(req.body.ND_id, req.body.NB_id, req.body.TTDH_soluong,req.body.SP_id );
       //res.json({results: req.body.SP_id});
       Promise.all([ mydb.query(`SELECT * FROM thongtindonhang WHERE ND_id='${req.body.ND_id}' AND SP_id='${req.body.SP_id}' AND DH_id IS NULL`)])
        .then(([result]) => {
            //console.log(typeof result[1].DH_id);
            if(result[0] != undefined){
                Promise.all([ mydb.query(`UPDATE thongtindonhang SET TTDH_soluong='${req.body.TTDH_soluong+result[0].TTDH_soluong}' WHERE ND_id='${req.body.ND_id}' AND SP_id='${req.body.SP_id}'`)])
                .then(([info]) => {
                    res.json({
                        info: info,
                        result: true
                    })
                })
                .catch((err) =>{
                    console.log('loi');
                })
            }else{
                Promise.all([ mydb.query(`INSERT INTO thongtindonhang( ND_id, NB_id, SP_id, TTDH_soluong) VALUES ('${req.body.ND_id}','${req.body.NB_id}','${req.body.SP_id}','${req.body.TTDH_soluong}')`)])
                .then(([info]) => {
                    res.json({
                        info: info,
                        result:true
                    })
                })
                .catch((err) =>{
                    console.log('loi');
                })
            }
        })
        .catch((err) =>{
            console.log('loi dh', err);
        })
       
    }
}

module.exports = new ProductDetailController();
