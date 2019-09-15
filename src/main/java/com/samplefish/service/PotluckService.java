package com.samplefish.service;

import java.util.List;

import com.samplefish.entity.Potluck;

public interface PotluckService {
	
	List<Potluck> getCurrentUserPotlucks(String name);
	
	void savePotluck(Potluck potluck);
	
	Potluck getPotluckById(long id);
	
	void deletePotluck(long id);
	
	Potluck getPotluckByInvite(String invite);
}
