package com.ssh.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.dao.UserActions;
import com.ssh.entity.Comments;
import com.ssh.entity.Medicine;
import com.ssh.entity.OrdersInfo;
import com.ssh.entity.Pojo;
import com.ssh.entity.Queries;

@Service
public class QueriesService {
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

	public Pojo searchAllQueries(String name) {
		Pojo pojo = new Pojo();
		pojo.setUser(userActions.getUserByName(name));
		pojo.setQueries(userActions.getAllQueries());
		return pojo;
	}

	public Pojo searchCommentsByid(String username,Long id) {
		Pojo pojo = new Pojo();
		pojo.setUser(userActions.getUserByName(username));
		pojo.setComments(userActions.getCommentsByid(id));
		pojo.setOneQuery(userActions.getQueryByid(id));
		return pojo;
	}

	public void addComment(Long qid, String userName, String content) {
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Comments com=new Comments();
		com.setqId(qid);
		com.setContent(content);
		com.setCtime(df.format(day));
		com.setUsername(userName);
		userActions.addComment(com);
		
	}

	public void addQuery(String userName, String query) {
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Queries que=new Queries();
		que.setContent(query);
		que.setqTime(df.format(day));
		que.setUsername(userName);
		userActions.addQuery(que);		
	}

}
