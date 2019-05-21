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
public class OrderService {
	@Autowired
	private UserActions userActions;

	public void finishOrder(String userName, String mName, int num, double price) {
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		OrdersInfo order = new OrdersInfo();
		order.setuName(userName);
		order.setStatus("Check at the warehouse");
		order.setmName(mName);
		order.setNum(num);
		order.setOrderTime(df.format(day));
		order.setTotalPrice(price * num);
		Medicine me = userActions.getMedicineByName(mName).get(0);
		me.setStock(me.getStock() - num);
		if (me.getStock() == 0)
			userActions.deleteMedicine(me);
		else
			userActions.updateStock(me);
		userActions.finishOrder(order);
	}

	public Pojo searchOrdersByName(String name) {
		Pojo pojo = new Pojo();
		pojo.setUser(userActions.getUserByName(name));
		pojo.setOrders(userActions.getOrdersByName(name));
		return pojo;
	}

}
