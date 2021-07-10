const express = require('express');
const app = express();
const passport = require('passport');
const router = express.Router();
const mysql = require('mysql');
const { isLoggedIn, forwardAuthenticated } = require('../config/auth');

var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'medium-crawler',
	multipleStatements: true
});
con.connect(function(error) {
	if (error) throw error;
	console.log('MySQL Database Connected for authentication routes');
});

//Routes in authentication
router.get('/login', forwardAuthenticated, function(req, res) {
	res.render('login.ejs');
});

router.post(
	'/login',
	passport.authenticate('local-login', {
		successRedirect: '/dashboard', 
		failureRedirect: '/login',
		failureFlash: true 
	}),
	function(req, res) {
		if (req.body.remember) {
			req.session.cookie.maxAge = 1000 * 60 * 3;
		} else {
			req.session.cookie.expires = false;
		}
		res.redirect('/');
	}
);

router.get('/signup', forwardAuthenticated, function(req, res) {
	res.render('signup.ejs' );
});
router.post(
	'/signup',
	passport.authenticate('local-signup', {
		successRedirect: '/dashboard',
		failureRedirect: '/signup',
		failureFlash: true 
	})
);

router.get('/dashboard', isLoggedIn, function (req, res) {
    res.render('dashboard',{user:req.user})
});

router.get('/logout', function(req, res) {
		req.logout();
		res.redirect('/');
	});
module.exports =router