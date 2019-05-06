package com.codingdojo.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.authentication.models.Team;
import com.codingdojo.authentication.repositories.TeamRepository;



@Service
public class TeamService{
	//creating your attributes to Product Service
	//adding the product repo as a dependency
	public final TeamRepository teamRepo;
	
	//creating a Product Service constructor using the product repo
	public TeamService (TeamRepository teamRepo) {
		this.teamRepo = teamRepo;
	}
	
	//creating method for querying all products in Product Repo (database)
	
	//returns all the products
	public List<Team> allTeams(){
		return teamRepo.findAllByOrderByIdAsc();
	}
	
	//creating a product
	public Team createTeam(Team team) {
		return teamRepo.save(team);
	}
	
	//retrieving a product from the database
	public Team findTeam(Long id) {
		Optional<Team> optionalTeam = teamRepo.findById(id);
		if(optionalTeam.isPresent()) {
			return optionalTeam.get();
		}else {
			return null;
		}
	}
	
	//update the message 
	public Team updateTeam(Team team) {
		teamRepo.save(team);
		return team;
		
	}
	
	//delete a product
	public void deleteTeam(Long id) {
		teamRepo.deleteById(id);
	}
	
	
	
}