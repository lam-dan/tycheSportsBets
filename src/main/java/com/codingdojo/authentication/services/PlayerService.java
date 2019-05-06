package com.codingdojo.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.authentication.models.Player;
import com.codingdojo.authentication.repositories.PlayerRepository;



@Service
public class PlayerService{
	//creating your attributes to Product Service
	//adding the product repo as a dependency
	public final PlayerRepository playerRepo;
	
	//creating a Product Service constructor using the product repo
	public PlayerService (PlayerRepository playerRepo) {
		this.playerRepo = playerRepo;
	}
	
	//creating method for querying all products in Product Repo (database)
	
	//returns all the products
	public List<Player> allPlayers(){
		return playerRepo.findAllByOrderByIdAsc();
	}
	
	//creating a product
	public Player createPlayer(Player player) {
		return playerRepo.save(player);
	}
	
	//retrieving a product from the database
	public Player findPlayer(Long id) {
		Optional<Player> optionalPlayer = playerRepo.findById(id);
		if(optionalPlayer.isPresent()) {
			return optionalPlayer.get();
		}else {
			return null;
		}
	}
	
	//update the message 
	public Player updatePlayer(Player player) {
		playerRepo.save(player);
		return player;
		
	}
	
	//delete a product
	public void deletePlayer(Long id) {
		playerRepo.deleteById(id);
	}
	
	
	
}