package com.samplefish.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="potluck")
public class Potluck {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private long id;
	
	@Column(name="name")
	private String name;
	
	@ManyToOne(cascade= {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="user_id")
	private User owner;
	
	@Column(name="location")
	private String location;
	
	@Column(name="time")
	private String time;
	
	@Column(name="date")
	private String date;
	
	@Column(name="description")
	private String description;

	@ManyToMany(fetch=FetchType.EAGER,
			cascade= {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH})
	@JoinTable(
		name="potluck_user",
		joinColumns=@JoinColumn(name="potluck_id"),
		inverseJoinColumns=@JoinColumn(name="user_id"))
	private List<User> participants;
	
	@Column(name="invite_code")
	private String inviteCode;
	
	@OneToMany(mappedBy="potluck", cascade= {CascadeType.ALL})
	private List<Item> items;
	
	public Potluck() {
		
	}

	public Potluck(String name, User owner) {
		this.name = name;
		this.owner = owner;
	}

	@Override
	public String toString() {
		return "Potluck [id=" + id + ", name=" + name + ", owner=" + owner 
				+ ", participants=" + participants + "]";
	}
	
	

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public String getInviteCode() {
		return inviteCode;
	}

	public void setInviteCode(String invite_code) {
		this.inviteCode = invite_code;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}


	public List<User> getParticipants() {
		return participants;
	}

	public void setParticipants(List<User> participants) {
		this.participants = participants;
	}
	
	
	
	

}
