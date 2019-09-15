package com.samplefish.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.samplefish.dao.PotluckDao;
import com.samplefish.entity.Potluck;

@Service
public class PotluckServiceImpl implements PotluckService {

	@Autowired
	private PotluckDao potluckDao;
	
	@Override
	@Transactional
	public List<Potluck> getCurrentUserPotlucks(String name) {
		return potluckDao.getCurrentUserPotlucks(name);
	}
	
	@Override
	@Transactional
	public void savePotluck(Potluck potluck) {
		potluckDao.savePotluck(potluck);
	}

	@Override
	@Transactional
	public Potluck getPotluckById(long id) {
		return potluckDao.getPotluckById(id);
	}

	@Override
	@Transactional
	public void deletePotluck(long id) {
		potluckDao.deletePotluck(id);
		
	}

	@Override
	@Transactional
	public Potluck getPotluckByInvite(String invite) {
		return potluckDao.getPotluckByInvite(invite);
	}

}
