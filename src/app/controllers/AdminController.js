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

    //[GET]  /show/account
    ShowAccount(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM nguoidung WHERE ND_id='${req.query.ND_id}' AND ND_quyen=0`)])
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
