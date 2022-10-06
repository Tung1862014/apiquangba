const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class ProductController {
    ShowSuggestions(req, res, next){
        // Promise.all([ mydb.query(`SELECT FLOOR(RAND() * 100) AS offset`)])
        //     .then(([offset]) => {
        //         // console.log(offset[0].offset);
        //         if(offset[0].offset <=40 ){
                    Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE DG_sosao BETWEEN 4 AND 5 AND DG_id BETWEEN 0 AND 100 Limit 30`)])
                    .then(([star]) => {
                        let arr=[];
                        let result = [];
                        for (let i = 0; i < star.length; i++){
                            if (!arr.includes(star[i].SP_id)) {
                                arr.push(star[i].SP_id);
                            }     
                        }
                        console.log('arr',arr);
                        if(arr !== ''){
                            for(let i = 0; i < arr.length; i++){
                                Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id = '${arr[i]}'`)])
                                    .then(([results])=>{
                                        result[i]= results[0];
                                        if(i == arr.length - 1){
                                            res.json({
                                                results: result,
                                                suggestions: true,
                                            });
                                        }
                                        //console.log(results);
                                    })
                                    .catch((err)=>{
                                        res.json({
                                            suggestions: false,
                                        });
                                    })
                            }
                        }
                        // console.log(result);
                    })
                    .catch((error) => {
                        console.log('loi');
                    })
                // }else{
                //     Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE DG_sosao BETWEEN 4 AND 5 AND DG_id BETWEEN 1 AND ${offset[0].offset} ORDER by DG_id DESC Limit 30`)])
                //     .then(([star]) => {
                //         let arr='';
                //         let result = [];
                //         for (let i = 0; i < star.length; i++){
                //             if(arr === ''){
                //                 arr += star[i].SP_id ;
                //             }else{
                //                 for (let k = 0 ; k < arr.split(',').length; k++){
                //                     if(star[i].SP_id !== arr.split(',')[k]){
                //                         console.log('split',arr.split(',')[k]);
                //                         if(k === arr.split(',').length - 1){
                //                             arr += ',' + star[i].SP_id ;
                //                         }
                //                     }
                //                 }
                //             }    
                //         }
                //         // console.log(arr.split());
                //         if(arr !== ''){
                //             for(let i = 0; i < arr.split(',').length; i++){
                //                 Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id = '${arr.split(',')[i]}'`)])
                //                     .then(([results])=>{
                //                         result[i]= results[0];
                //                         if(i == arr.split(',').length - 1){
                //                             res.json({
                //                                 results: result,
                //                                 suggestions: true,
                //                             });
                //                         }
                //                         //console.log(results);
                //                     })
                //                     .catch((err)=>{
                //                         res.json({
                //                             suggestions: false,
                //                         });
                //                     })
                //             }
                //         }
                //         // console.log(result);
                //     })
                //     .catch((error) => {
                //         console.log('loi');
                //     })
                // }
            //})
    }

    ShowPromotion(req, res, next){
        Promise.all([ mydb.query(`SELECT FLOOR(RAND() * 100) AS offset`)])
            .then(([offset])=>{
                console.log(offset[0].offset);
                if(offset[0].offset <=40 ){
                    Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_khuyenmai > 0 AND SP_id BETWEEN ${offset[0].offset} AND 100 Limit 30`)])
                        .then((results) =>{
                            res.json({
                                results: results[0],
                            })
                        })
                        .catch((err) => {
                            console.log('loi');
                        })
                }else {
                    Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_khuyenmai > 0 AND SP_khuyenmai BETWEEN 1 AND ${offset[0].offset} ORDER by SP_id DESC Limit 30`)])
                        .then((results) =>{
                            res.json({
                                results: results[0],
                            })
                        })
                        .catch((err) => {
                            console.log('loi');
                        })
                }
            })
            .catch((err) =>{
                console.log('loi');
            })
       
    }
}

module.exports = new ProductController();
