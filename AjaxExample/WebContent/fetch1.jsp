
<%@page import="java.sql.*"%>
<%@page import="org.json.*" %>

<% String name = request.getParameter("name");
    final String jdbcdriver="com.mysql.jdbc.Driver";
    final String url="jdbc:mysql://localhost:3306/world";
    final String user="root";
    final String pass="123456";
    
    Connection con = null;
    Statement stmt = null;
    ResultSet result = null;
        
    try{
        Class.forName(jdbcdriver);
        con = DriverManager.getConnection(url,user,pass);
    }catch(ClassNotFoundException e){
    }catch(SQLException e){}
    
    try{
        
        String query;
        
        stmt = con.createStatement();
        
        query = "SELECT * FROM city";
        result = stmt.executeQuery(query);
        
        if(!result.next()){
            out.print("0");
        }else{
            JSONArray array=new JSONArray();
            do{
                JSONObject obj = new JSONObject();
                obj.put("FirstName",result.getInt("ID"));
                obj.put("LastName",result.getString("Name"));
                obj.put("Location",result.getString("CountryCode"));
                array.put(obj.toString());
            }while(result.next());
            out.print(array);
        }
        
    }catch(SQLException e){
        out.print("Exception: "+e);
    }
    finally{
        if(stmt != null){
            try{
                stmt.close();
            }catch(SQLException e){}
        }
        if(con != null){
            try{
                con.close();
            }catch(SQLException e){}
        }
    }
%>

					