package com.samplefish.dao;

import java.util.List;

import com.samplefish.entity.Potluck;

public interface PotluckDao {
		public List<Potluck> getCurrentUserPotlucks(String name);
		
		public void savePotluck(Potluck potluck);
		
		public Potluck getPotluckById(long id);
		
		void deletePotluck(long id);
		
		public Potluck getPotluckByInvite(String invite);
}
