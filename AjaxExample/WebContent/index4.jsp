<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
       <form name="employee">
<input type="text" name="name" id="name">
<input type="button" value="Search" onclick="showData();"/><br>
</form>
       <br/>
                
       <table border="1px" width="500px;">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Location</th>
				</tr>
			</thead>
			<tbody id="content"></tbody>
		</table>
	<script>

	
	function showData() {
		var value = document.getElementById('name').value; 
                $.ajax({
                        
                       url:"fetch4.jsp?name="+value,
                       dataType:"json",
                       type : "POST",
                       async : false,
                       success:function(res){
                          var data="";
                          for(i=0;i<res.length;i++){
                              var p=JSON.parse(res[i]);
                              data+="<tr><td>"+p.FirstName+"</td><td>"+p.LastName+"</td><td>"+p.Location+"</td></tr>";
                          }
                          $('#status').html("Status : Content fetched");
                          $('#content').html(data);
                       },
                       error:function() {
                           $alert("error occured");
                       }
                   });
           }
        </script>
    </body>
</html>