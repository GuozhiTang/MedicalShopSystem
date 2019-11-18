package com.ssh.entity;

import java.util.ArrayList;

public class Pojo {
	private User user;
	private ArrayList<Medicine> medicines;
	private ArrayList<OrdersInfo> orders;
	private ArrayList<Queries> queries;
	private ArrayList<Comments> comments;
	private Queries oneQuery;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public ArrayList<Medicine> getMedicines() {
		return medicines;
	}
	public void setMedicines(ArrayList<Medicine> medicines) {
		this.medicines = medicines;
	}
	public ArrayList<OrdersInfo> getOrders() {
		return orders;
	}
	public void setOrders(ArrayList<OrdersInfo> orders) {
		this.orders = orders;
	}
	public ArrayList<Queries> getQueries() {
		return queries;
	}
	public void setQueries(ArrayList<Queries> queries) {
		this.queries = queries;
	}
	public ArrayList<Comments> getComments() {
		return comments;
	}
	public void setComments(ArrayList<Comments> comments) {
		this.comments = comments;
	}
	public Queries getOneQuery() {
		return oneQuery;
	}
	public void setOneQuery(Queries oneQuery) {
		this.oneQuery = oneQuery;
	}
	
}	
