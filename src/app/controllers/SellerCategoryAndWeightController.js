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

class SellerCategoryAndWeightController {

    //[GET]
 //[GET] /show/category
    productShowCategory(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM danhmuc WHERE NB_id = '${req.query.seller}'`)])
            .then(([result])=>{
                for(let i=0; i<result.length; i++){
                    Promise.all([ mydb.query(`SELECT COUNT(SP_id) as sl FROM sanpham WHERE NB_id = '${req.query.seller}' AND DM_id='${result[i].DM_id}'`)])
                        .then(([sl])=>{
                            console.log('sl',sl[0].sl);
                            result[i].product = sl[0].sl;
                            if(i === result.length-1){
                                res.json({
                                    result: result,
                                    category: true,
                                })
                            }
                        })
                }
            })
            .catch((err) =>{
                res.json({
                    category: false,
                })
            })
            
    }


    categoryAdd(req, res, next){
        // console.log(req.body.DM_danhmuc);
        Promise.all([ mydb.query(`INSERT INTO danhmuc(NB_id, DM_danhmuc) VALUES ('${req.body.NB_id}', '${req.body.DM_danhmuc}')`)])
            .then(([result])=>{
                res.json({
                    category: true,
                });
            })
            .catch((err) =>{
                res.json({
                    category: false,
                });
            })
    }

    categoryUpdate(req, res, next){
        // console.log(req.body.DM_danhmuc);
        Promise.all([ mydb.query(`UPDATE danhmuc SET DM_danhmuc = '${req.body.DM_danhmuc}' WHERE NB_id = '${req.body.NB_id}' AND DM_id = '${req.body.DM_id}'`)])
            .then(([result])=>{
                res.json({
                    categoryUpdate: true,
                });
            })
            .catch((err) =>{
                res.json({
                    categoryUpdate: false,
                });
            })
    }

    categoryDelete(req, res, next){
        console.log(req.body.DM_id);
        Promise.all([ mydb.query(`DELETE FROM danhmuc WHERE NB_id = '${req.body.NB_id}' AND DM_id = '${req.body.DM_id}'`)])
            .then(([result])=>{
                res.json({
                    categoryDelete: true,
                });
            })
            .catch((err) =>{
                res.json({
                    categoryDelete: false,
                });
            })
    }

    weightAdd(req, res, next){
        // console.log(req.body.DM_danhmuc);
        Promise.all([ mydb.query(`INSERT INTO trongluong (NB_id, TL_trongluong) VALUES ('${req.body.NB_id}', '${req.body.TL_trongluong}')`)])
            .then(([result])=>{
                res.json({
                    category: true,
                });
            })
            .catch((err) =>{
                res.json({
                    category: false,
                });
            })
    }

    weightUpdate(req, res, next){
        // console.log(req.body.DM_danhmuc);
        Promise.all([ mydb.query(`UPDATE trongluong SET TL_trongluong = '${req.body.TL_trongluong}' WHERE NB_id = '${req.body.NB_id}' AND TL_id = '${req.body.TL_id}'`)])
            .then(([result])=>{
                res.json({
                    categoryUpdate: true,
                });
            })
            .catch((err) =>{
                res.json({
                    categoryUpdate: false,
                });
            })
    }

    weightDelete(req, res, next){
        console.log(req.body.DM_id);
        Promise.all([ mydb.query(`DELETE FROM trongluong WHERE NB_id = '${req.body.NB_id}' AND TL_id = '${req.body.TL_id}'`)])
            .then(([result])=>{
                res.json({
                    categoryDelete: true,
                });
            })
            .catch((err) =>{
                res.json({
                    categoryDelete: false,
                });
            })
    }
    
}

module.exports = new SellerCategoryAndWeightController();