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
                    Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE DG_sosao BETWEEN 4 AND 5 AND DG_id BETWEEN 0 AND 100 `)])
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

    ShowSuggestionsUser(req, res, next){
        Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE DG_sosao BETWEEN 4 AND 5 AND ND_id= '${req.query.ND_id}'`)])
        .then(([star]) => {                          
            let idProduct=[];
            if(star.length > 0){
                for (let i = 0; i < star.length; i++){
                    if (!idProduct.includes(star[i].SP_id)) {
                        idProduct.push(star[i].SP_id);
                    }     
                }
                console.log('idProduct',idProduct);
                let result = [];''
                let idUser = [];
                let filterIdproduct = [];
                //let checkIdproduct = false;
                if(idProduct !== ''){
                    for(let i = 0; i < idProduct.length; i++){
                        Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE SP_id = '${idProduct[i]}' AND DG_sosao BETWEEN 4 AND 5 AND ND_id != '${req.query.ND_id}'`)])
                            .then(([results])=>{
                                result.push(results);
                                if(i == idProduct.length - 1){
                                    //lấy id nguoi dùng láng giềng
                                    for(let k=0; k < result.length; k++){
                                        for(let t=0; t<result[k].length; t++){ 
                                            if (!idUser.includes(result[k][t].ND_id)) {
                                                idUser.push(result[k][t].ND_id);
                                            }  
                                            //console.log('idUser',idUser);
                                        }
                                    }
                                    if(idUser[0] !== undefined){
                                        for(let l=0; l < idUser.length; l++){
                                            console.log('idUser',idUser[l]);
                                            Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE DG_sosao BETWEEN 4 AND 5 AND ND_id='${idUser[l]}'`)])
                                                .then(([resultuse]) =>{
                                                    for(let t=0; t < resultuse.length; t++){
                                                        console.log('resultuse id',resultuse[t].SP_id);
                                                        // for(let k=0; k < idProduct.length; k++){                                                      
                                                        //     if(resultuse[t].SP_id == idProduct[k]){
                                                        //         checkIdproduct = true;
                                                        //     }
                                                        //     if(k == idProduct.length-1){                                                         
                                                        //         if(checkIdproduct == false){
                                                        //             if (!filterIdproduct.includes(resultuse[t].SP_id)){
                                                        //                 filterIdproduct.push(resultuse[t].SP_id); 
                                                        //             }                                                                                                                             
                                                        //         }
                                                        //         checkIdproduct = false;
                                                        //     }
                                                        // }
                                                        
                                                        if (!filterIdproduct.includes(resultuse[t].SP_id)){
                                                            filterIdproduct.push(resultuse[t].SP_id); 
                                                        }  
                                                    }
                                                    for(let p=0; p<idProduct.length; p++){
                                                        if (!filterIdproduct.includes(idProduct[p])){
                                                            filterIdproduct.push(idProduct[p]); 
                                                        } 
                                                    }
                                                    console.log('filterIdproduct',filterIdproduct);
                                                    if(filterIdproduct[0] !== undefined){
                                                        for(let v = 0; v < filterIdproduct.length; v++){
                                                            Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id = '${filterIdproduct[v]}'`)])
                                                                .then(([product])=>{
                                                                    result[v]= product[0];
                                                                    if( v == filterIdproduct.length - 1){
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
                                                })
                                                .catch((err) =>{
                                                    console.log('loi ID User');
                                                })
                                        }
                                    }
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
            }else{
                res.json({
                    results: star,
                });
            }
            // console.log(result);
        })
        .catch((error) => {
            console.log('loi');
        })      
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
