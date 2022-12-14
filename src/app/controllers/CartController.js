const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class CartController {
    
    //[GET]  /show/number/product
    ShowNumberProduct(req, res, next){
        Promise.all([ mydb.query(`SELECT Count(TTDH_id) as soluong FROM thongtindonhang WHERE ND_id='${req.query.ND_id}' AND DH_id IS NULL ORDER by TTDH_id DESC`)])
            .then(([results])=>{
                res.json({
                    results: results[0].soluong
                })
            })
            .catch((err)=>{
                res.json({
                    result: false
                })
            })
    }

    //[GET]  /show/all
    ShowAllProduct(req, res, next){
        console.log(req.query.ND_id);
        //console.log(req.query.NB_id);
        let sellerArr = [];
        let sellerName = [];
        Promise.all([ mydb.query(`SELECT * FROM thongtindonhang WHERE ND_id='${req.query.ND_id}' AND DH_id IS NULL ORDER by TTDH_id DESC`)])
            .then(([results])=>{
                if(results.length > 0){
                    for(let i=0; i<results.length; i++){
                        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id='${results[i].SP_id}'`)])
                            .then(([product]) => {
                                results[i].product = product[0];
                                if(i === results.length-1){
                                    for(let j=0; j<results.length; j++){
                                        Promise.all([ mydb.query(`SELECT mts.MTS_chitiet, mts.MTS_diachi, mts.MTS_id, mts.MTS_image, mts.MTS_logo, mts.MTS_clientId, mts.MTS_ten, nd.ND_sdt FROM motashop as mts, nguoidung as nd WHERE mts.NB_id = nd.ND_id AND mts.NB_id='${results[j].NB_id}'`)])
                                            .then(([seller]) => {
                                                results[j].seller = seller[0];
                                                if(j === results.length-1){
                                                    for(let t=0; t<results.length; t++){
                                                        Promise.all([ mydb.query(`SELECT * FROM khuyenmai WHERE SP_id='${results[t].SP_id}'`)])
                                                            .then(([promotion]) => {
                                                                if(promotion.length > 0){
                                                                    results[t].promotion = promotion[0];
                                                                }else{
                                                                    results[t].promotion = 0;
                                                                }
                                                                if(t === results.length-1){
                                                                    res.json({
                                                                        results: results,
                                                                    })
                                                                }
                                                            })
                                                            .catch((err) => {
                                                                console.log('loi show nha');
                                                            })
                                                    }
                                                }
                                            })
                                            .catch((err) => {
                                                console.log('loi show nha');
                                            })
                                    }
                                   
                                }
                            })
                            .catch((err) => {
                                console.log('loi show');
                            })
                    }
                }else{
                    res.json({
                        results: results,
                    })
                }  
            })
            .catch((err) => {
                console.log('loi show');
            })
    }

    //[UPDATE]  /update/numbers
    UpdateNumber(req, res, next){
        console.log(req.body.TTDH_id, req.body.TTDH_soluong);
        Promise.all([ mydb.query(`UPDATE thongtindonhang SET TTDH_soluong='${req.body.TTDH_soluong}' WHERE TTDH_id='${req.body.TTDH_id}'`)])
            .then((result) => {
                console.log('successfully');
                res.send(result);
            })
            .catch((err) => {
                console.log('field');
                res.send(result);
            })

            Promise.all([ mydb.query(`SELECT * FROM thongtindonhang WHERE TTDH_id='${req.body.TTDH_id}'`)])
            .then(([result]) => {
                console.log('successfully: ', result[0]);
                Promise.all([ mydb.query(`UPDATE giohang SET TTGH_soluong='${req.body.TTDH_soluong}' WHERE SP_id='${result[0].SP_id}' AND ND_id='${result[0].ND_id}'`)])
                .then(([results]) => {
                    console.log('successfully');
                })
                .catch((err) => {
                    console.log('field ffff');   
                })
            })
            .catch((err) => {
                console.log('loi cart');
            })
            
    }

    //[delete]  delete/product
    DeleteProduct(req, res, next){
        console.log(req.body.TTDH_id);
        Promise.all([ mydb.query(`SELECT * FROM thongtindonhang WHERE TTDH_id='${req.body.TTDH_id}'`)])
        .then(([result])=>{
            Promise.all([ mydb.query(`DELETE FROM giohang WHERE SP_id='${result[0].SP_id}' AND ND_id='${result[0].ND_id}'`)])
            .then(([results])=>{
                
            })
            .catch((err) =>{
               
            })
        })
        Promise.all([ mydb.query(`DELETE FROM thongtindonhang WHERE TTDH_id=${req.body.TTDH_id}`)])
            .then(([results])=>{
                res.json({
                    results: true,
                });
            })
            .catch((err) =>{
                res.json({
                    results: false,
                });
            })


           
            
       
    }
}

module.exports = new CartController();
