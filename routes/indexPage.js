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
router.post('/search',  function (req, res){

	const searchTag=req.body.searchField;
	const URL = `https://medium.com/tag/${searchTag}/latest`;
	request(URL, function (err, res, body) {
    if(err)
    {
        console.log(err);
    }
    else
    {
        let $ = cheerio.load(body);  //loading of complete HTML body
		// $(".u-paddingTop20").each(function (index, postData) {
		// 	const $element = $(postData);
		// 	const $title = $element.find("h3");
		// 	const $responsesNumber = $element.find(".buttonSet a");
		// 	const $postLink = $element.find(".postArticle-readMore a");
		// 	const $authorName = $element.find(
		// 	".postMetaInline-authorLockup a.u-accentColor--textDarken"
		// 	);
		// 	const $authorImage = $element.find('.u-relative img');
		// 	const $publishDate = $element.find("time");
		// 	const list = {
		// 		title: $title.text(),
		// 		responsesNumber: $responsesNumber.text(),
		// 		postId: $postLink.attr("data-post-id"),
		// 		authorImage: $authorImage.attr('src'),
		// 		authorName: $authorName.text(),
		// 		date: $publishDate.text(),
		// 	};
		// 	console.log(list);
	 	// });
		
		
		
		// console.log($('.ae.gk'));
		// $(".ae.gk").each(function (index, postData) {
		// 	const $element = $(postData);
		// 	const $authorName = $element.find('.ay.hj.dj.hk.ez.hl.fb.fc.fd.fe.ff.bb.hm');
		// 		const list = {
		// 			authorName: $authorName.text()
		// 		}
		// 		console.log(list);
			
		// });

		//getting tag name and related tags
		const $tag = $(".ap.aq.l");
		const $tagName = $tag.find("h2")
		console.log($tagName.text());

		$(".t.bk.do a").each(function (index, relatedTag) {
			const $rTagName = $(relatedTag);
			const $relatedTagName = $rTagName.find(".di");
			console.log($relatedTagName.text());
		})

    }
});
	res.render('indexPage');

});

module.exports = router;