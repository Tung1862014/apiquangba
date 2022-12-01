const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class OrderController {
    
    //[GET]  /user/show
    ShowAllUser(req, res, next){
        Promise.all([ mydb.query(`SELECT nd.ND_hoten, nd.ND_sdt, kh.DC_diachiGH, kh.DC_chitiet FROM nguoidung as nd, diachigiaohang as kh WHERE nd.ND_id=kh.ND_id AND nd.ND_id='${req.query.ND_id}'`)])
            .then(([results]) => {
                if(results[0] !== undefined){
                    res.json({
                        results: results[0],
                    })
                }else{
                    res.json({
                        results: '',
                    })
                }
                console.log('results', results);
            })
            .catch((err) => {
                console.log('loi');
            })
    }


    //[UPDATE]  /update/address
    UpdateAddress(req, res, next){
        console.log(req.body.ND_id,req.body.DC_diachiGH,req.body.DC_chitiet);
        Promise.all([ mydb.query(`SELECT * FROM diachigiaohang WHERE ND_id='${req.body.ND_id}'`)])
        .then(([results]) => {
            if(results.length > 0){
                let url;
                if(req.body.DC_diachiGH !== '' && req.body.DC_chitiet !== ''){
                    url = `UPDATE diachigiaohang SET DC_diachiGH= '${req.body.DC_diachiGH}', DC_chitiet= '${req.body.DC_chitiet}' WHERE ND_id='${req.body.ND_id}'`;
                }else if(req.body.DC_diachiGH !== '' && req.body.DC_chitiet === ''){
                    url = `UPDATE diachigiaohang SET DC_diachiGH= '${req.body.DC_diachiGH}' WHERE ND_id='${req.body.ND_id}'`;
                }else if(req.body.DC_diachiGH === '' && req.body.DC_chitiet !== ''){
                    url = `UPDATE diachigiaohang SET DC_chitiet= '${req.body.DC_chitiet}' WHERE ND_id='${req.body.ND_id}'`;
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
            }else{
                Promise.all([ mydb.query(`INSERT INTO diachigiaohang(ND_id, DC_diachiGH, DC_chitiet) VALUES ('${req.body.ND_id}','${req.body.DC_diachiGH}', '${req.body.DC_chitiet}')`)])
                    .then(([results])=>{
                        res.json({
                            update: true,
                        })
                    })
                    .catch((err) =>{
                        console.log('loi');
                        res.json({
                            update: false,
                        })
                    }) 
            }
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
        // console.log('DH_id',req.body.DH_id);
        // console.log('ND_id',req.body.NB_id);
        // console.log('DH_tongtien',req.body.DH_tongtien);
        // console.log('DH_diachi',req.body.DH_diachi);
        // console.log('DH_phivanchuyen',req.body.DH_phivanchuyen);
        // console.log('DH_ngay',req.body.DH_ngay);
        // console.log('DH_ghichu',req.body.DH_ghichu);
        // console.log('DH_tongtien', req.body.DH_tongtien);
        // console.log('TTDH_gia', req.body.TTDH_gia);
        // console.log('TTDH_phantram', req.body.TTDH_phantram);
        Promise.all([ mydb.query(`INSERT INTO donhang(DH_id,ND_id, NB_id, DH_tongtien, DH_trangthai, DH_loaithanhtoan, DH_diachi, DH_phivanchuyen, DH_ngay, DH_trangthaiTT, DH_ghichu, DH_ghichuhuy) VALUES('${req.body.DH_id}','${req.body.ND_id}', '${req.body.NB_id}', '${req.body.DH_tongtien}',1,'${req.body.DH_loaithanhtoan}','${req.body.DH_diachi}','${req.body.DH_phivanchuyen}','${req.body.DH_ngay}','${req.body.DH_trangthaiTT}','${req.body.DH_ghichu}','${''}')`)])
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

        for(let i=0; i< req.body.SP_id.length; i++){
            Promise.all([ mydb.query(`DELETE FROM giohang WHERE ND_id= '${req.body.ND_id}' AND SP_id='${req.body.SP_id[i]}'`)])
            .then(([result])=>{
                    
            })
            .catch((err) =>{
                    
            })
        }
        
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
