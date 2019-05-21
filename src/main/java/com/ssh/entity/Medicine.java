package com.ssh.entity;

import javax.persistence.*;

import lombok.Data;
@Data
@Entity
@Table(name = "Medicine")
public class Medicine {
	@Id
	@GeneratedValue
	private Long id;

	@Column(name = "medicinename")
	private String medicinename;

	@Column(name = "price")
	private double price;

	@Column(name = "stock")
	private int stock;

	@Column(name = "des")
	private String des;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getMedicinename() {
		return medicinename;
	}

	public void setMedicinename(String medicinename) {
		this.medicinename = medicinename;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
	
}
