const Product = require('../models/Product');
const fs = require('fs');

const dbConn = require('../../config/db');
const Database = require('../../config/Database');

let mydb = new Database(dbConn);

class SearchController {
    
    ShowProduct(req, res, next){
        Promise.all([ mydb.query(`SELECT mts.MTS_logo, mts.MTS_ten, mts.MTS_image, mts.MTS_diachi, nb.ND_ngay FROM motashop as mts, nguoidung as nb WHERE mts.NB_id = nb.ND_id AND mts.NB_id='${req.query.NB_id}'`)])
        .then(([results]) => {
            Promise.all([ mydb.query(`SELECT count(SP_id) as numproduct FROM sanpham WHERE NB_id='${req.query.NB_id}'`)])
                .then(([numproduct]) => {
                    Promise.all([ mydb.query(`SELECT count(DG_id) as evaluate FROM danhgia WHERE NB_id='${req.query.NB_id}'`)])
                        .then(([evaluate]) => {
                            Promise.all([ mydb.query(`SELECT * FROM danhmuc WHERE NB_id='${req.query.NB_id}'`)])
                                .then(([category]) => {
                                    res.json({
                                        results: results[0],
                                        numproduct: numproduct[0],
                                        evaluate: evaluate[0],
                                        category: category,
                                    })
                                })
                                .catch((err) => {
                                    console.log('loi ne nhe')
                                })
                        })
                        .catch((err) => {
                            console.log('loi ne')
                        })
                })
                .catch((err) => {
                    console.log('loi nha')
                })
        })
        .catch((err) => {
            console.log('loi');
        })
    }

    //[GET]  /show/all
    ShowAllProduct(req, res, next){
        console.log('keyword',req.query.keyword);
        console.log('pricefrom',  req.query.pricefrom);
        console.log('priceto',  req.query.priceto);
        let queryString;
        // if(req.query.DM_id == 'all' && req.query.sort == 'all' && req.query.price == 'gia'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' ORDER by SP_id DESC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'all' && req.query.price == 'lowtohigh'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' ORDER by SP_gia ASC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'all' && req.query.price == 'hightolow'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' ORDER by SP_gia DESC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'selling' && req.query.price == 'gia'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_soluongban > 0 ORDER by SP_id DESC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'promotion' && req.query.price == 'gia'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_khuyenmai > 0 ORDER by SP_id DESC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'selling' && req.query.price == 'lowtohigh'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_soluongban > 0 ORDER by SP_gia ASC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'selling' && req.query.price == 'hightolow'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_soluongban > 0 ORDER by SP_gia DESC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'promotion' && req.query.price == 'lowtohigh'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_khuyenmai > 0 ORDER by SP_gia ASC`;
        // }else if(req.query.DM_id == 'all' && req.query.sort == 'promotion' && req.query.price == 'hightolow'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND SP_khuyenmai > 0 ORDER by SP_gia DESC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'all' && req.query.price == 'gia'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}' ORDER by SP_id DESC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'selling' && req.query.price == 'gia'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}' AND SP_soluongban > 0 ORDER by SP_id DESC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'promotion' && req.query.price == 'gia'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}' AND SP_khuyenmai > 0 ORDER by SP_id DESC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'all' && req.query.price == 'lowtohigh'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}'  ORDER by SP_gia ASC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'all' && req.query.price == 'hightolow'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}'  ORDER by SP_gia DESC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'selling' && req.query.price == 'lowtohigh'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}' AND SP_soluongban > 0 ORDER by SP_gia ASC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'promotion' && req.query.price == 'lowtohigh'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}' AND SP_khuyenmai > 0 ORDER by SP_gia ASC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'selling' && req.query.price == 'hightolow'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}' AND SP_soluongban > 0 ORDER by SP_gia DESC`;
        // }else if(req.query.DM_id != 'all' && req.query.sort == 'promotion' && req.query.price == 'hightolow'){
        //     queryString = `SELECT * FROM sanpham WHERE NB_id='${req.query.NB_id}' AND DM_id='${req.query.DM_id}' AND SP_khuyenmai > 0 ORDER by SP_gia DESC`;
        // }
        if(req.query.pricefrom != 0 && req.query.priceto != 0){
            queryString = `SELECT * FROM sanpham WHERE SP_ten like '%${req.query.keyword}%' AND SP_gia BETWEEN '${req.query.pricefrom}' AND '${req.query.priceto}' AND SP_trangthai != 2 AND SP_trangthai != 0 ORDER by SP_id DESC`;
        }else if(req.query.pricefrom != 0 && req.query.priceto == 0){
            queryString = `SELECT * FROM sanpham WHERE SP_ten like '%${req.query.keyword}%' AND SP_gia >= '${req.query.pricefrom}'AND SP_trangthai != 2 AND SP_trangthai != 0 ORDER by SP_id DESC`;
        }else if(req.query.pricefrom == 0 && req.query.priceto != 0){
            queryString = `SELECT * FROM sanpham WHERE SP_ten like '%${req.query.keyword}%' AND SP_gia BETWEEN 0 AND '${req.query.priceto}' AND SP_trangthai != 2 AND SP_trangthai != 0 ORDER by SP_id DESC`;
        }else{
            queryString = `SELECT * FROM sanpham WHERE SP_ten like '%${req.query.keyword}%' AND SP_trangthai != 2 AND SP_trangthai != 0 ORDER by SP_gia DESC`;
        }

        console.log('queryString', queryString);
        Promise.all([ mydb.query(queryString)])
            .then(([results])=>{
                console.log('results', results.length);
                 if(results.length === 0){
                    res.json({
                        results: results,
                    })
                 }else{
                    for(let i=0; i< results.length; i++){
                        Promise.all([ mydb.query(`SELECT sum(DG_sosao) as star, count(DG_id) as num FROM danhgia WHERE SP_id='${results[i].SP_id}'`)])
                            .then(([numstar]) => {
                                console.log(numstar[0].star);
                                results[i].star = Math.round(numstar[0].star / numstar[0].num);
                                if(i === results.length-1){
                                    for(let j=0; j< results.length; j++){
                                        Promise.all([ mydb.query(`SELECT * FROM khuyenmai WHERE SP_id='${results[j].SP_id}' ORDER by SP_id DESC`)])
                                            .then(([promotion]) => {
                                                if(promotion.length > 0){
                                                    results[j].promotion = promotion[0];
                                                }else{
                                                    results[j].promotion = 0;
                                                }

                                                if(j === results.length-1){
                                                    res.json({
                                                        results: results,
                                                    })
                                                }
                                            })
                                            .catch((error) =>{
                                                console.log('loi show nha');
                                            })
                                    }
                                }
                            })
                            .catch((err) =>{
                                console.log('loi star');
                            })
                    }  
                 }      
            })
            .catch((err) => {
                console.log('loi show');
            })
    }
}

module.exports = new SearchController();
