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
            url = `UPDATE nguoidung SET ND_ttqhpx= '${req.body.ND_diachiGH}', ND_chitiet= '${req.body.ND_chitiet}' WHERE ND_id='${req.body.ND_id}'`;
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
        Promise.all([ mydb.query(`INSERT INTO donhang(DH_id,ND_id, NB_id, DH_tongtien, DH_trangthai, DH_loaithanhtoan, DH_diachi, DH_phivanchuyen, DH_ngay, DH_trangthaiTT) VALUES('${req.body.DH_id}','${req.body.ND_id}', '${req.body.NB_id}', '${req.body.DH_tongtien}',1,'${req.body.DH_loaithanhtoan}','${req.body.DH_diachi}','${req.body.DH_phivanchuyen}','2022-09-20','${req.body.DH_trangthaiTT}')`)])
        .then(([results])=>{
            //console.log('results',results);
            Promise.all([ mydb.query(`UPDATE thongtindonhang SET DH_id='${req.body.DH_id}' WHERE ND_id= '${req.body.ND_id}' AND NB_id='${req.body.NB_id}' AND  DH_id IS NULL`)])
            .then(([result])=>{
                res.send(result);
            })
            .catch((err) =>{
                console.log('loi up');
            })
        })
        .catch((err) =>{
            console.log('loi in');
        
        })
        
    }
}

module.exports = new OrderController();
