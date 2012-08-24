var px_scroll_amt = 10;
var xhr_support = Boolean(window.XMLHttpRequest !== undefined);


//Relative paths to background slideshow images
var imgArr = new Array(
	'backgrounds/bg1.jpg',
	'backgrounds/bg2.jpg',
	'backgrounds/bg3.jpg',
	'backgrounds/bg4.jpg',
	'backgrounds/bg5.jpg',
	'backgrounds/bg6.jpg'
	);
//Current background image ID
var currImg = 1;
//Preloaded images
var preloadArr = new Array();	


$(document).scroll(calculateAndModifyParallax);
$(document).ready(documentConstructor);
 	
	
function documentConstructor()
{
	preloadBackgroundImages();
	//Run timer for background slideshow
	var intID = setInterval(changeImg, 6000);
}

function changeImg(){
	$(".websiteBackground").animate({opacity: 0}, 1000, function(){
	$(".websiteBackground").css('background','url(' + preloadArr[currImg++%preloadArr.length].src +')');
	calculateAndModifyParallax();
	}).animate({opacity: 1}, 1000);
}

function preloadBackgroundImages(){
 var i;
 for(i=0; i < imgArr.length; i++){
 preloadArr[i] = new Image();
 preloadArr[i].src = imgArr[i];
 }	
}

function calculateAndModifyParallax()
{
	var totalHeight = $(document).height();
	var scrollTop = $(document).scrollTop();
	var backgroundHeight = 1500-920;
	var calculatedPosition = scrollTop * (backgroundHeight / totalHeight);
//	var calculatedPosition = (scrollTop / totalHeight)*backgroundHeight;	
	$("#result").text( "scroll result: "+calculatedPosition+" bg height"+backgroundHeight);
	$(".websiteBackground").css("background-position", "center -"+calculatedPosition+"px");
}

