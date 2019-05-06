package com.codingdojo.authentication.models;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="bets")
public class Bet {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Size(min=1, message="Bet type cannot be blank.")
	private String type;
	
	private double riskAmount;
	
	private double winAmount;
	
	@Size(min=1, message="Bet date cannot be blank.")
	private String betDate; 
	
	private int value;
	
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="maker_id")
    private User maker;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="taker_id")
    private User taker;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="makerTeam_id")
    private Team makerTeam;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="takerTeam_id")
    private Team takerTeam;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="game_id")
    private Game game;
 
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getRiskAmount() {
		return riskAmount;
	}
	public void setRiskAmount(double riskAmount) {
		this.riskAmount = riskAmount;
	}
	public double getWinAmount() {
		return winAmount;
	}
	public void setWinAmount(double winAmount) {
		this.winAmount = winAmount;
	}
	public String getBetDate() {
		return betDate;
	}
	public void setBetDate(String betDate) {
		this.betDate = betDate;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public User getMaker() {
		return maker;
	}
	public void setMaker(User maker) {
		this.maker = maker;
	}
	public User getTaker() {
		return taker;
	}
	public void setTaker(User taker) {
		this.taker = taker;
	}
	public Team getMakerTeam() {
		return makerTeam;
	}
	public void setMakerTeam(Team makerTeam) {
		this.makerTeam = makerTeam;
	}
	public Team getTakerTeam() {
		return takerTeam;
	}
	public void setTakerTeam(Team takerTeam) {
		this.takerTeam = takerTeam;
	}
	public Game getGame() {
		return game;
	}
	public void setGame(Game game) {
		this.game = game;
	}
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();

    }	
}

