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
       let url;
       if(req.query.DH_trangthai === 'all'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'waitForConfirmation'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=1 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'waitInLine'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=2 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'deliveryInProgress'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=3 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'delivered'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=4 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'cancelled'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=5 ORDER by ttdh.TTDH_id DESC`;
        }
       if(req.body.DH_trangthai === 'CancelOrder'){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.body.NB_id}'AND DH_trangthai='5' ORDER by DH_id DESC`)])
        .then(([result])=>{
            if(result[0] !== undefined){
                for(let i=0; i<result.length; i++){
                    Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong,ttdh.TTDH_gia, ttdh.TTDH_phantram, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
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
        let idOder = [];
        let result = []
        Promise.all([ mydb.query(`SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.NB_id='${req.body.NB_id}' AND ttdh.DH_id IS NOT NULL ORDER by ttdh.TTDH_id DESC`)])
            .then(([results]) =>{
                for(let t = 0; t < results.length; t++){
                    console.log(`results${t}`, results[t].DH_id);
                    if(!idOder.includes(results[t].DH_id)){
                        idOder.push(results[t].DH_id);
                    } 
                }
                console.log('idOder: ',idOder);
                for(let l = 0; l < idOder.length; l++){
                    Promise.all([ mydb.query(`SELECT * FROM donhang WHERE DH_id='${idOder[l]}' ORDER by DH_id DESC`)])
                        .then(([order])=>{
                            result.push(order[0]);
                            if(l === idOder.length-1){
                                console.log('result', result.length);
                                for(let i=0; i<result.length; i++){
                                    Promise.all([ mydb.query(`SELECT ttdh.TTDH_soluong,ttdh.TTDH_gia, ttdh.TTDH_phantram, sp.SP_ten, sp.SP_image FROM sanpham as sp, thongtindonhang as ttdh WHERE sp.SP_id = ttdh.SP_id AND DH_id='${result[i].DH_id}'`)])
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
                        })
                        .catch((err) =>{
                            res.send({
                                seller: false,
                            })
                        })
                    }  
                }
                
             )
            .catch((err) =>{
                console.log('loi TTDH');
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