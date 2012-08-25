// JavaScript Document
window.setInterval(yourfunction, 200);
var currentSize = 10;

function yourfunction() { 
	currentSize += 10;
	console.log(currentSize);
	$('#blockForResize').css({ width: currentSize, height: '300px' });
}