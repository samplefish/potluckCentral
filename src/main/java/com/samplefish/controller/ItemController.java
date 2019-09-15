package com.samplefish.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.samplefish.entity.Item;
import com.samplefish.entity.Potluck;
import com.samplefish.entity.User;
import com.samplefish.service.ItemService;
import com.samplefish.service.PotluckService;
import com.samplefish.service.UserService;

@Controller
public class ItemController {
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	PotluckService potluckService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/newItem")
	public String newItemForm(Model model) {
		Item item = new Item();
		/*
		Potluck retrievedPotluck = potluckService.getPotluckById(potluckId);
		
		item.setPotluck(retrievedPotluck);
		*/
		model.addAttribute("item", item);
		
		return "item-form";
	}
	
	@PostMapping("/saveItem")
	public String saveItem(@ModelAttribute("item") Item item, Principal principal, Model model, @RequestParam("potluck_id") long potluckId) {
		User user = userService.findByUserName(principal.getName());
		Potluck retrievedPotluck = potluckService.getPotluckById(potluckId);
		
		item.setPotluck(retrievedPotluck);
		item.setUser(user);
		itemService.saveItem(item);
		
		return "redirect:/showPotluckDetails?potluckId="+potluckId;
	}
	
	@GetMapping("/updateItem")
	public String updateItem(@RequestParam("itemId") int id, Model model, Principal principal){
		Item item = itemService.getItemById(id);
		User user = userService.findByUserName(principal.getName());
		
		if(item.getUser().getId() != user.getId() ) {
			return "access-denied";
		}

		model.addAttribute("item", item);
		
		return "item-update-form";
	}
	
	@PostMapping("/updateItemRequest")
	public String updateItemRequest(@ModelAttribute("item") Item item, Principal principal, Model model, @RequestParam("itemId") int itemId) {
		Item retrievedItem = itemService.getItemById(itemId);
		
		if(!retrievedItem.getUser().getUserName().equals(principal.getName())) {
			return "access-denied";
		}
		
		item.setPotluck(retrievedItem.getPotluck());
		item.setUser(userService.findByUserName(principal.getName()));
		
		itemService.saveItem(item);
		
		long potluckId = item.getPotluck().getId();
		
		return "redirect:/showPotluckDetails?potluckId="+potluckId;
	}
	
	@GetMapping("/deleteItem")
	public String deleteItem(@RequestParam("itemId") int id, Principal principal) {
		Item item = itemService.getItemById(id);
		User user = userService.findByUserName(principal.getName());
		
		if(item.getUser().getId() != user.getId() ) {
			return "access-denied";
		}
		
		long potluckId = item.getPotluck().getId();
		
		itemService.deleteItem(item);
		
		return "redirect:/showPotluckDetails?potluckId="+potluckId;
	}

}
