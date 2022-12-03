

const mysqldump = require('mysqldump');

const  handleBackUp = () => {
    mysqldump({
        connection: {
              host: process.env.DB_HOST,
              user: process.env.DB_USERNAME,
              password: "",
              database: process.env.DB_DATABASE_NAME,
        },
        dumpToFile: './backup.sql',
      });
      
}
module.exports = {handleBackUp};
//module.exports = uploadProduct  = path.join(__dirname, 'images\\');

