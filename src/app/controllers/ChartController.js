
const Bill = require('../models/Bill');
const Staff = require('../models/Staff');
const Customer = require('../models/Customer');
const Supplier = require('../models/Supplier');

const dbConn = require('../../config/db');
const Database = require('../../config/Database')
// const {
//     multipleMongooseToObject,
//     mongooseToObject,
// } = require('../../util/mongoose');

let mydb = new Database(dbConn);

const sql_selectAll_bill = 'SELECT tensp FROM sanpham';
const sql_selectCount_bill = 'SELECT count(*) as counts FROM hoadon';
const sql_selectCount_staff = 'SELECT count(*) as counts FROM hoadon';
const sql_selectCount_customer = 'SELECT count(*) as counts FROM hoadon';
const sql_selectCount_supplier = 'SELECT count(*) as counts FROM hoadon';

class ChartController {
    //[GET]  /staff
    //index(req, res, next) {
        //res.send('home')
        // var perPage = 2;
        // var page = req.query.page || 1;
        // Bill.find({})
        //         .skip((perPage * page) - perPage)
        //         .limit(perPage).exec(function(err,bills){
        //             if(err) throw err;
        //             Promise.all([  Staff.countDocuments(),Customer.countDocuments(),Supplier.countDocuments(), req.cookies.nameuser])
        //             .then(([countStaff,countCustomer, countSupplier, usecooki]) =>{
        //                 Bill.countDocuments({}).exec((err,Count)=>{          
        //                     res.render('home', {
        //                         bills: multipleMongooseToObject(bills),
        //                         pagination:{page, pageCount:Math.ceil(Count / perPage) },
        //                         countStaff,
        //                         countCustomer,
        //                         countBill:Count,
        //                         countSupplier,
        //                         usecooki,
        //                     });
        //                 });
        //             })
        //     });
   // }

