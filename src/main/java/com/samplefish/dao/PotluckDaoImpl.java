package com.samplefish.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.samplefish.entity.Potluck;
import com.samplefish.entity.User;

@Repository
public class PotluckDaoImpl implements PotluckDao {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Potluck> getCurrentUserPotlucks(String name) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<User> userQuery = currentSession.createQuery("from User where userName=:userName", User.class);
		userQuery.setParameter("userName", name);
		
		User currUser = userQuery.getSingleResult();

		// now retrieve/read from database using name
		Query<Potluck> theQuery = currentSession.createQuery("from Potluck where owner=:userName", Potluck.class);
		theQuery.setParameter("userName", currUser);
		
		List<Potluck> list = null;
		
		try {
			list = theQuery.getResultList();
		} catch (Exception e) {
			list = null;
		}
		
		return list;
	}
	
	@Override
	public void savePotluck(Potluck potluck) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(potluck);
		
	}

	@Override
	public Potluck getPotluckById(long id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Potluck potluck = currentSession.get(Potluck.class, id);
		
		Hibernate.initialize(potluck.getItems());
		
		return potluck;
	}
	
	@Override
	public void deletePotluck(long id) {
		Session session = sessionFactory.getCurrentSession();
		
		session.delete(session.get(Potluck.class, id));
		
		
	}

	@Override
	public Potluck getPotluckByInvite(String invite) {
		Session session = sessionFactory.getCurrentSession();
		
		Query<Potluck> query = session.createQuery("from Potluck where inviteCode=:inviteCode", Potluck.class);
		query.setParameter("inviteCode", invite);
		try {
			return query.getSingleResult();
		}
		catch(NoResultException e){
			return null;
		}
		//return query.getSingleResult();
	}

}
