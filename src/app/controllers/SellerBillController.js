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

class SellerBillController {
    billShowAll(req, res, next) {
       console.log('traangthai: '+ req.body.DH_trangthai);
       if(req.body.DH_trangthai === 'CancelOrder'){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}'AND DH_trangthai='5' ORDER by DH_id DESC`)])
        .then(([result])=>{
            if(result[0] !== undefined){
                for(let i=0; i<result.length; i++){
                    Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                    .then(([num]) => {
                        result[i].soluong = num;
                            if(i === result.length-1){
                                for(let j=0; j<result.length; j++){
                                Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                .then(([use]) => {
                                    result[j].nguoidung = use;
                                    if(j === result.length-1){
                                        res.json({
                                            result: result,
                                           
                                        });                                                          
                                    }
                                })
                                .catch((err) =>{
                                    console.log('loi')
                                })
                                }
                             }
                    })
                    .catch((err) =>{
                        console.log('loi cc')
                    })
                }
            }else{
                res.json({
                    result: '',            
                });
            }
            
         })
         .catch((err) =>{
            // res.send({
            //     seller: false,
            // })
            console.log('seller');
         })
       }else if(req.body.DH_trangthai === 'Delivered'){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}'AND DH_trangthai='4' ORDER by DH_id DESC`)])
        .then(([result])=>{
            if(result[0] !== undefined){
                for(let i=0; i<result.length; i++){
                    Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                    .then(([num]) => {
                        result[i].soluong = num;
                            if(i === result.length-1){
                                for(let j=0; j<result.length; j++){
                                Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                .then(([use]) => {
                                    result[j].nguoidung = use;
                                    if(j === result.length-1){
                                    res.json({
                                        result: result,
                                        
                                    });
                                    }
                                })
                                .catch((err) =>{
                                    console.log('loi')
                                })
                                }
                             }
                    })
                    .catch((err) =>{
                        console.log('loi cc')
                    })
                }
            }else{
                res.json({
                    result: '',
                    
                });
            }
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
       }else if(req.body.DH_trangthai === 'Transport'){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}'AND DH_trangthai='3' ORDER by DH_id DESC`)])
        .then(([result])=>{
            if(result[0] !== undefined){
                for(let i=0; i<result.length; i++){
                    Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                    .then(([num]) => {
                        result[i].soluong = num;
                            if(i === result.length-1){
                                for(let j=0; j<result.length; j++){
                                Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                .then(([use]) => {
                                    result[j].nguoidung = use;
                                    if(j === result.length-1){
                                    res.json({
                                        result: result,
                                        
                                    });
                                    }
                                })
                                .catch((err) =>{
                                    console.log('loi')
                                })
                                }
                             }
                    })
                    .catch((err) =>{
                        console.log('loi cc')
                    })
                }
            }else{
                res.json({
                    result: '',
                    
                });
            }
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
       }else if(req.body.DH_trangthai === 'WaitConfirm'){
           Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}'AND DH_trangthai='1' ORDER by DH_id DESC`)])
           .then(([result])=>{
                if(result[0] !== undefined){
                    for(let i=0; i<result.length; i++){
                        Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                            .then(([num]) => {
                                result[i].soluong = num;
                                    if(i === result.length-1){
                                        for(let j=0; j<result.length; j++){
                                        Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                        .then(([use]) => {
                                            result[j].nguoidung = use;
                                            if(j === result.length-1){
                                                res.json({
                                                    result: result,                                         
                                                });
                                            }
                                        })
                                        .catch((err) =>{
                                            console.log('loi')
                                        })
                                        }
                                    }
                            })
                            .catch((err) =>{
                                console.log('loi cc')
                            })
                    }
                }else{
                    res.json({
                        result: '',                                         
                    });
                }
           })
           .catch((err) =>{
              res.send({
                  seller: false,
              })
           })
       }else if(req.body.DH_trangthai === 'Confirmed'){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}'AND DH_trangthai='2' ORDER by DH_id DESC`)])
        .then(([result])=>{
             if(result[0] !== undefined){
                 for(let i=0; i<result.length; i++){
                     Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                         .then(([num]) => {
                             result[i].soluong = num;
                                 if(i === result.length-1){
                                     for(let j=0; j<result.length; j++){
                                     Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                     .then(([use]) => {
                                         result[j].nguoidung = use;
                                         if(j === result.length-1){
                                             res.json({
                                                 result: result,                                         
                                             });
                                         }
                                     })
                                     .catch((err) =>{
                                         console.log('loi')
                                     })
                                     }
                                 }
                         })
                         .catch((err) =>{
                             console.log('loi cc')
                         })
                 }
             }else{
                 res.json({
                     result: '',                                         
                 });
             }
        })
        .catch((err) =>{
           res.send({
               seller: false,
           })
        })
    }else{
            Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}' ORDER by DH_id DESC`)])
            .then(([result])=>{
                if(result[0] !== undefined){
                    for(let i=0; i<result.length; i++){
                        Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                        .then(([num]) => {
                            result[i].soluong = num;
                                if(i === result.length-1){
                                    for(let j=0; j<result.length; j++){
                                    Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                    .then(([use]) => {
                                        result[j].nguoidung = use;
                                        if(j === result.length-1){
                                            res.json({
                                                result: result,                                         
                                            });
                                        }
                                    })
                                    .catch((err) =>{
                                        console.log('loi')
                                    })
                                    }
                                 }
                        })
                        .catch((err) =>{
                            console.log('loi cc')
                        })
                    }
                }else{
                    res.json({
                        result: '',                                         
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

    ShowNumberBill(req, res, next){
        Promise.all([ mydb.query(`SELECT count(DH_id) as statusconfirm FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='1'`)])
        .then(([statusconfirm])=>{
            Promise.all([ mydb.query(`SELECT count(DH_id) as statusconfirmed FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='2'`)])
            .then(([statusconfirmed])=>{
                Promise.all([ mydb.query(`SELECT count(DH_id) as statustransport FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='3'`)])
                    .then(([statustransport])=>{
                        Promise.all([ mydb.query(`SELECT count(DH_id) as statusdelivered FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='4'`)])
                        .then(([statusdelivered])=>{
                            Promise.all([ mydb.query(`SELECT count(DH_id) as statuscancelOrder FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='5'`)])
                                .then(([statuscancelOrder])=>{
                                    Promise.all([ mydb.query(`SELECT count(DH_id) as number FROM donhang WHERE NB_id='${req.query.NB_id}'`)])
                                    .then(([number])=>{
                                        res.json({
                                            statusconfirm: statusconfirm,
                                            statusconfirmed: statusconfirmed,
                                            statustransport: statustransport,
                                            statusdelivered: statusdelivered,
                                            statuscancelOrder: statuscancelOrder,
                                            number: number
                                        });
                                    })
                                })
                        })
                    })
            })
            .catch((err)=>{
                res.json({
                    statusconfirmed: '',
                })
            })
            
        })
    }

    billSearchId(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_id='${req.query.DH_id}'`)])
            .then(([result])=>{
                console.log(result[0]);
                if(result[0] !== undefined){
                    for(let i=0; i<result.length; i++){
                        Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
                        .then(([num]) => {
                            result[i].soluong = num;
                                if(i === result.length-1){
                                    for(let j=0; j<result.length; j++){
                                        Promise.all([mydb.query(`SELECT nd.ND_hoten, nd.ND_image FROM donhang as dh, nguoidung as nd WHERE dh.ND_id = nd.ND_id AND dh.DH_id='${result[j].DH_id}'`)])
                                        .then(([use]) => {
                                            result[j].nguoidung = use;
                                            if(j === result.length-1){
                                                res.json({
                                                    result: result,
                                                });
                                            }
                                        })
                                        .catch((err) =>{
                                            console.log('loi')
                                        })
                                    }
                                }
                        })
                        .catch((err) =>{
                            console.log('loi cc')
                        })
                    }
            }
            else{
                res.json({
                    result: result, 
                });
            }
            })
            .catch((err) =>{
                res.send({
                    result: false,
                })
            })
       }
}

module.exports = new SellerBillController();