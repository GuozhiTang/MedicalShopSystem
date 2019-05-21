package com.ssh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssh.dao.UserActions;
import com.ssh.entity.Medicine;
import com.ssh.entity.Pojo;
import com.ssh.entity.User;

@Service
public class SearchService {
	@Autowired
	private UserActions userActions;
	public Pojo searchAllMedicine(String userName)
	{
		Pojo pojo=new Pojo();
		pojo.setUser(userActions.getUserByName(userName));
		pojo.setMedicines(userActions.getAllMedicine());
		return pojo;
	}
	public Pojo searchMedicineByName(String userName,String name)
	{
		Pojo pojo=new Pojo();
		pojo.setUser(userActions.getUserByName(userName));
		pojo.setMedicines(userActions.getMedicineByName(name));
		return pojo;
	}
	
}
