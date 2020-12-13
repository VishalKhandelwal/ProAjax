<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Learn Ajax</title>
</head>
<body>
<h1>Learn Ajax JQuery</h1>
<div id="output"></div>
<button id="clickMe">Click Here</button>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$('#clickMe').click(webData);
function webData(){
	$.ajax({
		method:'GET',
		url:'https://jsonplaceholder.typicode.com/posts/2',
		dataType:'json'
	})
	.done(output)
	.fail(function(){console.log("Error!");})
	}

function output(data){
	//console.log(data);
	$('#output').html('<h2>'+data.title+'</h2><p>'+data.body+'</p>')
}
</script>
</body>
</html>