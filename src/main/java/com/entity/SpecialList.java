package com.entity;

public class SpecialList {
	private int id;
	private String specialistName;
	
	public SpecialList(int id, String specialistName) {
		super();
		this.id = id;
		this.specialistName = specialistName;
	}
	public SpecialList() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSpecialistName() {
		return specialistName;
	}
	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}
	
}
