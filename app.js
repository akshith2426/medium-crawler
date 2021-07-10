const express=require('express');
const session = require('express-session');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const passport = require('passport');
const mysql = require('mysql');
var path = require('path');
const app=express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, '')));

require('./config/passport')(passport);
const { isLoggedIn, forwardAuthenticated } = require('./config/auth');



app.use(
	session({
		secret: 'medium-crawler-secret',
		resave: true,
		saveUninitialized: true
	})
);


app.use(passport.initialize());
app.use(passport.session());

//routes
app.use("/", require('./routes/indexPage'));
app.use("/", require('./routes/authentication'));


const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
    console.log(`Application running on the port ${PORT}`);
});