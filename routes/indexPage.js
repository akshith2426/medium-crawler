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
	const URL = `https://medium.com/search?q=${searchTag}`;
	// console.log(URL);
	// fetchData(URL).then((result) => {
	// 	const html = result.data;
		
	// 	const $ = cheerio.load(html);
	// 	$(".u-paddingTop20").each(function (index, postData) {
	// 		console.log(index)
	// 	});
	// });
	request(URL, function (err, res, body) {
    if(err)
    {
        console.log(err);
    }
    else
    {
        let $ = cheerio.load(body);  //loading of complete HTML body
		$(".u-paddingTop20").each(function (index, postData) {
			const $element = $(postData);
			const $title = $element.find("h3");
			const $responsesNumber = $element.find(".buttonSet a");
			const $postLink = $element.find(".postArticle-readMore a");
			const $authorName = $element.find(
			".postMetaInline-authorLockup a.u-accentColor--textDarken"
			);
			const $authorImage = $element.find('.u-relative img');
			const $publishDate = $element.find("time");
			const list = {
				title: $title.text(),
				responsesNumber: $responsesNumber.text(),
				postId: $postLink.attr("data-post-id"),
				authorImage: $authorImage.attr('src'),
				authorName: $authorName.text(),
				date: $publishDate.text(),
			};
			console.log(list);
	 	});
        
    }
});
	res.render('indexPage');

});

// fetchData(URL).then((result) => {
// 	const html = result.data;
// 	const $ = cheerio.load(html);
// 	const trendingArticles = $('.iw.ix.af > .aj.af > .ff.ar.bc.fg.fh.fi.fj.fk.fl.fm.fn.fo.fp.fq.fr.fs.ft.fu.fv> .gb.gc.gd.ge.gf.gg.gh.gi.gj.gk.gl.gm.gn.go.gp.gq.gr.gs.gt.gu.gv');
// 	trendingArticles.each(function () {
// 		let datafetch = $(this).find('div.aj.dn>.gw.dn.aj.ar.ff>.ar.do>p').text();
// 		console.log(datafetch);
// 	});
// });



async function fetchData(url){
	console.log(`Data from ${url} is being crawled`);
    let response = await axios(url).catch((err) => console.log(err));
	console.log("data traced out")
    if(response.status !== 200){
        console.log(`Error occured while fetching data from ${url}`);
        return;
    }
    return response;
}
module.exports = router;