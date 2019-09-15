package com.samplefish.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.samplefish.dao.ItemDao;
import com.samplefish.entity.Item;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	ItemDao itemDao;
	
	@Override
	@Transactional
	public void saveItem(Item item) {
		itemDao.saveItem(item);

	}

	@Override
	@Transactional
	public Item getItemById(int id) {
		return itemDao.getItemById(id);
		
	}

	@Override
	@Transactional
	public void deleteItem(Item item) {
		itemDao.deleteItem(item);
		
	}

}
