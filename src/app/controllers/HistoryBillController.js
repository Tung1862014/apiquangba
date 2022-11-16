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
        let url;
        if(req.query.keyword !== ''){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND ttdh.DH_id IS NOT NULL AND dh.DH_id='${req.query.keyword}' ORDER by ttdh.TTDH_id DESC`;
        }else{
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
        }
        
        Promise.all([ mydb.query(url)])
        .then(([results])=>{
            if(results.length > 0){
                for(let i=0; i<results.length; i++){
                    Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id='${results[i].SP_id}'`)])
                        .then(([product]) => {
                            results[i].product = product[0];
                            if(i === results.length-1){
                                for(let j=0; j<results.length; j++){
                                    Promise.all([ mydb.query(`SELECT mts.MTS_id, mts.MTS_chitiet, mts.MTS_diachi, mts.MTS_id, mts.MTS_image, mts.MTS_logo, mts.MTS_ten, nd.ND_sdt FROM motashop as mts, nguoidung as nd WHERE mts.NB_id = nd.ND_id AND mts.NB_id='${results[j].NB_id}'`)])
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

    //[GET] /show/evaluate
    ShowBillEvaluate(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE ND_id='${req.query.ND_id}'`)])
            .then(([result]) => {
                res.json({
                    result: result,
                })
            })
            .catch((err) => {
                console.log('loi evaluate');
            })
    }

    //[POST] /evaluate/star/text
    EvaluateStar(req, res, next){
        console.log(req.body.ND_id,req.body.DH_id,req.body.SP_id,req.body.DG_sosao,req.body.DG_mota);
        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id='${req.body.SP_id}'`)])
            .then(([result]) => {
                console.log('result',result[0].NB_id);
                if(result[0] !== undefined){
                    Promise.all([mydb.query(`INSERT INTO danhgia(DH_id, SP_id, NB_id, ND_id, DG_sosao, DG_mota, DG_ngayDG) VALUES('${req.body.DH_id}','${req.body.SP_id}','${result[0].NB_id}','${req.body.ND_id}','${req.body.DG_sosao}','${req.body.DG_mota}','${req.body.DG_ngayDG}')`)])
                    .then(([results]) => {
                        res.json({
                            results: results,
                        })
                    })
                    .catch((err) => {
                        console.log('loi insert');
                    })
                }
            })             
            .catch((err) => {
                console.log('loi ND');
            })
    }

    //[POST] /evaluate/update/star/text
    EvaluateStarUpdate(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id='${req.body.SP_id}'`)])
        .then(([result]) => {
            Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE DH_id='${req.body.DH_id}' AND SP_id='${req.body.SP_id}' AND NB_id='${result[0].NB_id}' AND ND_id='${req.body.ND_id}'`)])
                .then(([evaluate]) => {
                    console.log('evaluate',evaluate);
                    Promise.all([ mydb.query(`UPDATE danhgia SET DG_sosao='${req.body.DG_sosao}', DG_mota='${req.body.DG_mota}', DG_ngayCN='${req.body.DG_ngayDG}'  WHERE DH_id='${req.body.DH_id}' AND SP_id='${req.body.SP_id}' AND NB_id='${result[0].NB_id}' AND ND_id='${req.body.ND_id}'`)])
                    .then(([evaluateupdate]) =>{
                        res.json({
                            result: evaluateupdate,
                        })
                    })
                    .catch((err) => {
                        console.log('loi update');
                    })     
                })
                .catch((err) => {
                    console.log('loi danh gia');
                })
        })
        .catch((err) => {
            console.log('loi ND');
        })
    }

    //[PUT] /update/status/bill
    CancelBill(req, res, next){
        console.log('bill', req.body.DH_id);
        Promise.all([ mydb.query(`UPDATE donhang SET DH_trangthai = 5, DH_ghichuhuy='${req.body.DH_ghichuhuy}' WHERE DH_id='${req.body.DH_id}'`)])
            .then(([result]) =>{
                res.json({
                    result: result,
                })
            })
            .catch((err) => {
                res.json({
                    result: false,
                })
            })
    }

    //[UPDATE]  /update/auto/bill
    UpdateAutoBill(req, res, next){
        console.log(req.body.TTDH_id, req.body.TTDH_soluong);
        Promise.all([ mydb.query(`UPDATE donhang SET DH_trangthai='${req.body.DH_trangthai}' WHERE DH_id='${req.body.DH_id}'`)])
            .then((result) => {
                console.log('successfully');
                res.send(result);
            })
            .catch((err) => {
                console.log('field');
                res.send(result);
            })
    }

    //[GET] /search/show/all/bill
    SearchShowAllBill(req, res, next){
        let url;
        if(req.query.DH_trangthai === 'all'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND dh.DH_id='${req.query.search}' AND ttdh.DH_id IS NOT NULL ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'waitForConfirmation'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND dh.DH_id='${req.query.search}'  AND ttdh.DH_id IS NOT NULL AND DH_trangthai=1 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'waitInLine'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND dh.DH_id='${req.query.search}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=2 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'deliveryInProgress'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND dh.DH_id='${req.query.search}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=3 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'delivered'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND dh.DH_id='${req.query.search}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=4 ORDER by ttdh.TTDH_id DESC`;
        }else if(req.query.DH_trangthai === 'cancelled'){
            url = `SELECT * FROM thongtindonhang as ttdh, donhang as dh WHERE ttdh.DH_id = dh.DH_id AND ttdh.ND_id='${req.query.ND_id}' AND dh.DH_id='${req.query.search}' AND ttdh.DH_id IS NOT NULL AND DH_trangthai=5 ORDER by ttdh.TTDH_id DESC`;
        }
        Promise.all([ mydb.query(url)])
        .then(([results])=>{
            for(let i=0; i<results.length; i++){
                Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id='${results[i].SP_id}'`)])
                    .then(([product]) => {
                        results[i].product = product[0];
                        if(i === results.length-1){
                            for(let j=0; j<results.length; j++){
                                Promise.all([ mydb.query(`SELECT mts.MTS_id, mts.MTS_chitiet, mts.MTS_diachi, mts.MTS_id, mts.MTS_image, mts.MTS_logo, mts.MTS_ten, nd.ND_sdt FROM motashop as mts, nguoidung as nd WHERE mts.NB_id = nd.ND_id AND mts.NB_id='${results[j].NB_id}'`)])
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

    // //[delete]  delete/product
    // DeleteProduct(req, res, next){
    //     console.log(req.body.TTDH_id);
    //     Promise.all([ mydb.query(`DELETE FROM thongtindonhang WHERE TTDH_id=${req.body.TTDH_id}`)])
    //         .then(([results])=>{
    //             res.send(results);
    //         })
    //         .catch((err) =>{
    //             console.log('loi');
    //             res.send(results);
    //         })
       
    // }
}

module.exports = new HistoryBillController();
