package com.ssh.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssh.entity.Comments;
import com.ssh.entity.Medicine;
import com.ssh.entity.OrdersInfo;
import com.ssh.entity.Queries;
import com.ssh.entity.User;

@Repository
public class UserActionsImpl implements UserActions {
	@Autowired
	private SessionFactory sessionFactory;

	private Session getCurrentSession() {
		return this.sessionFactory.openSession();
	}

	public User login(User user) {
		Query query = getCurrentSession().createQuery("from User where username = ? and password =?");
		query.setParameter(0, user.getUsername());
		query.setParameter(1, user.getPassword());
		List<User> list = query.list();
		if (list.size() == 1)
			return list.get(0);
		return null;
	}

	private boolean checkUserName(String userName) {
		Query query = getCurrentSession().createQuery("from User where username = ?");
		query.setParameter(0, userName);
		List<User> list = query.list();
		if (list.size() == 1)
			return true;
		return false;
	}

	private boolean checkMedicineName(String mName) {
		Query query = getCurrentSession().createQuery("from Medicine where medicinename = ?");
		query.setParameter(0, mName);
		List<User> list = query.list();
		if (list.size() == 1)
			return true;
		return false;
	}

	public boolean register(User user) {
		if (checkUserName(user.getUsername())) {
			return false;
		}
		getCurrentSession().save(user);
		return true;
	}

	public ArrayList<Medicine> getAllMedicine() {
		Query query = getCurrentSession().createQuery("from Medicine");
		List<Medicine> list = query.list();
		ArrayList<Medicine> result = new ArrayList<Medicine>();
		if (list != null)
			result.addAll(list);
		return result;
	}

	public ArrayList<Medicine> getMedicineByName(String name) {
		Query query = getCurrentSession().createQuery("from Medicine where medicinename = ?");
		query.setParameter(0, name);
		List<Medicine> list = query.list();
		ArrayList<Medicine> result = new ArrayList<Medicine>();
		if (list != null)
			result.addAll(list);
		return result;

	}

	public User getUserByName(String userName) {
		Query query = getCurrentSession().createQuery("from User where username = ?");
		query.setParameter(0, userName);
		List<User> list = query.list();
		return list.get(0);
	}

	public void finishOrder(OrdersInfo order) {

		getCurrentSession().save(order);

	}

	public void updateStock(Medicine medicine) {
		String hql = "update Medicine me set me.stock = :stock where me.id= :id";
		Query query = getCurrentSession().createQuery(hql);
		query.setInteger("stock", medicine.getStock());
		query.setLong("id", medicine.getId());
		query.executeUpdate();
	}

	public void deleteMedicine(Medicine medicine) {
		String hql = "delete Medicine me where me.id= :id";
		Query query = getCurrentSession().createQuery(hql);
		query.setLong("id", medicine.getId());
		query.executeUpdate();
	}

	public ArrayList<OrdersInfo> getOrdersByName(String name) {
		Query query = getCurrentSession().createQuery("from OrdersInfo where uName = ?");
		query.setParameter(0, name);
		List<OrdersInfo> list = query.list();
		ArrayList<OrdersInfo> result = new ArrayList<OrdersInfo>();
		if (list != null)
			result.addAll(list);
		return result;
	}

	public ArrayList<Queries> getAllQueries() {
		Query query = getCurrentSession().createQuery("from Queries");
		List<Queries> list = query.list();
		ArrayList<Queries> result = new ArrayList<Queries>();
		if (list != null)
			result.addAll(list);
		return result;
	}

	public ArrayList<Comments> getCommentsByid(Long id) {
		Query query = getCurrentSession().createQuery("from Comments where qid = ?");
		query.setParameter(0, id);
		List<Comments> list = query.list();
		ArrayList<Comments> result = new ArrayList<Comments>();
		if (list != null)
			result.addAll(list);
		return result;
	}

	public void addComment(Comments com) {
		getCurrentSession().save(com);
	}

	public void addQuery(Queries que) {
		getCurrentSession().save(que);
	}

	public Queries getQueryByid(Long id) {
		Query query = getCurrentSession().createQuery("from Queries where id = ?");
		query.setParameter(0, id);
		List<Queries> list = query.list();
		return list.get(0);
	}

	public boolean add(Medicine me) {
		if (checkMedicineName(me.getMedicinename())) {
			return false;
		}
		getCurrentSession().save(me);
		return true;
	}
}
