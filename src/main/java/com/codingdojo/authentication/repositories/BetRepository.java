package com.codingdojo.authentication.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.authentication.models.Bet;

@Repository
public interface BetRepository extends CrudRepository<Bet, Long> {
	List<Bet> findAllByOrderByIdAsc();
	List<Bet> findAllByOrderByBetDateAsc();

}