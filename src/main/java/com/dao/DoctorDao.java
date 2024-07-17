package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Doctor;

public class DoctorDao {
	private Connection connection;

	public DoctorDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addDoctor(Doctor doctor) {
		boolean flag = false;

		try {

			String query = "insert into Doctor(name,dob,qualification,specialist,email,mobileNumber,password) values(?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, doctor.getFullName());
			statement.setString(2, doctor.getDob());
			statement.setString(3, doctor.getQualification());
			statement.setString(4, doctor.getSpecialist());
			statement.setString(5, doctor.getEmail());
			statement.setString(6, doctor.getMobileNumber());
			statement.setString(7, doctor.getPassword());

			int status = statement.executeUpdate();
			if (status > 0) {
				flag = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	public List<Doctor> getDoctorList() {
		List<Doctor> doctors = new ArrayList<Doctor>();
		Doctor doctor = null;
		try {
			String sql = "select * from Doctor order by id desc";
			PreparedStatement statement = connection.prepareStatement(sql);

			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				doctor = new Doctor();
				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setDob(resultSet.getString(3));
				doctor.setQualification(resultSet.getString(4));
				doctor.setSpecialist(resultSet.getString(5));
				doctor.setEmail(resultSet.getString(6));
				doctor.setMobileNumber(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));

				doctors.add(doctor);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return doctors;
	}

	public Doctor getDoctorbyDoctorsID(int id) {
		Doctor doctor = null;
		try {
			String sql = "select * from Doctor where id=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet resultSet = statement.executeQuery();

			while (resultSet.next()) {
				doctor = new Doctor();
				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setDob(resultSet.getString(3));
				doctor.setQualification(resultSet.getString(4));
				doctor.setSpecialist(resultSet.getString(5));
				doctor.setEmail(resultSet.getString(6));
				doctor.setMobileNumber(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return doctor;
	}

	public boolean updateDoctor(Doctor doctor) {
		boolean flag = false;

		try {

			String query = "update Doctor set name=?,dob=?,qualification=?,specialist=?,email=?,mobileNumber=?,password=? where id=?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, doctor.getFullName());
			statement.setString(2, doctor.getDob());
			statement.setString(3, doctor.getQualification());
			statement.setString(4, doctor.getSpecialist());
			statement.setString(5, doctor.getEmail());
			statement.setString(6, doctor.getMobileNumber());
			statement.setString(7, doctor.getPassword());
			statement.setInt(8, doctor.getId());
			int status = statement.executeUpdate();
			if (status > 0) {
				flag = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	public boolean deleteDoctor(int id) {
		boolean flag = false;
		try {

			String query = "delete from Doctor where id=?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			int status = statement.executeUpdate();
			if (status > 0) {
				flag = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	public Doctor doctorLogin(String email, String password) {
		Doctor doctor = null;

		try {
			String sql = "select * from Doctor where email=? and password=?";

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, email);
			statement.setString(2, password);

			ResultSet resultSet = statement.executeQuery();
			if (resultSet.next()) {
				doctor = new Doctor();
				doctor.setId(resultSet.getInt(1));
				doctor.setFullName(resultSet.getString(2));
				doctor.setDob(resultSet.getString(3));
				doctor.setQualification(resultSet.getString(4));
				doctor.setSpecialist(resultSet.getString(5));
				doctor.setEmail(resultSet.getString(6));
				doctor.setMobileNumber(resultSet.getString(7));
				doctor.setPassword(resultSet.getString(8));
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return doctor;
	}

	public int getTotalDoctors() {
		int cnt = 0;
		try {
			String sql = "select * from Doctor";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				cnt++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return cnt;
	}

	public int getTotalAppointment() {
		int cnt = 0;
		try {
			String sql = "select * from Appointment";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				cnt++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return cnt;
	}

	public int getTotalAppointmentByDoctorId(int id) {
		int cnt = 0;
		try {
			String sql = "select * from Appointment where doctorId=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				cnt++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return cnt;
	}

	public int getTotalUser() {
		int cnt = 0;
		try {
			String sql = "select * from User";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				cnt++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return cnt;
	}

	public int getTotalSpecialList() {
		int cnt = 0;
		try {
			String sql = "select * from SpecialList";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				cnt++;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return cnt;
	}

	public boolean checkOldPassword(int doctorId, String oldPassword) {
		boolean flag = false;

		try {
			String sqlString = "select * from Doctor where id=? and password=?";
			PreparedStatement statement = connection.prepareStatement(sqlString);
			statement.setInt(1, doctorId);
			statement.setString(2, oldPassword);

			ResultSet rs = statement.executeQuery();

			if (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

	public boolean updateUserPassword(int userId, String newPassword) {
		boolean flag = false;

		try {
			String sqlString = "update Doctor set password=? where id=?";
			PreparedStatement statement = connection.prepareStatement(sqlString);
			statement.setString(1, newPassword);
			statement.setInt(2, userId);

			int i = statement.executeUpdate();

			if (i > 0) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}
	
	public boolean editProfile(Doctor doctor) {
		boolean flag = false;

		try {

			String query = "update Doctor set name=?,dob=?,qualification=?,specialist=?,email=?,mobileNumber=?where id=?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, doctor.getFullName());
			statement.setString(2, doctor.getDob());
			statement.setString(3, doctor.getQualification());
			statement.setString(4, doctor.getSpecialist());
			statement.setString(5, doctor.getEmail());
			statement.setString(6, doctor.getMobileNumber());
			statement.setInt(7, doctor.getId());
			int status = statement.executeUpdate();
			if (status > 0) {
				flag = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return flag;
	}

}
