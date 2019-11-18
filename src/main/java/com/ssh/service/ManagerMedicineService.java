package com.ssh.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.dao.UserActions;
import com.ssh.entity.Medicine;
import com.ssh.entity.OrdersInfo;
import com.ssh.entity.Pojo;

@Service
public class ManagerMedicineService {
	@Autowired
	private UserActions userActions;

	public void delete(String name) {
		Medicine me = userActions.getMedicineByName(name).get(0);
		userActions.deleteMedicine(me);
	}

	public Pojo searchOrdersByName(String name) {
		Pojo pojo = new Pojo();
		pojo.setUser(userActions.getUserByName(name));
		pojo.setOrders(userActions.getOrdersByName(name));
		return pojo;
	}

	public boolean add(Medicine me) {
		return userActions.add(me);

	}

}
