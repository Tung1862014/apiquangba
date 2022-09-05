const cookieSession = require("cookie-session");
const path = require('path');
const express = require('express');
const morgan = require('morgan');
const app = express();
const methodOverride = require('method-override');
const passportSetup = require("./passport");
const passport = require('passport');

const cors = require('cors');

const route = require('./routes');

const db = require('./config/db');

//connect to DB
function connect() {
    db.connect((err) =>{
    if (err)
        console.log('connect failure !!');
    else
        console.log("Connected successfully!");
    });
};

connect();


app.use(cookieSession({ name: "session", keys: ["lama"], maxAge: 24 * 60 * 60 * 100 }));
app.use(passport.initialize());
app.use(passport.session());

// app.use(
//   cors({
//     origin: "http://localhost:3000",
//     methods: "GET,POST,PUT,DELETE",
//     credentials: true,
//   })
// );

app.use(express.static(path.join(__dirname, 'uploads')));
app.use(express.static(path.join(__dirname, 'uploadSellerProduct')));
app.use(express.static(path.join(__dirname, 'uploadSellerProductImage')));
app.use(express.static(path.join(__dirname, 'video')));

app.use(cors());

app.use(
  express.urlencoded({
      extended: true,
  }),
);

app.use(express.json());

app.use(methodOverride('_method'));

app.use(morgan('combined'))

route(app);

app.listen(process.env.PORT||5000, () => {
  console.log(`Example app listening on port ${process.env.PORT||5000}`);
})