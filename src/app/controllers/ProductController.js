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
                                Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id = '${arr[i]}' AND SP_trangthai != '2'`)])
                                    .then(([results])=>{
                                        if(results[0] !== undefined){
                                            result[i]= results[0];
                                            if(i == arr.length - 1){
                                                for(let r = 0; r < arr.length; r++){
                                                    Promise.all([ mydb.query(`SELECT * FROM khuyenmai WHERE SP_id = '${arr[r]}'`)])
                                                        .then(([promotion])=>{
                                                            if(promotion.length > 0){
                                                                result[r].promotion= promotion[0];
                                                            }else{
                                                                result[r].promotion= 0;
                                                            }

                                                            if(r == arr.length - 1){
                                                                res.json({
                                                                    results: result,
                                                                    suggestions: true,
                                                                });
                                                            }
                                                        })
                                                        .catch((err) => {

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
                    if (!idProduct.includes(star[i].SP_id)) { //lấy id sản phẩm có đánh giá cao của người dùng
                        idProduct.push(star[i].SP_id);
                    }     
                }
                console.log('idProduct',idProduct);
                let result = [];''
                let idUser = [];
                let allUser = [];
                let allIdProduct = [];
                let pointProduct = [];
                let filterIdproduct = [];
                let starProduct=[];
              
                //let checkIdproduct = false;
                if(idProduct !== ''){
                    for(let i = 0; i < idProduct.length; i++){
                        //tập hợp tất cả các đánh giá có id sản phẩm idProduct
                        Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE SP_id = '${idProduct[i]}' AND DG_sosao BETWEEN 4 AND 5 AND ND_id != '${req.query.ND_id}' limit 10`)])
                            .then(([results])=>{
                                result.push(results);
                                if(i == idProduct.length - 1){
                                    console.log('result',result);
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
                                            //tập hợp tất cả các đánh giá của người dùng láng giềng
                                            Promise.all([ mydb.query(`SELECT * FROM danhgia WHERE ND_id='${idUser[l]}'`)])
                                                .then(([resultuse]) =>{
                                                    allUser[l] = resultuse; //lấy thống tin đánh giá để tạo ra ma trận
                                                    for(let t=0; t < resultuse.length; t++){
                                                        console.log('resultuse id',resultuse[t].SP_id);      
                                                    }
                                                    
                                                    //tập hợp các id sản phẩm của người dùng láng giềng
                                                    if(l === idUser.length - 1){
                                                        for(let w=0; w<allUser.length; w++){
                                                            for(let q=0; q<allUser[w].length; q++){
                                                                if (!allIdProduct.includes(allUser[w][q].SP_id)){
                                                                    allIdProduct.push(allUser[w][q].SP_id); 
                                                                }
                                                            }
                                                        }
                                                    }

                                                    //lấy mảng các số sao theo từng sản phẩm
                                                    for(let z=0; z<allIdProduct.length; z++){   //id sản phẩm                                                                                    
                                                        for(let g=0; g<allUser.length; g++){
                                                            for(let h=0; h<allUser[g].length; h++){                                                         
                                                                 if(allIdProduct[z] == allUser[g][h].SP_id){                                                                   
                                                                     starProduct.push(allUser[g][h].DG_sosao); //tập hợp số sao của một sản phẩm                                                                                                                              
                                                                 }
                                                                 
                                                            }
                                                            if(g == allUser.length -1){
                                                                pointProduct[z] =starProduct; //thành ma trận
                                                                starProduct=[];
                                                            }
                                                        }
                                                    }
                                                    console.log('pointProduct',pointProduct);
                                                    
                                                   
                                                     //console.log('allUser',allUser[0][0]);

                                                     //tính số sao trunh bình
                                                     let mediumStar = 0;                                  
                                                     for(let u=0; u<allIdProduct.length; u++){ // id sản phẩm
                                                        for(let y=0; y<pointProduct[u].length; y++){ //số sao
                                                            mediumStar += pointProduct[u][y];
                                                            if(y == pointProduct[u].length-1){
                                                                let resultStar = mediumStar/(pointProduct[u].length); // tính trung bình điểm
                                                                if(resultStar >= 4){
                                                                    if (!filterIdproduct.includes(allIdProduct[u])){
                                                                        filterIdproduct.push(allIdProduct[u]); 
                                                                    } 
                                                                }
                                                                console.log(`pointProduct ${u}: `,resultStar);
                                                                mediumStar = 0;
                                                            }
                                                        }
                                                     }
                                                     console.log(`idUser`, idUser);
                                                     console.log('allIdProduct',allIdProduct);
                                                     console.log('filterIdproduct',filterIdproduct);

                                                   //lấy thông tin sản phẩm
                                                    if(filterIdproduct[0] !== undefined){
                                                        for(let v = 0; v < filterIdproduct.length; v++){
                                                            Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id = '${filterIdproduct[v]}' AND SP_trangthai != '2'`)])
                                                                .then(([product])=>{
                                                                    result[v]= product[0];
                                                                    if( v == filterIdproduct.length - 1){
                                                                        for(let r = 0; r < filterIdproduct.length; r++){
                                                                            Promise.all([ mydb.query(`SELECT * FROM khuyenmai WHERE SP_id = '${filterIdproduct[r]}'`)])
                                                                                .then(([promotion])=>{
                                                                                    if(promotion.length > 0){
                                                                                        result[r].promotion= promotion[0];
                                                                                    }else{
                                                                                        result[r].promotion= 0;
                                                                                    }

                                                                                    if(r == filterIdproduct.length - 1){
                                                                                        res.json({
                                                                                            results: result,
                                                                                            suggestions: true,
                                                                                        });
                                                                                    }
                                                                                })
                                                                                .catch((err) => {

                                                                                })
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
        // Promise.all([ mydb.query(`SELECT FLOOR(RAND() * 100) AS offset`)])
        //     .then(([offset])=>{
        //         console.log(offset[0].offset);
        //         if(offset[0].offset <=40 ){
        //             Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_khuyenmai > 0 AND SP_id BETWEEN ${offset[0].offset} AND 100 Limit 30`)])
        //                 .then((results) =>{
        //                     res.json({
        //                         results: results[0],
        //                     })
        //                 })
        //                 .catch((err) => {
        //                     console.log('loi');
        //                 })
        //         }else {
        //             Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_khuyenmai > 0 AND SP_khuyenmai BETWEEN 1 AND ${offset[0].offset} ORDER by SP_id DESC Limit 30`)])
        //                 .then((results) =>{
        //                     res.json({
        //                         results: results[0],
        //                     })
        //                 })
        //                 .catch((err) => {
        //                     console.log('loi');
        //                 })
        //         }
        //     })
        //     .catch((err) =>{
        //         console.log('loi');
        //     })

        Promise.all([ mydb.query(`SELECT * FROM khuyenmai`)])
            .then(([results]) =>{
                for(let i = 0; i < results.length; i++){
                    Promise.all([ mydb.query(`SELECT * FROM sanpham WHERE SP_id = '${results[i].SP_id}'`)])
                        .then(([product]) => {
                            results[i].product=product[0];
                            if(i === results.length-1){
                                res.json({
                                    results: results,
                                })
                            }
                        })
                        .catch((err) => {
                            console.log('loi');
                        })
                }
            })
            .catch((err) => {
                console.log('loi');
            })
       
    }
}

module.exports = new ProductController();
