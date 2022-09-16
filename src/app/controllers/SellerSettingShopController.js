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

class sellerSettingShopController {

   
    

    //[POST]  /establish
    // establish(req, res, next){
    //     //console.log('iamge: '+ req.files);
    //     if(req.files){
    //         Promise.all([ mydb.query(`SELECT MTS_image FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
    //         .then(([result1])=>{
    //             //console.log('iamge: '+result1[0].MTS_image)
    //             if(result1[0]){
    //                 //console.log('iamge: '+uploadDir)
    //                 const uploadImage  = uploadDir+ result1[0].MTS_image.split('/').slice(4,5);
    //                 // console.log('iamge: '+uploadImage)
    //                 fs.unlink(uploadImage, (error) => {
    //                     // if any error
    //                     if (error) {
    //                     console.error(error);
    //                     return;
    //                     }
    //                     console.log("Successfully deleted file!");
    //                 }); 
    //             }
    //         })
    //         .catch(err => res.json({err: true, promise: false, errorCode: 'loi'})) 
    //         let paths ='';
    //          //res.json(req.files)
    //         const arr =  req.files;
    //         arr.forEach(function(e, index, arr){
    //            paths = paths + process.env.URL_IMAGE_SHOP+ e.filename +',';
    //         })
    //         paths = paths.substring(0, paths.lastIndexOf(','));
    //         req.body.image = paths;
    //      }
    //      Promise.all([ mydb.query(`SELECT count(MTS_id) as exist FROM motashop WHERE MTS_ten='${req.body.MTS_ten}'`)])
    //      .then(([exist]) =>{
    //         if(exist[0].exist <=0){
    //             Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
    //             .then(([result])=>{
    //                console.log(result[0]);
    //                 if(result[0] !== undefined){
    //                    //console.log(req.body.image);
    //                    if(req.body.image === '' && req.body.MTS_diachi !== ''){
    //                        Promise.all([ mydb.query(`UPDATE motashop SET MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`)])
    //                        .then(([result])=>{
    //                            res.json({
    //                                seller: true,
    //                            })
    //                        })
    //                    }else if(req.body.image !== '' && req.body.MTS_diachi !== ''){
    //                        Promise.all([ mydb.query(`UPDATE motashop SET MTS_image='${req.body.image}', MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`)])
    //                        .then(([result])=>{
    //                            res.json({
    //                                seller: true,
    //                            })
    //                        })
    //                    }else if(req.body.image !== '' && req.body.MTS_diachi === ''){
    //                        Promise.all([ mydb.query(`UPDATE motashop SET MTS_image='${req.body.image}' WHERE NB_id='${req.body.NB_id}'`)])
    //                        .then(([result])=>{
    //                            res.json({
    //                                seller: true,
    //                            })
    //                        })
    //                    }
    //                 }else{
    //                  Promise.all([ mydb.query(`INSERT INTO motashop(NB_id, MTS_ten, MTS_image, MTS_diachi) VALUES ('${req.body.NB_id}','${req.body.MTS_ten}','${req.body.image}','${req.body.MTS_diachi}')`)])
    //                 }
    //             })
    //             .catch((err) =>{
    //                 res.send({
    //                     seller: false,
    //                 })
    //             })
    //         }else{
    //             res.json({
    //                 seller: false,
    //                 exist: true,
    //             })
    //         }
    //      })
    //      .catch((err) =>{
    //         res.send({
    //             seller: false,
    //         })
    //      })
    // }
    // establishNoImage(req, res, next){
    //     //console.log('iamge: '+ req.files);
    //     Promise.all([ mydb.query(`SELECT count(MTS_id) as exist FROM motashop WHERE MTS_ten='${req.body.MTS_ten}'`)])
    //         .then(([exist]) =>{
    //             console.log(exist[0].exist);
    //             if(exist[0].exist <=0){
    //                 Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
    //                     .then(([result])=>{
    //                         if(result){
    //                             if(req.body.MTS_diachi !== ''){
    //                                 Promise.all([ mydb.query(`UPDATE motashop SET MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`)])
    //                                 .then(([result])=>{
    //                                     res.json({
    //                                         seller: true,
    //                                     })
    //                                 })
    //                             }
    //                         }else{
    //                             Promise.all([ mydb.query(`INSERT INTO motashop(NB_id, MTS_ten, MTS_image, MTS_diachi) VALUES ('${req.body.NB_id}','${req.body.MTS_ten}','${req.body.image}','${req.body.MTS_diachi}')`)])
    //                             .then(([result])=>{
    //                                 res.json({
    //                                     seller: true,
    //                                 })
    //                             })
    //                         }
    //                     })
    //                     .catch((err) =>{
    //                         res.send({
    //                             seller: false,
    //                         })
    //                     })
    //             }else{
    //                 res.json({
    //                     seller: false,
    //                     exist: true,
    //                 })
    //             }
    //         })
    //         .catch((err) =>{
    //             res.send({
    //                 seller: false,
    //             })
    //         })
    // }
    establishShow(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM motashop WHERE NB_id='${req.body.NB_id}'`)])
         .then(([result])=>{
            res.json({result: result[0]})
         })
         .catch((err) =>{
            res.send({
                seller: false,
            })
         })
    }
    establishLogo(req, res, next){
        //console.log(req.files);
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_SHOP+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.image = paths;
            console.log(req.body.image);
            Promise.all([ mydb.query(`UPDATE motashop SET MTS_logo='${req.body.image}' WHERE NB_id='${req.body.NB_id}'`)])
            .then(([result])=>{
               res.send(result);
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
        }
    }

    establishSaveInsert(req, res, next){
        console.log('NB_id', req.body.NB_id, req.body.MTS_ten, req.body.MTS_diachi);
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_SHOP+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.MTS_image = paths;

            Promise.all([ mydb.query(`INSERT INTO motashop(NB_id, MTS_ten, MTS_image, MTS_diachi) VALUES ('${req.body.NB_id}', '${req.body.MTS_ten}', '${req.body.MTS_image}','${req.body.MTS_diachi}')`)])
                .then(([result]) => {
                    res.send(result);
                })
                .catch((err) => {
                    console.log(err);
                })

        }
    }

    establishUpdateImage(req, res, next){
        let url;
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_SHOP+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.MTS_image = paths;
            if(req.body.MTS_diachi === ''){
                url = `UPDATE motashop SET MTS_image='${req.body.MTS_image}' WHERE NB_id='${req.body.NB_id}'`;
            }else{
                url = `UPDATE motashop SET MTS_image='${req.body.MTS_image}', MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`;
            }
            Promise.all([ mydb.query(url)])
            .then(([result])=>{
               res.send(result);
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
        }
    }

    establishUpdateImageLogo(req, res, next){
        let url;
        if(req.files){
            let paths ='';
             //res.json(req.files)
            const arr =  req.files;
            arr.forEach(function(e, index, arr){
               paths = paths + process.env.URL_IMAGE_SHOP+ e.filename +',';
            })
            paths = paths.substring(0, paths.lastIndexOf(','));
            req.body.MTS_logo = paths;
            if(req.body.MTS_diachi === ''){
                url = `UPDATE motashop SET MTS_logo='${req.body.MTS_logo}' WHERE NB_id='${req.body.NB_id}'`;
            }else{
                url = `UPDATE motashop SET MTS_logo='${req.body.MTS_logo}',MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`;
            }
            Promise.all([ mydb.query(url)])
            .then(([result])=>{
               res.send(result);
            })
            .catch((err) =>{
                res.send({
                    seller: false,
                })
            })
        }
    }

    establishUpdateAddress(req, res, next){
        
        Promise.all([ mydb.query(`UPDATE motashop SET MTS_diachi='${req.body.MTS_diachi}' WHERE NB_id='${req.body.NB_id}'`)])
        .then(([result])=>{
           res.send(result);
        })
        .catch((err) =>{
            res.send({
                seller: false,
            })
        })
    }
}

module.exports = new sellerSettingShopController();
