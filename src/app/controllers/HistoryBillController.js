const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class HistoryBillController {
    
    

    //[GET]  /show/all
    ShowAllBill(req, res, next){
        console.log(req.query.ND_id);
        //console.log(req.query.NB_id);
        let sellerArr = [];
        let sellerName = [];
        Promise.all([ mydb.query(`SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL ORDER by ttdh.TTDH_id DESC`)])
        .then(([results])=>{
            for(let i=0; i<results.length; i++){
                Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id='${results[i].SP_id}'`)])
                    .then(([product]) => {
                        results[i].product = product[0];
                        if(i === results.length-1){
                            for(let j=0; j<results.length; j++){
                                Promise.all([ mydb.query(`SELECT mts.MTS_chitiet, mts.MTS_diachi, mts.MTS_id, mts.MTS_image, mts.MTS_logo, mts.MTS_ten, nd.ND_sdt FROM motashop as mts, nguoidung as nd WHERE mts.NB_id = nd.ND_id AND mts.NB_id='${results[j].NB_id}'`)])
                                    .then(([seller]) => {
                                        results[j].seller = seller[0];
                                        if(j === results.length-1){
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
                        console.log('loi show');
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
    }

    //[delete]  delete/product
    DeleteProduct(req, res, next){
        console.log(req.body.TTDH_id);
        Promise.all([ mydb.query(`DELETE FROM thongtindonhang WHERE TTDH_id=${req.body.TTDH_id}`)])
            .then(([results])=>{
                res.send(results);
            })
            .catch((err) =>{
                console.log('loi');
                res.send(results);
            })
       
    }
}

module.exports = new HistoryBillController();
