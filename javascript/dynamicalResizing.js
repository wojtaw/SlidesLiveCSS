// JavaScript Document
window.setInterval(yourFunction3, 200);
var currentSize = 10;

function yourfunction() { 
	currentSize += 10;
	console.log(currentSize);
	$('#blockForResize').css({ width: currentSize, height: '300px' });
}


function yourFunction2() {
	sendData(800);	
}

function sendData(val){
	$('#blockForResize').css({ height: val });
	console.log(val);	
}