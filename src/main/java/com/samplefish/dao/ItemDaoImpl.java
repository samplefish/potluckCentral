package com.samplefish.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.samplefish.entity.Item;

@Repository
public class ItemDaoImpl implements ItemDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void saveItem(Item item) {
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(item);

	}

	@Override
	public Item getItemById(int id) {
		Session session = sessionFactory.getCurrentSession();
		
		return session.get(Item.class, id);
	}

	@Override
	public void deleteItem(Item item) {
		Session session = sessionFactory.getCurrentSession();
		
		session.delete(item);
		
	}

}
