package com.samplefish.dao;

import com.samplefish.entity.Item;

public interface ItemDao {
	void saveItem(Item item);
	
	Item getItemById(int id);
	
	void deleteItem(Item item);

}
