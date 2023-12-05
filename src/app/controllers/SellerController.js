const Customer = require('../models/Customer');
const uploadDir = require('../../uploads');
const fs = require("fs");
// const {
//     multipleMongooseToObject,
//     mongooseToObject,
// } = require('../../util/mongoose');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');
const  md5 = require('md5');

let mydb = new Database(dbConn);

class SellerController {

    insert(req, res, next) {
        console.log('image: '+ JSON.stringify(req.files))
        const formData = req.body;
        console.log(req.body.ND_username);
        let testUserName = '';
         Promise.all([mydb.query(`SELECT * FROM nguoidung WHERE ND_username='${formData.ND_username}' AND ND_quyen=1`)])
         .then(([results]) => {
            console.log(results[0]);
            if(results[0] !== undefined) {
                res.json(
                    {
                        ND_username: false,
                    }
                )
            }else {
                if(req.files){
                    let paths ='';
                     res.json(req.files)
                    const arr =  req.files;
                    arr.forEach(function(e, index, arr){
                       paths = paths + process.env.URL_IMAGE_CUSTOMER+ e.filename +',';
                    })
                    paths = paths.substring(0, paths.lastIndexOf(','));
                    formData.image = paths;
                    
                 }else{
                    console.log('loi image')
                }
                Promise.all([mydb.query(`INSERT INTO nguoidung( ND_hoten, ND_username, ND_password, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_sdt, ND_quyen) VALUES (
                    '${formData.ND_hoten}','${formData.ND_username}','${formData.ND_password}','${formData.image}','${formData.ND_email}','${formData.ND_diachi}','${formData.ND_ngay}','${formData.ND_sdt}','1'
                    )`)])
                    .then(([results]) => {
                        Promise.all([mydb.query(`SELECT MAX(ND_id) as num FROM nguoidung`)])
                        .then(([num]) => {
                            console.log('num: ', num);
                            Promise.all([mydb.query(`INSERT INTO chugianhang(NB_id, ND_id) VALUES ('${num[0].num}', '${num[0].num}')`)])
                            .then(([result]) => {
                                console.log('success');
                            })
                            .catch((err) => {
                                console.log('loi num');
                            });
                        })
                        .catch((err) => {
                            console.log('loi max');
                        });
                    })
                    .catch((err) => {
                        console.log('loi nheeee');
                    })     
            }
         })
         .catch((err) => {
             res.send('Loi khong tim user')
         })   
    }

    //POST LOGIN
    login(req, res, next){
        console.log(req.body.userName)
        Promise.all([mydb.query(`SELECT * FROM nguoiban WHERE NB_email='${req.body.userName}'`) ])
        .then(([result]) =>{
            if(result){
                //let user = result[0];
                res.json({result: result[0]})
            }else{
                res.json({tt:'Tài khoản không tồn tại'})
            } 
        }
        )
            .catch(err => res.json({tt:'Tài khoản không tồn tại sss'}))
    }

    //
    statisticalShowAll(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.query.NB_id}' ORDER by DH_id DESC`)])
            .then(([result])=>{
                Promise.all([ mydb.query(`SELECT count(DH_id) as statusconfirm FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='1'`)])
                .then(([statusconfirm])=>{
                    Promise.all([ mydb.query(`SELECT count(DH_id) as statusdelivered FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='4'`)])
                        .then(([statusdelivered])=>{
                            Promise.all([ mydb.query(`SELECT count(DH_id) as statuscancelOrder FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_trangthai='5'`)])
                                .then(([statuscancelOrder])=>{
                                    Promise.all([ mydb.query(`SELECT count(SP_id) as statusoutOfStock FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_trangthai='0'`)])
                                        .then(([statusoutOfStock])=>{
                                            Promise.all([ mydb.query(`SELECT count(DH_id) as number FROM donhang WHERE NB_id='${req.query.NB_id}'`)])
                                            .then(([number])=>{
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
                                                                        statusconfirm: statusconfirm,
                                                                        statusdelivered: statusdelivered,
                                                                        statuscancelOrder: statuscancelOrder,
                                                                        statusoutOfStock: statusoutOfStock,
                                                                        number: number
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
                                            })
                                        })
                                })
                        })
                })
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
    }

     //[GET]  /show/account
     ShowAccount(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM nguoidung WHERE ND_id='${req.query.ND_id}' AND ND_quyen=1`)])
            .then(([result]) => {
                res.json({
                    result: result[0],
                })
            })
            .catch((err) => {
                console.log('loi');
            })
    }

    //[PUT] /update/account
    UpdateAccountNoImage(req, res, next){
        console.log('hoten', req.body.ND_hoten);
        let url;
        if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else  if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email == '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_email='${req.body.ND_email}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}',ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}',ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}',ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}', ND_diachi='${req.body.ND_diachi}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
            url = `UPDATE nguoidung SET ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
        }
        Promise.all([ mydb.query(url)])
            .then(([results]) => {
                res.send(results);
            })
            .catch((err) => {
                console.log('loi');
            })   
    }

    UpdateAccountImage(req, res, next){
        console.log('hoten', req.body.ND_email);
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_CUSTOMER+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.ND_image = paths;
            let url; 
            if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else  if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email == '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_email='${req.body.ND_email}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}',ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}',ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}',ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}', ND_diachi='${req.body.ND_diachi}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}',ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi === '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email === '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password ==='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten !== '' && req.body.ND_password !=='' && req.body.ND_email !== '' && req.body.ND_diachi !== '' && req.body.ND_sdt !== ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}', ND_hoten='${req.body.ND_hoten}', ND_password='${req.body.ND_password}', ND_email='${req.body.ND_email}', ND_diachi='${req.body.ND_diachi}', ND_sdt='${req.body.ND_sdt}' WHERE ND_id = '${req.body.ND_id}'`;
            }else if(req.body.ND_hoten === '' && req.body.ND_password ==='' && req.body.ND_email === '' && req.body.ND_diachi === '' && req.body.ND_sdt === ''){
                url = `UPDATE nguoidung SET ND_image='${req.body.ND_image}' WHERE ND_id = '${req.body.ND_id}'`;
            }
            Promise.all([ mydb.query(url)])
                .then(([results]) => {
                    res.send(results);
                })
                .catch((err) => {
                    console.log('loi');
                })   
        }
    }
}

module.exports = new SellerController();
