package com.vk;

import com.vk.JsonServices;
import com.vk.UserDao;
import java.sql.ResultSet;
import java.util.List;

import org.json.simple.JSONObject;

public class Main {
	
	ResultSet resultSet = null;
	UserDao userDao = new UserDao();
	public List<JSONObject> getJsonObject()
	{
		resultSet = userDao.getResultSet();
		List<JSONObject> resList = JsonServices.getFormattedResultSet(resultSet);
		return resList;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Main m = new Main();
		List<JSONObject> jObj = m.getJsonObject();
		
		for(int i=0;i<jObj.size();i++)
		{
			System.out.println(jObj.get(i));
		}
	}

}
