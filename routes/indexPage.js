const express = require('express');
const bodyParser = require('body-parser');
const router = express.Router();
const cheerio = require('cheerio');
const axios = require('axios');
const request = require('request');
var postsLists = [];

router.get('/', (req, resp) => {
	resp.render('indexPage');
});
router.post('/search',async  function (req, res){
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
				console.log($relatedTagName.text());
			})
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
				const list = {
					title: $title.text(),
					responses: $responses.text(),
					link: $link.attr("data-post-id"),
					author: $author.text(),
					date: $publishDate.text(),
					readingTime: $readingTime.attr("title")
				};
				postsLists.push(list);
			});
		}
		console.log(postsLists);
		console.log("**********************************");
		
	});
	
	res.render('indexPage');
	
});



module.exports = router;