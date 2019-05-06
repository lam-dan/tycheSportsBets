
package com.codingdojo.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.authentication.models.Bet;
import com.codingdojo.authentication.models.Game;
import com.codingdojo.authentication.repositories.GameRepository;



@Service
public class GameService{
	//creating your attributes to Product Service
	//adding the product repo as a dependency
	public final GameRepository gameRepo;
	
	//creating a Product Service constructor using the product repo
	public GameService (GameRepository gameRepo) {
		this.gameRepo = gameRepo;
	}
	
	//creating method for querying all products in Product Repo (database)
	
	//returns all the products
	public List<Game> allGames(){
		return gameRepo.findAllByOrderByIdAsc();
	}
	
	//creating a product
	public Game createGame(Game game) {
		return gameRepo.save(game);
	}
	
	//retrieving a product from the database
	public Game findGame(Long id) {
		Optional<Game> optionalGame= gameRepo.findById(id);
		if(optionalGame.isPresent()) {
			return optionalGame.get();
		}else {
			return null;
		}
	}
	
	//update the message 
	public Game updateGame(Game game) {
		gameRepo.save(game);
		return game;
		
	}
	
	//delete a product
	public void deleteGame(Long id) {
		gameRepo.deleteById(id);
	}
	
}