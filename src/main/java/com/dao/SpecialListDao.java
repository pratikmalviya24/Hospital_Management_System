package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.SpecialList;

public class SpecialListDao {
	private Connection connection;

	public SpecialListDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addSpecialList(String speciallist) {
		boolean flag = false;
		try {
			String sql = "insert into SpecialList(name) values(?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, speciallist);

			int status = statement.executeUpdate();
			if (status > 0)
				flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}
	
	public List<SpecialList> getAllSpecialList(){
		List<SpecialList> specialListsNameList = new ArrayList<SpecialList>();
		SpecialList specialList = null;
		try {
			String sqlString = "select * from SpecialList";
			PreparedStatement statement = connection.prepareStatement(sqlString);
			ResultSet resultSet = statement.executeQuery();
			
			while(resultSet.next()) {
				specialList  = new SpecialList();
				specialList.setSpecialistName(resultSet.getString(1));
				specialListsNameList.add(specialList);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return specialListsNameList;
	}
}
