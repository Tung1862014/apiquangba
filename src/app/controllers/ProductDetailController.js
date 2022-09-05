const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class ProductDetailController {
    
    ShowProduct(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM sanpham as sp, motasanpham as mtsp WHERE sp.SP_id = mtsp.SP_id AND sp.SP_id=${req.query.SP_id}`)])
            .then(([results])=>{
                Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE SP_id='${req.query.SP_id}'`)])
                    .then(([evaluation])=>{
                        let num = 0;
                        for(let i = 0; i < evaluation.length; i++){
                            Promise.all([ mydb.query(`SELECT ND_hoten, ND_username, ND_image, ND_email, ND_diachi, ND_ngaysinh, ND_sdt FROM nguoidung WHERE ND_id = '${evaluation[i].ND_id}'`)])
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
                                                        res.json({
                                                            results: results,
                                                            evaluation: evaluation,
                                                            evaluationNum: evaluation.length,
                                                            evaluationStar: Math.round(num/evaluation.length),
                                                        });
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
        console.log(req.body.ND_id, req.body.NB_id, req.body.TTDH_soluong,req.body.SP_id );
       //res.json({results: req.body.SP_id});
       Promise.all([ mydb.query(`SELECT * FROM thongtindonhang WHERE ND_id='${req.body.ND_id}' AND SP_id='${req.body.SP_id}'`)])
        .then(([result]) => {
            console.log(result[0].TTDH_soluong);
            if(result[0] != undefined){
                Promise.all([ mydb.query(`UPDATE thongtindonhang SET TTDH_soluong='${req.body.TTDH_soluong+result[0].TTDH_soluong}' WHERE ND_id='${req.body.ND_id}' AND SP_id='${req.body.SP_id}'`)])
                .then(([info]) => {
                    res.send(info);
                })
                .catch((err) =>{
                    console.log('loi');
                })
            }else{
                Promise.all([ mydb.query(`INSERT INTO thongtindonhang( ND_id, NB_id, SP_id, TTDH_soluong) VALUES ('${req.body.ND_id}','${req.body.NB_id}','${req.body.SP_id}','${req.body.TTDH_soluong}')`)])
                .then(([info]) => {
                    res.send(info);
                })
                .catch((err) =>{
                    console.log('loi');
                })
            }
        })
        .catch((err) =>{
            console.log('loi');
        })
       
    }
}

module.exports = new ProductDetailController();
