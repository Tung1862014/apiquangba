const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class AdminController {

    //[POST]  /login
    loginAdmin(req, res, next){
        console.log(req.body.ND_username, req.body.ND_password);
        Promise.all([mydb.query(`SELECT ND_id, ND_hoten, ND_password, ND_image, ND_email, ND_diachi, ND_sdt, ND_ngay FROM nguoidung WHERE ND_username='${req.body.ND_username}' AND ND_quyen=0`) ])
        .then(([ result]) =>{
            if(result[0] !== undefined){
                //let user = result[0];
                if(result[0].ND_password ===  req.body.ND_password){
                    Promise.all([mydb.query(`SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_sdt, ND_ngay FROM nguoidung WHERE ND_username='${req.body.ND_username}' AND ND_quyen=0`) ])
                        .then(([account]) => {
                            res.json({
                                result: account[0],
                            })
                        })
                        .catch((err) => {
                            res.json({
                                err: true,
                                result: account[0],
                            })
                        })
                }else{

                    res.json({
                        password: false,
                        account: true,
                    })
                }
            }else{
                res.json({account: false})
            } 
        }
        )
            .catch(err => res.json({tt:'Tài khoản không tồn tại sss'}))
    }
    
    //[GET]  /user/show
    ShowAllUser(req, res, next){
        // console.log(req.query.ND_trangthai);
        let url;
        if(req.query.ND_trangthai === 'trangthaiaction'){
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=1 ORDER by ND_id DESC`;
        }else if(req.query.ND_trangthai === 'trangthaihanche'){
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=0 ORDER by ND_id DESC`;
        }else{
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_quyen=2 ORDER by ND_id DESC`;
        }
        Promise.all([ mydb.query(url)])
            .then(([results]) => {
                Promise.all([ mydb.query(`SELECT count(ND_id) as actions FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=1`)])
                    .then(([actions]) => {
                        Promise.all([ mydb.query(`SELECT count(ND_id) as limits FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=0`)])
                        .then(([limits]) => {
                            res.json({
                                results: results,
                                actions: actions[0].actions,
                                limits: limits[0].limits,
                            })
                        })
                        .catch((err) => {
                            console.log('loi nha nhe');
                        })
                    })
                    .catch((err) => {
                        console.log('loi nha');
                    })
            })
            .catch((err) => {
                console.log('loi');
            })
    }


    //[PUT]  /update/status/customer
    UpdateStatusCustomer(req, res, next) {
        Promise.all([ mydb.query(`SELECT ND_trangthai FROM nguoidung WHERE ND_id = '${req.body.ND_id}' AND ND_quyen=2 `)])
            .then(([result]) => {
               if(result[0].ND_trangthai === 1) {
                    Promise.all([ mydb.query(`UPDATE nguoidung SET ND_trangthai=0 WHERE ND_id='${req.body.ND_id}' `)])
                        .then(([status]) => {
                            res.send(status);
                        })
                        .catch((err) => {
                            console.log('loi nha');
                        })
               }else{
                    Promise.all([ mydb.query(`UPDATE nguoidung SET ND_trangthai=1 WHERE ND_id='${req.body.ND_id}'  `)])
                        .then(([status]) => {
                            res.send(status);
                        })
                        .catch((err) => {
                            console.log('loi nhe');
                        })
               }
            })
            .catch((err) => {
                console.log('loi');
            })
        
    }

    SearchCustomer(req, res, next) {
        Promise.all([ mydb.query(`SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_hoten LIKE '%${req.query.name}%' AND ND_quyen=2 ORDER by ND_id DESC`)])
        .then(([results]) => {
            Promise.all([ mydb.query(`SELECT count(ND_id) as actions FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=1`)])
                .then(([actions]) => {
                    Promise.all([ mydb.query(`SELECT count(ND_id) as limits FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=0`)])
                    .then(([limits]) => {
                        res.json({
                            results: results,
                            actions: actions[0].actions,
                            limits: limits[0].limits,
                        })
                    })
                    .catch((err) => {
                        console.log('loi nha nhe');
                    })
                })
                .catch((err) => {
                    console.log('loi nha');
                })
        })
        .catch((err) => {
            console.log('loi');
        })
    }

    //[GET]  /show/all/seller
    ShowAllSeller(req, res, next){
        // console.log(req.query.ND_trangthai);
        let url;
        if(req.query.ND_trangthai === 'trangthaiaction'){
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=1 ORDER by ND_id DESC`;
        }else if(req.query.ND_trangthai === 'trangthaihanche'){
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=0 ORDER by ND_id DESC`;
        }else{
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_quyen=1 ORDER by ND_id DESC`;
        }
        Promise.all([ mydb.query(url)])
            .then(([results]) => {
                Promise.all([ mydb.query(`SELECT count(ND_id) as actions FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=1`)])
                    .then(([actions]) => {
                        Promise.all([ mydb.query(`SELECT count(ND_id) as limits FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=0`)])
                        .then(([limits]) => {
                            res.json({
                                results: results,
                                actions: actions[0].actions,
                                limits: limits[0].limits,
                            })
                        })
                        .catch((err) => {
                            console.log('loi nha nhe');
                        })
                    })
                    .catch((err) => {
                        console.log('loi nha');
                    })
            })
            .catch((err) => {
                console.log('loi');
            })
    }


    //[PUT]  /update/status/customer
    UpdateStatusSeller(req, res, next) {
        Promise.all([ mydb.query(`SELECT ND_trangthai FROM nguoidung WHERE ND_id = '${req.body.ND_id}' AND ND_quyen=1 `)])
            .then(([result]) => {
               if(result[0].ND_trangthai === 1) {
                    Promise.all([ mydb.query(`UPDATE nguoidung SET ND_trangthai=0 WHERE ND_id='${req.body.ND_id}' `)])
                        .then(([status]) => {
                            res.send(status);
                        })
                        .catch((err) => {
                            console.log('loi nha');
                        })
               }else{
                    Promise.all([ mydb.query(`UPDATE nguoidung SET ND_trangthai=1 WHERE ND_id='${req.body.ND_id}'  `)])
                        .then(([status]) => {
                            res.send(status);
                        })
                        .catch((err) => {
                            console.log('loi nhe');
                        })
               }
            })
            .catch((err) => {
                console.log('loi');
            })
        
    }

    SearchSeller(req, res, next) {
        Promise.all([ mydb.query(`SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngay, ND_trangthai FROM nguoidung WHERE ND_hoten LIKE '%${req.query.name}%' AND ND_quyen=1 ORDER by ND_id DESC`)])
        .then(([results]) => {
            Promise.all([ mydb.query(`SELECT count(ND_id) as actions FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=1`)])
                .then(([actions]) => {
                    Promise.all([ mydb.query(`SELECT count(ND_id) as limits FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=0`)])
                    .then(([limits]) => {
                        res.json({
                            results: results,
                            actions: actions[0].actions,
                            limits: limits[0].limits,
                        })
                    })
                    .catch((err) => {
                        console.log('loi nha nhe');
                    })
                })
                .catch((err) => {
                    console.log('loi nha');
                })
        })
        .catch((err) => {
            console.log('loi');
        })
    }
    
}

module.exports = new AdminController();
