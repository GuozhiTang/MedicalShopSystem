package com.ssh.entity;

import javax.persistence.*;

import lombok.Data;

@Data
@Entity
@Table(name = "OrdersInfo")
public class OrdersInfo {
	@Id
	@GeneratedValue
	private Long id;

	@Column(name = "uName")
	private String uName;

	@Column(name = "mName")
	private String mName;

	@Column(name = "num")
	private int num;

	@Column(name = "totalPrice")
	private double totalPrice;

	@Column(name = "orderTime")
	private String orderTime;

	@Column(name = "status")
	private String status;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
