package com.samplefish.service;

import com.samplefish.entity.Item;

public interface ItemService {
	
	void saveItem(Item item);
	
	Item getItemById(int id);
	
	void deleteItem(Item item);

}
