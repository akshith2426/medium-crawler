var LocalStrategy = require('passport-local').Strategy;
var mysql = require('mysql');
var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'medium-crawler',
	multipleStatements: true
});
con.connect(function(error) {
	if (error) throw error;
	console.log('MySQL Database Connected for authentication ');
});
module.exports = function(passport) {
	passport.serializeUser(function(user, done) {
		done(null, user.id);
	});
	passport.deserializeUser(function(id, done) {
		con.query('SELECT * FROM users WHERE id = ? ', [ id ], function(err, rows) {
			done(err, rows[0]);
		});
	});
	passport.use(
		'local-signup',
		new LocalStrategy(
			{
				usernameField: 'username',
				passwordField: 'password',
				passReqToCallback: true 
			},
			function(req, username, password, done) {
				con.query('SELECT * FROM users WHERE username = ?', [ username ], function(fault, rows) {
					if (fault) return done(fault);
					if (rows.length) {
						return done(null, false);
					} else {
						var newUserMysql = {
							username: username,
							password: password,
							fullname: req.body.fullname
						};
						var insertQuery = 'INSERT INTO users ( username, password,fullname ) values (?,?,?)';
						con.query(insertQuery, [ newUserMysql.username, newUserMysql.password,newUserMysql.fullname ], function(
							err,
							rows
						) {
							newUserMysql.id = rows.insertId;
							return done(null, newUserMysql);
						});
					}
				});
			}
		)
	);
	passport.use(
		'local-login',
		new LocalStrategy(
			{
				usernameField: 'username',
				passwordField: 'password',
				passReqToCallback: true 
			},
			function(req, username, password, done) {
				con.query('SELECT * FROM users WHERE username = ?', [ username ], function(err, rows) {
					if (err) return done(err);
					if (!rows.length) {
						return done(null, false);
					}
					if (password !== rows[0].password)
						return done(null, false);
					return done(null, rows[0]);
				});
			}
		)
	);
};
