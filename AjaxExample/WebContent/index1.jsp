<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
       <button onclick="fetch();">Fetch content</button>
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
            function fetch() {
        
                $.ajax({
                        
                       url:"fetch1.jsp",
                       dataType:"json",
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