    //[GET]  /
    index(req, res, next) {
        // res.json(req.query)
      
        // Promise.all([ mydb.query(`SELECT TK_id, TK_ngay, TK_donhang, TK_doanhthu, TK_soluong FROM thongke WHERE NB_id='${req.query.NB_id}' AND TK_ngay BETWEEN DATE_SUB(DATE('${req.query.ngdi}'),INTERVAL 2 DAY) AND DATE_ADD(DATE('${req.query.ngde}'),INTERVAL 2 DAY)`)])
        //     .then(([results]) =>
        //         // res.json({numbers,results}),

        //         res.json(
        //            { results: results}
        //         )
        //     )
        let arr = [];
        console.log('date ngdi', req.query.ngdi);
        console.log('date ngde', req.query.ngde);
        function handleTestDate(fromValue, toValue) {
            //console.log('handleTestDate', promotion);
            let datefrom = new Date(fromValue);
            let dateto = new Date(toValue);
                if (datefrom >= dateto) {
                    return true;
                } else {
                    return false;
                }
                // console.log('date1', date1); 
            
        }
         Promise.all([mydb.query(`SELECT * FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_ngay BETWEEN '${req.query.ngdi}' AND '${req.query.ngde}' AND DH_trangthai=4`)])
            .then(([results]) =>{
                console.log('date results', results.length);
                let numbers = [];
                let turnovers = [];
                if(results.length > 0){
                    for(let i=0; i<results.length; i++){
                        let YMD='';
                        let DateChart = new Date(results[i].DH_ngay);
                            let day = DateChart.getDate();
                            let month = DateChart.getMonth() + 1;
                            let year = DateChart.getFullYear();
    
                            if (month < 10 && day >= 10) {
                                YMD = year + '-0' + month + '-' + day;
                            } else if (month < 10 && day < 10) {
                                YMD =  year + '-0' + month + '-0' + day;
                            } else if (month >= 10 && day < 10) {
                                YMD =  year + '-' + month + '-0' + day;
                            } else if (month >= 10 && day >= 10) {
                                YMD = year + '-' + month + '-' + day;
                            } else {
                                YMD = year + '-' + month + '-' + day;
                            }
                            //console.log(YMD);
                            if(!arr.includes(YMD)){
                                arr.push(YMD);
                            }
                            // if(arr[0] === undefined){
                            //     arr = [...arr,YMD];
                            // }else{
                            //     // for(let j=0; j < arr.length; j++){
                            //     //     if(arr[j] !== (YMD)){
                            //     //         if(j === arr.length-1){
                            //     //             arr = [...arr,YMD];
                            //     //         }
                            //     //     }
                            //     // }                             
                            // }
                    }
                    console.log('day arr', arr);

                    for(let i=0; i<arr.length-1; i++){
                        for(let j=i+1; j < arr.length; j++){
                            if(handleTestDate(arr[i],arr[j])){
                                console.log(`arr${i}: `, arr[j]);
                                let temp = arr[i];
                                arr[i]= arr[j];
                                arr[j] = temp;
                            }
                        }
                    }
                    
                    for(let i=0; i < arr.length; i++){
                        console.log('day', arr[i]);
                        Promise.all([ mydb.query(`SELECT sum(DH_tongtien) as money FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_ngay='${arr[i]}' AND DH_trangthai=4`)])
                            .then(([money]) =>{
                               
                                turnovers =  [...turnovers,money[0].money];
                               
                                Promise.all([ mydb.query(`SELECT COUNT(DH_id) as orders FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_ngay='${arr[i]}' AND DH_trangthai=4`)])
                                    .then(([orders]) =>{
                                        //console.log('tong tien', turnovers);
                                        numbers = [...numbers, orders[0].orders];
                                        if(i === arr.length-1){
                                            console.log('arr', arr);
                                            console.log('chartListTurnover', turnovers);
                                            console.log('chartListNumber', numbers);
                                            res.json({
                                                arr: arr,
                                                turnovers: turnovers,
                                                numbers: numbers,
                                            })
                                        }
                                    })
                                    .catch((err) =>{
                                        console.log('loi nha');
                                    })
                            })
                            .catch((err) =>{
                                console.log('loi');
                            })
                        
                            
                    }
                }else{
                    res.json({
                        arr: [],
                        turnovers: [],
                        numbers: [],
                    })
                }
                
            }
                // res.json({numbers,results}),
            )
    }
    

