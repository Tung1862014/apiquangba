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
        Promise.all([ mydb.query(`SELECT ND_hoten, ND_sdt, ND_diachigiaohang, ND_ttqhpx FROM nguoidung WHERE ND_id='${req.query.ND_id}'`)])
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
        console.log(req.body.ND_ttqhpx,req.body.ND_diachigiaohang,req.body.ND_id);
        let url;
        if(req.body.ND_ttqhpx !== '' && req.body.ND_diachigiaohang !== ''){
            url = `UPDATE nguoidung SET ND_ttqhpx= '${req.body.ND_ttqhpx}', ND_diachigiaohang= '${req.body.ND_diachigiaohang}' WHERE ND_id='${req.body.ND_id}'`;
        }else if(req.body.ND_ttqhpx !== '' && req.body.ND_diachigiaohang === ''){
            url = `UPDATE nguoidung SET ND_ttqhpx= '${req.body.ND_ttqhpx}' WHERE ND_id='${req.body.ND_id}'`;
        }else if(req.body.ND_ttqhpx === '' && req.body.ND_diachigiaohang !== ''){
            url = `UPDATE nguoidung SET ND_diachigiaohang= '${req.body.ND_diachigiaohang}' WHERE ND_id='${req.body.ND_id}'`;
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
}

module.exports = new AdminController();
