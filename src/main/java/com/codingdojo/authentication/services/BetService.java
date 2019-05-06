package com.codingdojo.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.authentication.models.Bet;
import com.codingdojo.authentication.repositories.BetRepository;



@Service
public class BetService{
	//creating your attributes to Product Service
	//adding the product repo as a dependency
	public final BetRepository betRepo;
	
	//creating a Product Service constructor using the product repo
	public BetService (BetRepository betRepo) {
		this.betRepo = betRepo;
	}
	
	//creating method for querying all products in Product Repo (database)
	
	//returns all the products
	public List<Bet> getAllBets(){
		return betRepo.findAllByOrderByIdAsc();
	}
	
	public List<Bet> getAllBetsByDate(){
		return betRepo.findAllByOrderByBetDateAsc();
	}
	
	//creating a product
	public Bet createBet(Bet bet) {
		return betRepo.save(bet);
	}
	
	//retrieving a product from the database
	public Bet findBet(Long id) {
		Optional<Bet> optionalBet= betRepo.findById(id);
		if(optionalBet.isPresent()) {
			return optionalBet.get();
		}else {
			return null;
		}
	}
	
	//update the message 
	public Bet updateBet(Bet bet) {
		betRepo.save(bet);
		return bet;
		
	}
		
	//delete a product
	public void deleteBet(Long id) {
		betRepo.deleteById(id);
	}
	
	
	
}