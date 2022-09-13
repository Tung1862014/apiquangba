const Customer = require('../models/Customer');
// const {
//     multipleMongooseToObject,
//     mongooseToObject,
// } = require('../../util/mongoose');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class CustomerController {

    insert(req, res, next) {
        console.log('image: '+ JSON.stringify(req.files))
        const formData = req.body;
        console.log(req.body.ND_username);
        let testUserName = '';
         Promise.all([mydb.query(`SELECT * FROM nguoidung WHERE ND_username='${formData.ND_username}' AND ND_quyen=2`)])
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
                Promise.all([mydb.query(`INSERT INTO nguoidung( ND_hoten, ND_username, ND_password, ND_image, ND_email, ND_diachi, ND_ngay, ND_sdt, ND_quyen) VALUES (
                    '${formData.ND_hoten}','${formData.ND_username}','${formData.ND_password}','${formData.image}','${formData.ND_email}','${formData.ND_diachi}','${formData.ND_ngay}','${formData.ND_sdt}','2'
                    )`)])        
            }
         })
         .catch((err) => {
             res.send('Loi khong tim user')
         })   
    }

    //POST LOGIN
    login(req, res, next){
        console.log(req.body.userName)
        let url;
        if(req.body.seller){
            url =`SELECT ND_id, ND_hoten, ND_password, ND_image, ND_email, ND_diachi, ND_sdt,  ND_ngay FROM nguoidung WHERE ND_username='${req.body.ND_username}' AND ND_quyen=1`;
        }else{
            url =`SELECT ND_id, ND_hoten, ND_password, ND_image, ND_email, ND_diachi, ND_sdt, ND_ngay FROM nguoidung WHERE ND_username='${req.body.ND_username}' AND ND_quyen=2`;
        }
        Promise.all([mydb.query(url) ])
        .then(([ result]) =>{
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

    updateImage(req, res, next) {
        const formData = req.body;
        console.log('files: '+ JSON.stringify(req.files))
        if(req.files){
            Promise.all([ mydb.query(`SELECT * FROM nguoidung WHERE ND_Id='${formData.idND}'`)])
            .then(([result]) =>{
                if(result[0]){
                    const uploadImage  = uploadDir+ result[0].ND_Link.split('/').slice(4,5);
                    console.log('iamge: '+uploadImage)
                    fs.unlink(uploadImage, (error) => {
                        // if any error
                        if (error) {
                          console.error(error);
                          return;
                        }
                        console.log("Successfully deleted file!");
                      });
            }
            })
            .catch(err => res.json({err: true, promise: false, errorCode: 'loi'})) 
            let paths ='';
            // res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_CUSTOMER+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            console.log("data: "+ paths)
            formData.image = paths;
         }else{
            console.log('loi image')
         }
        
         Promise.all([mydb.query( `UPDATE nguoidung SET ND_Hoten='${formData.fullName}',ND_Password='${formData.password}',ND_Link='${formData.image}',ND_Email='${formData.email}',ND_Diachi='${formData.address}',ND_Ngaysinh='${formData.birthday}',ND_Sodt='${formData.phone}' WHERE ND_Id='${formData.idND}'`)])
        .then(([user]) =>{
            if(user){
                Promise.all([mydb.query(`SELECT ND_Id, ND_Hoten, ND_Password, ND_Link, ND_Email, ND_Diachi, ND_Ngaysinh, ND_Sodt FROM nguoidung WHERE ND_Id='${req.body.idND}'`) ])
                .then(([result]) =>{
                    if(result){
                        res.json({result: result[0]})
                    }else{
                        res.json({err: true})
                    } 
                })
                .catch(err => res.json({err: true, promise: false, errorCode: 'loi'})) 
            }
           
        }
        )
        .catch(err => res.json({err: true, promise: false, errorCode: true}))
        
        
    }

    update(req, res, next) {
        const formData = req.body;
         Promise.all( [db.User.update({
            fullName: formData.fullName,
            password: formData.password,
            email: formData.email,
            address: formData.address,
            birthday: formData.birthday,
            phone: formData.phone,
        },{where: {idND: formData.idND}})])
        .then(([user]) =>{
            if(user){
                Promise.all([ db.User.findOne({
                    attributes: {exclude: ['userName']},
                    where: {idND: formData.idND}
                })])
                .then(([result]) =>{
                    if(result){
                        res.json({result})
                    }else{
                        res.json({err: true})
                    } 
                })
                .catch(err => res.json({err: true, promise: false, errorCode: 'loi'})) 
            }
           
        }
        )
        .catch(err => res.json({err: true, promise: false, errorCode: true})) 
    }
}

module.exports = new CustomerController();