    ChartTableStatistical(req, res, next){
        let arr = [];
        console.log('date ngdi', req.query.ngdi);
        console.log('date ngde', req.query.ngde);
        console.log('type:  ', req.query.type);
        function handleTestDate(fromValue, toValue) {
            //console.log('handleTestDate', promotion);
            let datefrom = new Date(fromValue);
            let dateto = new Date(toValue);
                if (datefrom >= dateto) {
                    return true;
                } else {
                    return false;
                }
                // console.log('date1', date1); 
            
        }

        let numbers = [];
        let turnovers = [];

        if(req.query.type === 'tuan'){
            const datefrom = new Date(req.query.ngdi);
            const dateto = new Date(req.query.ngde);
            const dayfrom = datefrom.getDate();
            const dayto = dateto.getDate();
            const monthfrom = datefrom.getMonth() + 1;
            const monthto = dateto.getMonth() + 1;
            const yearfrom = datefrom.getFullYear();
            const yearthto = dateto.getFullYear();

            let dateValue = Number(dayfrom);
            let monthValue = Number(monthfrom);
            let DateNowValue = new Date(req.query.ngdi);
            let yearNowValue = new Date(req.query.ngdi);
            let sumday = 1;
            let test = 1;
            let li = 1;
            let ln = 1;
            while (test == 1){

                if(Number(yearNowValue.getFullYear()) < Number(yearthto)){
                     sumday += 1;
                     const date = new Date(req.query.ngdi);
                     date.setDate(date.getDate() + ln);
                     yearNowValue = date;
                     ln++;
                }else if( Number(yearNowValue.getMonth() + 1) < Number(monthto)){
                     sumday += 1;
                     const date = new Date(req.query.ngdi);
                     date.setDate(date.getDate() + li);
                     console.log('monthValue < Number(monthto): ',date, yearNowValue.getMonth() + 1);
                     yearNowValue = date;
                    // numberDate = date;
                    //DateNowValue = date;
                    li++;
                }else if( Number(yearNowValue.getDate()) <  Number(dayto) ){
                    sumday += 1;
                    //console.log('monthValue = Number(monthto)', monthValue);
                    yearNowValue.setDate(yearNowValue.getDate() + 1);
                    yearNowValue = yearNowValue;
                }else{
                    test = 0;
                }

            }

            console.log('sumday', sumday);
            for(let i = 0; i < sumday; i++){
                const date = new Date(req.query.ngdi);
                date.setDate(date.getDate() + i);
                let YMD='';
                let day = date.getDate();
                let month = date.getMonth() + 1;
                let year = date.getFullYear();

                if (month < 10 && day >= 10) {
                    YMD = year + '-0' + month + '-' + day;
                } else if (month < 10 && day < 10) {
                    YMD =  year + '-0' + month + '-0' + day;
                } else if (month >= 10 && day < 10) {
                    YMD =  year + '-' + month + '-0' + day;
                } else if (month >= 10 && day >= 10) {
                    YMD = year + '-' + month + '-' + day;
                } else {
                    YMD = year + '-' + month + '-' + day;
                }
                arr.push(YMD);
            }
            console.log('setDate: arr', arr);
            for(let i=0; i < arr.length; i++){
                Promise.all([ mydb.query(`SELECT sum(DH_tongtien) as money FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_ngay='${arr[i]}' AND DH_trangthai=4`)])
                .then(([money]) =>{
                                          
                    if(money[0].money != null){
                        turnovers =  [...turnovers,money[0].money];
                    }else{
                        turnovers =  [...turnovers,0];
                    }
                   
                    Promise.all([ mydb.query(`SELECT COUNT(DH_id) as orders FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_ngay='${arr[i]}' AND DH_trangthai=4`)])
                        .then(([orders]) =>{
                            //console.log('tong tien', turnovers);
                            if(orders[0].orders != null){
                                numbers = [...numbers, orders[0].orders];
                            }else{
                                numbers = [...numbers, 0];
                            }
                            if(i === arr.length-1){
                                console.log('arr', arr);
                                console.log('chartListTurnover', turnovers);
                                console.log('chartListNumber', numbers);
                                res.json({
                                    arr: arr,
                                    turnovers: turnovers,
                                    numbers: numbers,
                                })
                            }
                        })
                        .catch((err) =>{
                            console.log('loi nha');
                        })
                })
                .catch((err) =>{
                    console.log('loi');
                })  
            }
                    
        }else{
        const date = new Date();
        const dayValue = new Date();
        const year = date.getFullYear();
        let dateQuarter = []
        if(req.query.type == 'quy1'){
            dateQuarter = [
                {
                    ngdi: `${year}-01-01`,
                    ngde: `${year}-01-31`
                },
                {
                    ngdi: `${year}-02-01`,
                    ngde: `${year}-02-28`
                },
                {
                    ngdi: `${year}-03-01`,
                    ngde: `${year}-03-31`
                }
            ]
        }else if(req.query.type == 'quy2'){
            dateQuarter = [
                {
                    ngdi: `${year}-04-01`,
                    ngde: `${year}-04-30`
                },
                {
                    ngdi: `${year}-05-01`,
                    ngde: `${year}-05-31`
                },
                {
                    ngdi: `${year}-06-01`,
                    ngde: `${year}-06-30`
                }
            ]
        }else if(req.query.type == 'quy3'){
            dateQuarter = [
                {
                    ngdi: `${year}-07-01`,
                    ngde: `${year}-07-31`
                },
                {
                    ngdi: `${year}-08-01`,
                    ngde: `${year}-08-31`
                },
                {
                    ngdi: `${year}-09-01`,
                    ngde: `${year}-09-30`
                }
            ]
        }else if(req.query.type == 'quy4'){
            dateQuarter = [
                {
                    ngdi: `${year}-10-01`,
                    ngde: `${year}-10-31`
                },
                {
                    ngdi: `${year}-11-01`,
                    ngde: `${year}-11-30`
                },
                {
                    ngdi: `${year}-12-01`,
                    ngde: `${year}-12-31`
                }
            ]
        }else if(req.query.type == 'nam'){
            console.log('nam nnn: ', req.query.nam);
            dateQuarter = [
                {
                    ngdi: `${req.query.nam}-01-01`,
                    ngde: `${req.query.nam}-01-31`
                },
                {
                    ngdi: `${req.query.nam}-02-01`,
                    ngde: `${req.query.nam}-02-28`
                },
                {
                    ngdi: `${req.query.nam}-03-01`,
                    ngde: `${req.query.nam}-03-31`
                },
                {
                    ngdi: `${req.query.nam}-04-01`,
                    ngde: `${req.query.nam}-04-30`
                },
                {
                    ngdi: `${req.query.nam}-05-01`,
                    ngde: `${req.query.nam}-05-31`
                },
                {
                    ngdi: `${req.query.nam}-06-01`,
                    ngde: `${req.query.nam}-06-30`
                },
                {
                    ngdi: `${req.query.nam}-07-01`,
                    ngde: `${req.query.nam}-07-31`
                },
                {
                    ngdi: `${req.query.nam}-08-01`,
                    ngde: `${req.query.nam}-08-31`
                },
                {
                    ngdi: `${req.query.nam}-09-01`,
                    ngde: `${req.query.nam}-09-30`
                },
                {
                    ngdi: `${req.query.nam}-10-01`,
                    ngde: `${req.query.nam}-10-31`
                },
                {
                    ngdi: `${req.query.nam}-11-01`,
                    ngde: `${req.query.nam}-11-30`
                },
                {
                    ngdi: `${req.query.nam}-12-01`,
                    ngde: `${req.query.nam}-12-31`
                }
            ]
        }

        console.log('quy: ', dateQuarter);
        for(let i=0; i < dateQuarter.length; i++){
            console.log('day', arr[i]);
            Promise.all([ mydb.query(`SELECT sum(DH_tongtien) as money FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_ngay BETWEEN '${dateQuarter[i].ngdi}' AND '${dateQuarter[i].ngde}' AND DH_trangthai=4`)])
                .then(([money]) =>{
                   
                    console.log('money[0].money: ', money[0].money);
                    if(money[0].money != null){
                        turnovers =  [...turnovers,money[0].money];
                    }else{
                        turnovers =  [...turnovers,0];
                    }
                   
                    Promise.all([ mydb.query(`SELECT COUNT(DH_id) as orders FROM donhang WHERE NB_id='${req.query.NB_id}' AND DH_ngay BETWEEN '${dateQuarter[i].ngdi}' AND '${dateQuarter[i].ngde}' AND DH_trangthai=4`)])
                        .then(([orders]) =>{
                            console.log('orders[0].orders', orders[0].orders);
                            if(orders[0].orders != null){
                                numbers = [...numbers, orders[0].orders];
                            }else{
                                numbers = [...numbers, 0];
                            }
                            if(i === dateQuarter.length-1){
                                console.log('chartListTurnover', turnovers);
                                console.log('chartListNumber', numbers);
                                res.json({
                                    arr: [],
                                    turnovers: turnovers,
                                    numbers: numbers,
                                })
                            }
                        })
                        .catch((err) =>{
                            console.log('loi nha');
                        })
                })
                .catch((err) =>{
                    console.log('loi');
                })         
        }
        
    }
    }
 }

module.exports = new ChartController();
