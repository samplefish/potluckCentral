package com.samplefish.controller;

import java.security.Principal;
import java.security.SecureRandom;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import org.hibernate.SessionFactory;
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
public class PotluckController {
	
	@Autowired
	private PotluckService potluckService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ItemService itemService;
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@GetMapping("/mypotlucks")
	public String getMyPotlucks(Model model, Principal principal) {
		model.addAttribute("potlucks", potluckService.getCurrentUserPotlucks(principal.getName()));
		
		
		return "mypotlucks";
	}
	
	@GetMapping("/myjoinedpotlucks")
	public String getJoinedPotlucks(Model model, Principal principal) {
		User currentUser = userService.findByUserName(principal.getName());
		
		model.addAttribute("potlucks",currentUser.getJoinedPotlucks());

		
		return "myjoinedpotlucks";
	}
	
	@GetMapping("/newPotluck")
	public String newPotluck(Model model)
	{
		Potluck potluck = new Potluck();
		
		model.addAttribute("potluck", potluck);
		
		return "potluck-form";
	}
	
	@PostMapping("/savePotluck")
	public String savePotluck(@ModelAttribute("potluck") Potluck potluck, Principal principal) {
		
		potluck.setOwner(userService.findByUserName(principal.getName()));
		
		potluck.setInviteCode(generateInviteCode());
		
		//save the customer
		potluckService.savePotluck(potluck);
		
		return "redirect:/mypotlucks";
	}
	
	@GetMapping("/showFormForUpdate")
	public String updatePotluck(@RequestParam("potluckId") long id, Model model, Principal principal){
		Potluck potluck = potluckService.getPotluckById(id);
		User user = userService.findByUserName(principal.getName());
		
		if(potluck.getOwner().getId() != user.getId() ) {
			return "access-denied";
		}

		model.addAttribute("potluck", potluck);
		
		return "potluck-form";
	}
	
	@GetMapping("/deletePotluck")
	public String deletePotluck(@RequestParam("potluckId") long id, Principal principal) {
		Potluck potluck = potluckService.getPotluckById(id);
		User user = userService.findByUserName(principal.getName());
		if(potluck.getOwner().getId() != user.getId() ) {
			return "access-denied";
		}
		
		potluckService.deletePotluck(id);
		
		return "redirect:/mypotlucks";
	}
	
	@GetMapping("/joinPotluckForm")
	public String showJoinPotluckForm(Model model) {
		model.addAttribute("potluck", new Potluck());
		return "join-potluck-form";
	}
	
	@PostMapping("/joinPotluck")
	public String joinPotluck(@ModelAttribute("potluck") Potluck potluck, Principal principal ) {
		Potluck retrievedPotluck = potluckService.getPotluckByInvite(potluck.getInviteCode());
		User currentUser = userService.findByUserName(principal.getName());
		
		if(retrievedPotluck == null) {
			return "no-such-potluck";
		}
		
		else if(retrievedPotluck.getOwner().getUserName().equals(principal.getName()) || this.checkPotluckForParticipant(retrievedPotluck, currentUser)) {
			return "already-joined";
		}
		else {
			retrievedPotluck.getParticipants().add(currentUser);
			currentUser.getJoinedPotlucks().add(retrievedPotluck);
			potluckService.savePotluck(retrievedPotluck);
		}
		
		return "redirect:/myjoinedpotlucks";
	}
	
	@GetMapping("/leavePotluck")
	public String leavePotluck(@RequestParam("potluckId") long id, Principal principal) {
		Potluck retrievedPotluck = potluckService.getPotluckById(id);
		User currentUser = userService.findByUserName(principal.getName());
		
		Iterator itr = retrievedPotluck.getParticipants().iterator(); 
        while (itr.hasNext()) 
        { 
            User temp = (User)itr.next();
            if(temp.getUserName().equals(principal.getName())) {
            	itr.remove();
            }
        } 
		
		potluckService.savePotluck(retrievedPotluck);
		
		return "redirect:/myjoinedpotlucks";
	}
	
	@GetMapping("/showPotluckDetails")
	public String potluckDetails(@RequestParam("potluckId") long id, Model model, Principal principal) {
		Potluck retrievedPotluck = potluckService.getPotluckById(id);
		User currentUser = userService.findByUserName(principal.getName());
		
		if(!(retrievedPotluck.getOwner().getUserName().equals(principal.getName()) || this.checkPotluckForParticipant(retrievedPotluck, currentUser))) {
			return "access-denied";
		}
		
		model.addAttribute("potluck", retrievedPotluck);
		model.addAttribute("items",retrievedPotluck.getItems());
		model.addAttribute("participants",retrievedPotluck.getParticipants());
		
		return "potluck-details";
	}
	
	@GetMapping("/removeParticipant")
	public String removeParticipant(@RequestParam("potluckId") long potluckId, @RequestParam("userId") int userId, Principal principal) {
		Potluck retrievedPotluck = potluckService.getPotluckById(potluckId);
		User owner = retrievedPotluck.getOwner();
		if(!owner.getUserName().equals(principal.getName())) {
			return "access-denied";
		}
		List<User> participants = retrievedPotluck.getParticipants();
		Iterator itr = participants.iterator();
		while(itr.hasNext()) {
			User temp = (User)itr.next();
			if(temp.getId()==(userId)) {
				itr.remove();
				break;
			}
		}
		List<Item> items = retrievedPotluck.getItems();
		Iterator itemItr = items.iterator();
		while(itemItr.hasNext()) {
			Item tempItem = (Item)itemItr.next();
			if(tempItem.getUser().getId()==(userId)) {
				itemService.deleteItem(tempItem);	
			}
		}
		
		retrievedPotluck = potluckService.getPotluckById(potluckId);

		retrievedPotluck.setParticipants(participants);
		
		potluckService.savePotluck(retrievedPotluck);
		
		return "redirect:/showPotluckDetails?potluckId="+potluckId;
	}
	
	public boolean checkPotluckForParticipant(Potluck potluck, User user) {
		Iterator itr = potluck.getParticipants().iterator(); 
        while (itr.hasNext()) 
        { 
            User temp = (User)itr.next();
            if(temp.getUserName().equals(user.getUserName())) {
            	return true;
            }
        } 
		return false;
	}
	
	public String generateInviteCode(){   
	     char[] chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
	        StringBuilder sb = new StringBuilder();
	        Random random = new SecureRandom();
	        for (int i = 0; i < 6; i++) {
	            char c = chars[random.nextInt(chars.length)];
	            sb.append(c);
	        }
	        String output = sb.toString();
	        System.out.println(output);
	        return output;
	    }
}
