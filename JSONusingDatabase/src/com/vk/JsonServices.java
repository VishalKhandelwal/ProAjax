package com.vk;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;

public class JsonServices {

	public static List<JSONObject> getFormattedResultSet(ResultSet rs)
	{
		List<JSONObject> resList = new ArrayList<JSONObject>();
		try {
			ResultSetMetaData rsMeta = rs.getMetaData();
			int columnCnt = rsMeta.getColumnCount();
			List<String> columnNames = new ArrayList<String>();
			
			for(int i=1;i<=columnCnt;i++)
			{
				columnNames.add(rsMeta.getColumnName(i).toUpperCase());
			}
			
			while(rs.next())
			{
				JSONObject object = new JSONObject();
				for(int i=1;i<=columnCnt;i++)
				{
					String key = columnNames.get(i-1);
					String value = rs.getString(i);
					object.put(key, value);
				}
				resList.add(object);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			try {
				rs.close();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return resList;
	}
	
}
