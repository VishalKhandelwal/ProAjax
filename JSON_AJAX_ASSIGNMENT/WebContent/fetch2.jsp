<%@page import="java.sql.*"%>
<%@page import="org.json.*"%>
<%
String name = request.getParameter("name");
	final String jdbcdriver = "oracle.jdbc.driver.OracleDriver";
	final String url = "jdbc:oracle:thin:@localhost:1521:XE";
	final String user = "hr";
	final String pass = "hr";

	Connection con = null;
	Statement stmt = null;
	ResultSet result = null;

	try {
		Class.forName(jdbcdriver);
		con = DriverManager.getConnection(url, user, pass);
		if (con != null) {
			System.out.println("Connected");
		}
	} catch (ClassNotFoundException e) {
	} catch (SQLException e) {
	}

	try {

		String query;

		stmt = con.createStatement();

		query = "SELECT * FROM PRODUCT where PRODUCT_NAME like '"+name+"%'";
		result = stmt.executeQuery(query);

		if (!result.next()) {
			out.print("0");
		} else {
			JSONArray array = new JSONArray();
			do {
				JSONObject obj = new JSONObject();
				obj.put("PID", result.getInt("PRODUCT_ID"));
				obj.put("PNAME", result.getString("PRODUCT_NAME"));
				obj.put("PQUANTITY", result.getInt("PRODUCT_QUANTITY"));
				obj.put("PPRICE", result.getInt("PRODUCT_PRICE"));
				array.put(obj.toString());
			} while (result.next());
			out.print(array);
		}

	} catch (SQLException e) {
		out.print("Exception: " + e);
	} finally {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}
%>
