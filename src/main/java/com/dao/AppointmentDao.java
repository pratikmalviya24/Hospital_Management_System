package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection connection;

	public AppointmentDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addAppointment(Appointment app) {
		boolean flag = false;

		try {
			String sql = "insert into Appointment(user_id,fullName,age,appointmentDate,email,mobileNumber,diseases,doctorId,address,status) values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, app.getUserId());
			statement.setString(2, app.getFullName());
			statement.setString(3, app.getAge());
			statement.setString(4, app.getAppointmenDate());
			statement.setString(5, app.getEmail());
			statement.setString(6, app.getMobileNumber());
			statement.setString(7, app.getDiseases());
			statement.setInt(8, app.getDoctorId());
			statement.setString(9, app.getAddress());
			statement.setString(10, app.getStatus());
			int status = statement.executeUpdate();
			if (status > 0)
				flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public List<Appointment> getAllAppointment(int userId) {
		List<Appointment> result = new ArrayList<Appointment>();

		Appointment appointment = null;

		try {

			String sql = "select * from Appointment where user_id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, userId);
			ResultSet rSet = statement.executeQuery();

			while (rSet.next()) {
				appointment = new Appointment();

				appointment.setId(rSet.getInt(1));
				appointment.setUserId(rSet.getInt(2));
				appointment.setFullName(rSet.getString(3));
				appointment.setAge(rSet.getString(4));
				appointment.setAppointmenDate(rSet.getString(5));
				appointment.setEmail(rSet.getString(6));
				appointment.setMobileNumber(rSet.getString(7));
				appointment.setDiseases(rSet.getString(8));
				appointment.setDoctorId(rSet.getInt(9));
				appointment.setAddress(rSet.getString(10));
				appointment.setStatus(rSet.getString(11));

				result.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	public List<Appointment> getAllAppointmentByDoctor(int doctor_id) {
		List<Appointment> result = new ArrayList<Appointment>();

		Appointment appointment = null;

		try {

			String sql = "select * from Appointment where doctorId=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, doctor_id);
			ResultSet rSet = statement.executeQuery();

			while (rSet.next()) {
				appointment = new Appointment();

				appointment.setId(rSet.getInt(1));
				appointment.setUserId(rSet.getInt(2));
				appointment.setFullName(rSet.getString(3));
				appointment.setAge(rSet.getString(4));
				appointment.setAppointmenDate(rSet.getString(5));
				appointment.setEmail(rSet.getString(6));
				appointment.setMobileNumber(rSet.getString(7));
				appointment.setDiseases(rSet.getString(8));
				appointment.setDoctorId(rSet.getInt(9));
				appointment.setAddress(rSet.getString(10));
				appointment.setStatus(rSet.getString(11));

				result.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
	
	
	public Appointment getAppointmentById(int id) {


		Appointment appointment = null;

		try {

			String sql = "select * from Appointment where id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet rSet = statement.executeQuery();

			while (rSet.next()) {
				appointment = new Appointment();

				appointment.setId(rSet.getInt(1));
				appointment.setUserId(rSet.getInt(2));
				appointment.setFullName(rSet.getString(3));
				appointment.setAge(rSet.getString(4));
				appointment.setAppointmenDate(rSet.getString(5));
				appointment.setEmail(rSet.getString(6));
				appointment.setMobileNumber(rSet.getString(7));
				appointment.setDiseases(rSet.getString(8));
				appointment.setDoctorId(rSet.getInt(9));
				appointment.setAddress(rSet.getString(10));
				appointment.setStatus(rSet.getString(11));
 

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appointment;
	}	
	
	public boolean updateCommentStatus(int id,int doctorId,String comment) {
		boolean flag = false;
		
		try {
			String sql =  "update appointment set status=? where id=? and doctorId=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			
			statement.setString(1, comment);
			statement.setInt(2, id);
			statement.setInt(3, doctorId);
			
			int status = statement.executeUpdate();
			if(status>0) flag = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public List<Appointment> getAllAppointment() {
		List<Appointment> result = new ArrayList<Appointment>();

		Appointment appointment = null;

		try {

			String sql = "select * from Appointment";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet rSet = statement.executeQuery();

			while (rSet.next()) {
				appointment = new Appointment();

				appointment.setId(rSet.getInt(1));
				appointment.setUserId(rSet.getInt(2));
				appointment.setFullName(rSet.getString(3));
				appointment.setAge(rSet.getString(4));
				appointment.setAppointmenDate(rSet.getString(5));
				appointment.setEmail(rSet.getString(6));
				appointment.setMobileNumber(rSet.getString(7));
				appointment.setDiseases(rSet.getString(8));
				appointment.setDoctorId(rSet.getInt(9));
				appointment.setAddress(rSet.getString(10));
				appointment.setStatus(rSet.getString(11));

				result.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	
	
	
}
