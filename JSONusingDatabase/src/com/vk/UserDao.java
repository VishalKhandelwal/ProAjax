package com.vk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {

	DbConnection dbConnection = new DbConnection();
	private static final String SQL="select * from users";
	Connection con = null;
	PreparedStatement pst = null;
	ResultSet resultSet = null;
	
	public ResultSet getResultSet()
	{
		try
		{
			con = dbConnection.setConnection();
			pst = con.prepareStatement(SQL);
			resultSet = pst.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println("Something went wrong in getResultset()");
			e.printStackTrace();
		}
		return resultSet;
	}
}
