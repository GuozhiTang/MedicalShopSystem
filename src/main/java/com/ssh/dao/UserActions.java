package com.ssh.dao;

import java.util.ArrayList;

import com.ssh.entity.Comments;
import com.ssh.entity.Medicine;
import com.ssh.entity.OrdersInfo;
import com.ssh.entity.Queries;
import com.ssh.entity.User;

public interface UserActions {
	public User getUserByName(String userName);
	public User login(User user);
	public boolean register(User user);
	public ArrayList<Medicine> getAllMedicine();
	public ArrayList<Medicine> getMedicineByName(String name);
	public void finishOrder(OrdersInfo order);
	public void updateStock(Medicine medicine);
	public void deleteMedicine(Medicine medicine);
	public ArrayList<OrdersInfo> getOrdersByName(String name);
	public ArrayList<Queries> getAllQueries();
	public ArrayList<Comments> getCommentsByid(Long id);
	public void addComment(Comments com);
	public void addQuery(Queries que);
	public Queries getQueryByid(Long id);
	public boolean add(Medicine me);
}
