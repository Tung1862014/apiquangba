const express = require('express');
const router = express.Router();
const path = require('path');
const app = express();

const fs = require('fs');


var multiparty = require('connect-multiparty'),


multipartyMiddleware = multiparty({ uploadDir: '../images' });


router.post('/', multipartyMiddleware, (req, res) => {
    console.log('image', req.files.upload);
    var TempFile = req.files.upload;
    var TempPathfile = TempFile.path;

   const targetPathUrl = path.join(__dirname,"./uploads/"+TempFile.name);

   if(path.extname(TempFile.originalFilename).toLowerCase() === ".png" || ".jpg"){
     
    fs.rename(TempPathfile, targetPathUrl, err =>{

        res.status(200).json({
         uploaded: true,
          url: `http://localhost:5000/${TempFile.originalFilename}`
        });

        if(err) return console.log(err);
    })
   }


    console.log(req.files);

});

module.exports = router;
