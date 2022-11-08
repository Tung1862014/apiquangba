const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class OrderController {
    
    //[GET]  /user/show
    ShowAllUser(req, res, next){
        Promise.all([ mydb.query(`SELECT ND_hoten, ND_sdt, ND_diachiGH, ND_chitiet FROM nguoidung WHERE ND_id='${req.query.ND_id}'`)])
            .then(([results]) => {
                res.json({
                    results: results[0],
                })
            })
            .catch((err) => {
                console.log('loi');
            })
    }


    //[UPDATE]  /update/address
    UpdateAddress(req, res, next){
        //console.log(req.body.ND_ttqhpx,req.body.ND_diachigiaohang,req.body.ND_id);
        let url;
        if(req.body.ND_diachiGH !== '' && req.body.ND_chitiet !== ''){
            url = `UPDATE nguoidung SET ND_diachiGH= '${req.body.ND_diachiGH}', ND_chitiet= '${req.body.ND_chitiet}' WHERE ND_id='${req.body.ND_id}'`;
        }else if(req.body.ND_diachiGH !== '' && req.body.ND_chitiet === ''){
            url = `UPDATE nguoidung SET ND_diachiGH= '${req.body.ND_diachiGH}' WHERE ND_id='${req.body.ND_id}'`;
        }else if(req.body.ND_diachiGH === '' && req.body.ND_chitiet !== ''){
            url = `UPDATE nguoidung SET ND_chitiet= '${req.body.ND_chitiet}' WHERE ND_id='${req.body.ND_id}'`;
        }
        Promise.all([ mydb.query(url)])
            .then(([results]) => {
                console.log('thanh cong');
                res.json({
                    update: true,
                })
            })
            .catch((err) => {
                console.log('loi');
                res.json({
                    update: false,
                })
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


    AddOrderProduct(req, res, next){
        console.log('ND_id',req.body.NB_id);
        console.log('DH_tongtien', req.body.DH_tongtien);
        console.log('TTDH_gia', req.body.TTDH_gia);
        console.log('TTDH_phantram', req.body.TTDH_phantram);
        Promise.all([ mydb.query(`INSERT INTO donhang(DH_id,ND_id, NB_id, DH_tongtien, DH_trangthai, DH_loaithanhtoan, DH_diachi, DH_phivanchuyen, DH_ngay, DH_trangthaiTT) VALUES('${req.body.DH_id}','${req.body.ND_id}', '${req.body.NB_id}', '${req.body.DH_tongtien}',1,'${req.body.DH_loaithanhtoan}','${req.body.DH_diachi}','${req.body.DH_phivanchuyen}','${req.body.DH_ngay}','${req.body.DH_trangthaiTT}')`)])
        .then(([results])=>{
            //console.log('results',results);
           for(let i=0; i< req.body.SP_id.length; i++){
                Promise.all([ mydb.query(`UPDATE thongtindonhang SET DH_id='${req.body.DH_id}', TTDH_gia='${req.body.TTDH_gia[i]}', TTDH_phantram='${req.body.TTDH_phantram[i]}' WHERE ND_id= '${req.body.ND_id}' AND NB_id='${req.body.NB_id}' AND SP_id='${req.body.SP_id[i]}' AND DH_id IS NULL ORDER by TTDH_id DESC`)])
                .then(([result])=>{
                    if(i === req.body.TTDH_gia.length-1){
                        res.send(result);
                    }
                })
                .catch((err) =>{
                    console.log('loi up');
                })
           }
        })
        .catch((err) =>{
            console.log('loi in');
        
        })
        
    }

    ShowIdSimulation(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE DH_id like '%DHSPMP%' ORDER by DH_id DESC`)])
                .then(([result])=>{
                    res.json({
                        result: result
                    })
                })
                .catch((err) =>{
                    console.log('loi up');
                })
    }
}

module.exports = new OrderController();
