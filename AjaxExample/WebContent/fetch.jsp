<%@page import="java.sql.*"%>
<%@page import="org.json.*"%>
<%
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

		query = "SELECT * FROM employees";
		result = stmt.executeQuery(query);

		if (!result.next()) {
			out.print("0");
		} else {
			JSONArray array = new JSONArray();
			do {
				JSONObject obj = new JSONObject();
				obj.put("FirstName", result.getString("FIRST_NAME"));
				obj.put("LastName", result.getString("LAST_NAME"));
				obj.put("Salary", result.getString("SALARY"));
				array.put(obj.toString());
			} while (result.next());
			out.print(array);
			System.out.print(array);
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
