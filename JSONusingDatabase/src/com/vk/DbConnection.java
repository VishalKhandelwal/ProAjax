package com.vk;

import java.sql.Connection;
import java.sql.DriverManager;

import static com.vk.DBProperty.*;

public class DbConnection {

	Connection con;

	public DbConnection() {
		try
		{
		Class.forName(DB_Class);
		System.out.println("Oracle Driver Loaded Successfully");
		}
		catch(Exception e)
		{
		   System.out.println("Unable to load the driver");
		}
		
	}
	
	public Connection setConnection()
	{
		try {
			con = DriverManager.getConnection(DB_URL, DB_User, DB_Pass);
			System.out.println("Database connection successful");
			return con;
			
		}
		catch(Exception e)
		{
			System.out.println("Exception occured");
			e.printStackTrace();
			return null;
		}
	}
	
}
