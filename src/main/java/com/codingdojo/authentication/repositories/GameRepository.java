package com.codingdojo.authentication.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.authentication.models.Game;

@Repository
public interface GameRepository extends CrudRepository<Game, Long> {
	List<Game> findAllByOrderByIdAsc();

}