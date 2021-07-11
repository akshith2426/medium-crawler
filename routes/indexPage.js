const express = require('express');
const bodyParser = require('body-parser');
const router = express.Router();
const cheerio = require('cheerio');
const request = require('request');
const mysql = require('mysql');
var articleLists = [];
var relatedTagsList = [];
const { isLoggedIn, forwardAuthenticated } = require('../config/auth');
//mysql connection
var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'medium-crawler',
	multipleStatements: true
});
con.connect(function(error) {
	if (error) throw error;
	console.log('MySQL Database Connected for Inserting Data Routes');
});

router.get('/', (req, resp) => {
	resp.render('indexPage');
});
router.post('/search', async function (req, res) {
	const userID = req.user.id;
	const searchTag=req.body.searchField;
	const URL = `https://medium.com/search?q=${searchTag}`;
	const URL1 = `https://medium.com/tag/${searchTag}/latest`;
	request(URL1, function (err, res, body) {
		if (err) {
			console.log(err);
		}
		else {
			let $ = cheerio.load(body);
			console.log("**********************************");
			console.log("Searched Tag Name :- ")
			//getting tag name and related tags
			const $tag = $(".ap.aq.l");
			const $tagName = $tag.find("h2")
			console.log($tagName.text());
			console.log("**********************************");
			console.log("Related Tag Names :- ")
			$(".t.bk.do a").each(function (index, relatedTag) {
				const $rTagName = $(relatedTag);
				const $relatedTagName = $rTagName.find(".di");
				relatedTagsList.push($relatedTagName.text());
			})
		}
		console.log(relatedTagsList);
		for (var k = 0; k < relatedTagsList.length; k++){
			var insertQuery = 'INSERT INTO relatedtags(searchedTagName,relatedTagName,userID) values(?,?,?)';
			con.query(insertQuery, [searchTag, relatedTagsList[k], userID], function (error, result) {
				if (error) {
					console.log(error);
				}
			});
		}
	});
	request(URL, function (err, res, body) {
		if (err) {
			console.log(err);
		}
		else {
			let $ = cheerio.load(body);
			console.log("**********************************");
			console.log(`Articles List on ${searchTag} :-`)
			$(".u-paddingTop20").each(function (i, element) {
				const $element = $(element);
				const $title = $element.find("h3");
				const $responses = $element.find(".buttonSet a");
				const $link = $element.find(".postArticle-readMore a");
				const $author = $element.find(".postMetaInline-authorLockup a.u-accentColor--textDarken");
				const $publishDate = $element.find("time");
				const $readingTime = $element.find(".readingTime");
				const $articleLink = $element.find(".postArticle-readMore a");
				const list = {
					title: $title.text(),
					responses: $responses.text(),
					link: $link.attr("data-post-id"),
					author: $author.text(),
					date: $publishDate.text(),
					readingTime: $readingTime.attr("title"),
					articleLink:$articleLink.attr("href")
				};
				articleLists.push(list);
			});
		}
		for (var i = 0; i < articleLists.length; i++){
			var insertSearchHistory = 'INSERT INTO postdetails (postTitle,postAuthor,postResponses,postLinkID,postDate,postLink,postReadingTime,userID) values (?,?,?,?,?,?,?,?)';
			con.query(insertSearchHistory, [articleLists[i].title, articleLists[i].author, articleLists[i].responses, articleLists[i].link,
			articleLists[i].date,
			articleLists[i].articleLink,
			articleLists[i].readingTime, userID], function (wrong, answer) {
				if (wrong) {
					console.log(wrong);
				}
			})
		}
		console.log(articleLists);
	});
	
	res.redirect('searchHistory');
	
});

router.get('/searchHistory',isLoggedIn, (req, res) => {
	var userId = req.user.id;
	var historyQuery = 'SELECT * FROM postdetails WHERE userID =?';
	con.query(historyQuery, [userId], function (err, result) {
		if (err) {
			console.log(err);
		}
		var tagshistory = 'SELECT * FROM relatedtags WHERE userID=?';
		con.query(tagshistory, [userId], function (errs, results) {
			if (errs) {
				console.log(err);
			}
			res.render('searchHistory', { result: result,results:results });
		})
		
	});
	
})

module.exports = router;