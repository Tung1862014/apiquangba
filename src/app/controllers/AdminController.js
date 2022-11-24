const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class AdminController {

    //[POST]  /login
    loginAdmin(req, res, next){
        console.log(req.body.ND_username, req.body.ND_password);
        Promise.all([mydb.query(`SELECT ND_id, ND_hoten, ND_password, ND_image, ND_email, ND_diachi, ND_sdt, ND_ngayDK FROM nguoidung WHERE ND_username='${req.body.ND_username}' AND ND_quyen=0`) ])
        .then(([ result]) =>{
            if(result[0] !== undefined){
                //let user = result[0];
                if(result[0].ND_password ===  req.body.ND_password){
                    Promise.all([mydb.query(`SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_sdt, ND_ngayDK FROM nguoidung WHERE ND_username='${req.body.ND_username}' AND ND_quyen=0`) ])
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
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai, ND_ghichu FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=1 ORDER by ND_id DESC`;
        }else if(req.query.ND_trangthai === 'trangthaihanche'){
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai, ND_ghichu FROM nguoidung WHERE ND_quyen=2 AND ND_trangthai=0 ORDER by ND_id DESC`;
        }else{
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai, ND_ghichu FROM nguoidung WHERE ND_quyen=2 ORDER by ND_id DESC`;
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

    //UpdateNote
    UpdateNoteCustomer(req, res, next){
        console.log('id', req.body.ND_id);
        console.log('ghi chu', req.body.ND_ghichu);
        Promise.all([ mydb.query(`UPDATE nguoidung SET ND_ghichu='${req.body.ND_ghichu}' WHERE ND_id='${req.body.ND_id}'  `)])
            .then(([notes]) => {
                res.json({
                    update: true,
                })
            })
            .catch((err) => {
                res.json({
                    update: false,
                })
            })
    } 

    SearchCustomer(req, res, next) {
        Promise.all([ mydb.query(`SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai FROM nguoidung WHERE ND_hoten LIKE '%${req.query.name}%' AND ND_quyen=2 ORDER by ND_id DESC`)])
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
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai, ND_ghichu FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=1 ORDER by ND_id DESC`;
        }else if(req.query.ND_trangthai === 'trangthaihanche'){
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai, ND_ghichu FROM nguoidung WHERE ND_quyen=1 AND ND_trangthai=0 ORDER by ND_id DESC`;
        }else{
            url = `SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai, ND_ghichu FROM nguoidung WHERE ND_quyen=1 ORDER by ND_id DESC`;
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
        Promise.all([ mydb.query(`SELECT ND_id, ND_hoten, ND_image, ND_email, ND_diachi, ND_ngayDK, ND_trangthai FROM nguoidung WHERE ND_hoten LIKE '%${req.query.name}%' AND ND_quyen=1 ORDER by ND_id DESC`)])
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

    //[GET] /show/advertise
    ShowAdvertise(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM quangba ORDER by QB_id DESC`)])
            .then(([advertise]) => {
                Promise.all([ mydb.query(`SELECT count(QB_id) as numbers FROM quangba`)])
                    .then(([numbers]) => {
                        res.json({
                            advertise: advertise,
                            numbers: numbers[0],
                        })
                    })
                    .catch((err) => {
                        console.log('loi nha nhe');
                    })
            })
            .catch((err) => {
                console.log('loi nha nhe');
            })
    }

    //[]
    DeleteAdvertise(req, res, next){
        Promise.all([ mydb.query(`DELETE FROM quangba WHERE QB_id='${req.body.QB_id}'`)])
            .then(([advertise]) => {
                res.json({
                    advertise: true,
                })
            })
            .catch((err) => {
                console.log('loi nha nhe');
                res.json({
                    advertise: false,
                })
            })
    }
    AddAdvertise(req, res, next){

        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_ADVERTIES+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.QB_image = paths;
            Promise.all([ mydb.query(`INSERT INTO quangba (QB_tieude,QB_mota,QB_image) VALUES ('${req.body.QB_tieude}', '${req.body.QB_mota}', '${req.body.QB_image}')`)])
            .then(([advertise]) => {
                res.json({
                    advertise: true,
                })
            })
            .catch((err) => {
                console.log('loi nha nhe');
                res.json({
                    advertise: false,
                })
            })
        }
        
    }

    ShowAllAdverties(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM quangba WHERE QB_id='${req.query.QB_id}'`)])
        .then(([advertise]) => {
            res.json({
                advertise: advertise,
            })
        })
        .catch((err) => {
            console.log('loi nha nhe');
            res.json({
                advertise: null,
            })
        })
    }

    //[PUT] /update/advertise/image
    UpdateAdvertiseImage(req, res, next){
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_ADVERTIES+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.QB_image = paths;
            Promise.all([ mydb.query(`UPDATE quangba SET QB_tieude='${req.body.QB_tieude}', QB_mota='${req.body.QB_mota}', QB_image='${req.body.QB_image}' WHERE QB_id='${req.body.QB_id}'`)])
            .then(([advertise]) => {
                res.json({
                    update: true,
                })
            })
            .catch((err) => {
                console.log('loi nha nhe');
                res.json({
                    update: false,
                })
            })
        }
    }

    //[PUT] /update/advertise
    UpdateAdvertiseNoImage(req, res, next){
        console.log('QB_id', req.body.QB_id);
        Promise.all([ mydb.query(`UPDATE quangba SET QB_tieude='${req.body.QB_tieude}', QB_mota='${req.body.QB_mota}' WHERE QB_id='${req.body.QB_id}'`)])
        .then(([advertise]) => {
            res.json({
                update: true,
            })
        })
        .catch((err) => {
            console.log('loi nha nhe');
            res.json({
                update: false,
            })
        })
    }


    ShowLinkAdvertise(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM link WHERE QB_id = '${req.query.QB_id}'`)])
            .then(([result]) => {
                res.json({
                    result: result,
                })
            })
            .catch((err) => {
                console.log('loi nha nhe');
            })
    }

    AddLinkAdvertise(req, res, next){
        Promise.all([ mydb.query(`INSERT INTO link(QB_id, LI_tieude, LI_link) VALUES ('${req.body.QB_id}', '${req.body.LI_tieude}', '${req.body.LI_link}')`)])
            .then(([result])=>{
                res.json({
                    linkAdd: true,
                });
            })
            .catch((err) =>{
                res.json({
                    linkAdd: false,
                });
        })
    }

    UpdateLinkAdvertise(req, res, next){
        Promise.all([ mydb.query(`UPDATE link SET LI_tieude='${req.body.LI_tieude}', LI_link='${req.body.LI_link}'  WHERE LI_id = '${req.body.LI_id}'`)])
            .then(([result])=>{
                res.json({
                    linkUpdate: true,
                });
            })
            .catch((err) =>{
                res.json({
                    linkUpdate: false,
                });
            })
    }

    DeleteLinkAdvertise(req, res, next){
        Promise.all([ mydb.query(`DELETE FROM link WHERE LI_id = '${req.body.LI_id}'`)])
            .then(([result])=>{
                res.json({
                    linkDelete: true,
                });
            })
            .catch((err) =>{
                res.json({
                    linkDelete: false,
                });
            })
    }
    
}

module.exports = new AdminController();
