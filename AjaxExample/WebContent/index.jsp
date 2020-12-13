<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AJAX JSON Example</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

</head>
<body>
<div style="text-align: center">
		<h1>Fetch data from database and convert into a json and read that json from javascript/jquery</h1>
	</div>


	<div
		style="margin: 0 auto; width: 700px; border: 1px solid green">
		<div style="margin: 10px">

			<button onclick="fetch();">Fetch content</button>

			<p id="status" style="color: darkgreen; text-align: left"></p>
			<p id="error" style="color: red; text-align: left"></p>

			<br />

			<table border="1px" width="500px;" id="datatable">
				<thead>
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Salary</th>
					</tr>
				</thead>
				<tbody id="content">

				</tbody>
			</table>
		</div>
	</div>
	
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

    function fetch()
    {
    	$.ajax({
    		beforeSend : function(){
    			$('#status').html("Status : Fetching Content");
    		},
    		cache : false,
    		type : "post",
    		url : "fetch.jsp",
    		dataType : "json",
    		success : function(res){
    			var data = "";
    			for(i=0;i<res.length;i++){
    				var p = JSON.parse(res[i]);
    				console.log(p);
    				data += "<tr><td>" + p.FirstName + "</td><td>"
    				       + p.LastName + "</td><td>" + p.Salary
    				       +"</td></tr>";
    			}
    			$('#status').html("Status : Content Fetched");
    			$('#content').html(data);
    		},
    		error : function() {
				$('#error').html("Status : Failed to fetch content");
			}
    	});
    }

</script>



</body>
</html>