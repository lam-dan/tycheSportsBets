package com.codingdojo.authentication.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.authentication.models.Bet;
import com.codingdojo.authentication.models.Player;
import com.codingdojo.authentication.models.Team;
import com.codingdojo.authentication.models.User;
import com.codingdojo.authentication.services.BetService;
import com.codingdojo.authentication.services.GameService;
import com.codingdojo.authentication.services.PlayerService;
import com.codingdojo.authentication.services.TeamService;
import com.codingdojo.authentication.services.UserService;
import com.codingdojo.authentication.validator.UserValidator;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

@Controller
public class MainController{
	
	//make a eventService and messageService dependency
	public final BetService betService;
	public final PlayerService playerService;
	public final TeamService teamService;
    private final UserService userService;
    private final UserValidator userValidator;
    private final GameService gameService;    

	//create a Main Controller object passing categoryService and productService through
	public MainController(GameService gameService,PlayerService playerService,TeamService teamService,UserService userService, UserValidator userValidator, BetService betService) {
        this.userService = userService;
        this.userValidator = userValidator;
        this.betService = betService;
        this.playerService = playerService;
        this.teamService = teamService;
        this.gameService = gameService;
	}

    @RequestMapping("/register")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "register.jsp";
    }

    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "register.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        return "redirect:/dashboard/basketball";
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session,RedirectAttributes redirectAttrs) {
    	
    	boolean isAuthenticated = userService.authenticateUser(email, password);

    	if(isAuthenticated) {
    		User u = userService.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		return "redirect:/dashboard/basketball";
    	}else {
    		redirectAttrs.addFlashAttribute("error", "Email and password combinations do not match.");
    		return "redirect:/dashboard/basketball";
    	
    	}
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
        // redirect to login page
    	session.invalidate();
    	return "redirect:/dashboard/basketball";
    }
    
    @RequestMapping("/")
    public String localhost(HttpSession session, Model model) {
    	return "redirect:/sportsbets";
    }
        
    @RequestMapping("/sportsbets")
    public String home(HttpSession session, Model model) {
    	return "sportsbets.jsp";
    }

    @RequestMapping("/dashboard/basketball")
    public String nbaDashboard(@Valid @ModelAttribute("bet") Bet bet,@ModelAttribute("updateBet") Bet updateBet,HttpSession session, Model model) throws UnirestException {
		if(session.getAttribute("userId") != null) {
	    	Long userId = (Long) session.getAttribute("userId");
	    	User u = userService.findUserById(userId);
	    	model.addAttribute("user",u);
	    	List<Bet> allBets = betService.getAllBets();
	    	model.addAttribute("allBets",allBets);
	    	List<Team> allTeams = teamService.allTeams();
	    	model.addAttribute("teams",allTeams);
	    	return "nbadashboard.jsp";
		}else {
			List<Bet> allBets = betService.getAllBets();
			model.addAttribute("allBets",allBets);
			List<Team> allTeams = teamService.allTeams();
			model.addAttribute("teams",allTeams);
			}
			return "nbadashboard.jsp";

    }
    
    @RequestMapping("/dashboard/basketball/team/{id}")
    public String nbaTeam(@PathVariable("id") String id,Model model) throws UnirestException {
    	HttpResponse<JsonNode> teamRoster = Unirest.get("http://data.nba.net/10s/prod/v1/2018/teams/"+id+"/roster.json").asJson();
    	model.addAttribute("teamRoster",teamRoster);
    	HttpResponse<JsonNode> players = Unirest.get("http://data.nba.net/10s/prod/v1/2018/players.json").asJson();
    	model.addAttribute("players",players);
    	Team team = teamService.findTeam(Long.parseLong(id));
    	model.addAttribute("team",team);   	
    	return "nbateam.jsp";
    	
    }
   
    @RequestMapping("/dashboard/basketball/player/{id}")
    public String nbaPlayer(@PathVariable("id") Long id) throws UnirestException {
		return "nbaplayer.jsp";
    	
    }

	//creates a bet
	@RequestMapping(value="/createBet", method=RequestMethod.POST)
	public String createBet(@Valid @ModelAttribute("bet") Bet bet,BindingResult result,HttpSession session,Model model,RedirectAttributes redirectAttrs, 
		@RequestParam(value="makerTeam_id") Long makerTeam_id, @RequestParam(value="takerTeam_id") Long takerTeam_id, @RequestParam(value="betType") String betType) {

		if(makerTeam_id==(null)) {
			redirectAttrs.addFlashAttribute("errorOnCreate", "You have not selected a Team.");
			return "redirect:/dashboard/basketball";
		}
		if(takerTeam_id == null) {
			redirectAttrs.addFlashAttribute("errorOnCreate", "You have not selected a taker's Team.");
			return "redirect:/dashboard/basketball";
		}
		if(betType == null) {
			redirectAttrs.addFlashAttribute("errorOnCreate", "You have not selected a bet type.");
			return "redirect:/dashboard/basketball";
		}
		
		if(session.getAttribute("userId")==null) {
			redirectAttrs.addFlashAttribute("errorTwo", "You will need to login or register first.");
			return "redirect:/dashboard/basketball";
		}else if(result.hasErrors()) {
			
	    	Long userId = (Long) session.getAttribute("userId");
	    	User u = userService.findUserById(userId);
	    	model.addAttribute("user",u);  
			List<Bet> allBets = betService.getAllBets();
			model.addAttribute("bets", allBets);
			return "nbadashboard.jsp";
			
			}else {
				
				Long userId = (Long) session.getAttribute("userId");
				User u = userService.findUserById(userId);
				
				Bet userBet = new Bet();				
				userBet.setValue(bet.getValue());				
				userBet.setType(betType);
			
				Team makerTeam = teamService.findTeam(makerTeam_id);
				Team takerTeam = teamService.findTeam(takerTeam_id);
				userBet.setMakerTeam(makerTeam);
				userBet.setTakerTeam(takerTeam);
				userBet.setRiskAmount(bet.getRiskAmount());
				userBet.setWinAmount(bet.getWinAmount());				
				userBet.setBetDate(bet.getBetDate());
				userBet.setMaker(u);
				betService.createBet(userBet);

			return "redirect:/dashboard/basketball";
			}	
	}
	
	@RequestMapping("/bets/{id}/delete")
	public String deleteBet(@PathVariable("id") Long id, HttpSession session,RedirectAttributes redirectAttrs){
		
		Bet bet = betService.findBet(id);
		
		if(session.getAttribute("userId").equals(bet.getMaker().getId())){
			if(bet.getTaker() == null) {
				betService.deleteBet(id);
				return "redirect:/dashboard/basketball";
			}else {
				redirectAttrs.addFlashAttribute("errorTwo", "You cannot delete a bet that has been taken.");
				return "redirect:/dashboard/basketball";
			}
		}
		return "redirect:/dashboard/basketball";
	}
	//taking on a bet
	@RequestMapping("/bets/{id}/takeBet")
	public String takeBet(@PathVariable("id") Long id,HttpSession session,RedirectAttributes redirectAttrs) {
		
		if(session.getAttribute("userId")==null) {
			redirectAttrs.addFlashAttribute("errorTakeBet", "You will need to login or register first.");
			return "redirect:/dashboard/basketball";
		}else {
			Long userId = (Long) session.getAttribute("userId");
			User u = userService.findUserById(userId);
			Bet bet = betService.findBet(id);
			bet.setTaker(u);
			betService.updateBet(bet);
			return "redirect:/dashboard/basketball";
		}
	}
	
	//renders an bet edit page
    @RequestMapping("/bets/{id}/edit")
    public String editBet(@Valid @ModelAttribute("bet") Bet bet,@ModelAttribute("updateBet") Bet updateBet,@PathVariable("id") Long id,HttpSession session, Model model,RedirectAttributes redirectAttrs){

		Bet editBet = betService.findBet(id);
		model.addAttribute("updateBet",editBet);
		
		if(editBet.getTaker()!=null) {
			redirectAttrs.addFlashAttribute("errorEditBet", "You cannot edit an active bet with a taker present!");
			return "redirect:/dashboard/basketball";
		}
		if(session.getAttribute("userId") != null) {
	    	Long userId = (Long) session.getAttribute("userId");
	    	User u = userService.findUserById(userId);
	    	model.addAttribute("user",u);
	    	List<Bet> allBets = betService.getAllBets();
	    	model.addAttribute("allBets",allBets);
	    	List<Team> allTeams = teamService.allTeams();
	    	model.addAttribute("teams",allTeams);
	    	return "nbadashboard.jsp";
	    }else{
	//    	Long userId = (Long) session.getAttribute("userId");
	//    	User u = userService.findUserById(userId);
	    	List<Bet> allBets = betService.getAllBets();
	//    	model.addAttribute("user", u);
	    	model.addAttribute("allBets",allBets);
	    	List<Team> allTeams = teamService.allTeams();
	    	model.addAttribute("teams",allTeams);
	    	return "nbadashboard.jsp";
		}
    }
    
    @RequestMapping(value="/bet//update", method=RequestMethod.PUT)
    public String updateBetErrort(RedirectAttributes redirectAttrs) {
    	
		redirectAttrs.addFlashAttribute("errorOnUpdate", "You have not selected a bet to update.");
    	return "redirect:/dashboard/basketball";
    }
    
	
    //update bet
    @RequestMapping(value="/bet/{id}/update", method=RequestMethod.PUT)
    public String updateBet(@Valid @ModelAttribute("updateBet") Bet updateBet,BindingResult result,@ModelAttribute("bet") Bet bet,@PathVariable("id") Long id,HttpSession session, Model model,RedirectAttributes redirectAttrs,
    		@RequestParam(value="makerTeam_id") Long makerTeam_id, @RequestParam(value="takerTeam_id") Long takerTeam_id, @RequestParam(value="betType") String betType) {
    	    	
		if(makerTeam_id==(null)) {
			redirectAttrs.addFlashAttribute("errorOnUpdate", "You have not selected a Team.");
			return "redirect:/dashboard/basketball";
		}
		if(takerTeam_id == null) {
			redirectAttrs.addFlashAttribute("errorOnUpdate", "You have not selected a taker's Team.");
			return "redirect:/dashboard/basketball";
		}
		if(betType == null) {
			redirectAttrs.addFlashAttribute("errorOnUpdate", "You have not selected a bet type.");
			return "redirect:/dashboard/basketball";
		}
		    	
    	if (result.hasErrors()) {
        	return "redirect:/dashboard/basketball";
        } else {
			Team makerTeam = teamService.findTeam(makerTeam_id);
			Team takerTeam = teamService.findTeam(takerTeam_id);
        	Bet updateBet2 = betService.findBet(id);
        	updateBet2.setBetDate(updateBet.getBetDate());
        	updateBet2.setMakerTeam(makerTeam);
        	updateBet2.setTakerTeam(takerTeam);
        	updateBet2.setType(betType);
        	updateBet2.setValue(updateBet.getValue());
        	updateBet2.setRiskAmount(updateBet.getRiskAmount());
        	updateBet2.setWinAmount(updateBet.getWinAmount());
        	betService.updateBet(updateBet2);
        	return "redirect:/dashboard/basketball";
        }
    }

	//renders edit page on user
	@RequestMapping("/user/{id}/edit")
	public String editUser(@Valid @ModelAttribute("user") User user,BindingResult result,@PathVariable("id") Long id, Model model) {
		User editUser = userService.findUserById(id);
		model.addAttribute("user",editUser);
		return "userdetails.jsp";
	}
	
	
	@RequestMapping(value="/user/{id}/update", method=RequestMethod.PUT)
	public String updateUser(@Valid @ModelAttribute("user") User user,BindingResult result,@PathVariable("id") Long id, Model model) {

		User updateUser = userService.findUserById(id);
		updateUser.setFirstName(user.getFirstName());
		updateUser.setLastName(user.getLastName());
		updateUser.setEmail(user.getEmail());	
		updateUser.setPassword(user.getPassword());
		userService.updateUser(updateUser);
		return "userdetails.jsp";
	}
	
	//renders profile page for a user
	@RequestMapping("/user/{id}/profile")
	public String showProfile(@Valid @ModelAttribute("user") User user,BindingResult result,@PathVariable("id") Long id, Model model) {

		User userProfile = userService.findUserById(id);
		model.addAttribute("userProfile",userProfile);
		
		return "userprofile.jsp";
	}
	
    @RequestMapping("/test")
    public String test(Model model) throws UnirestException{
		   	
		HttpResponse<JsonNode> response = Unirest.get("https://api-nba-v1.p.rapidapi.com/statistics/players/playerId/124")
		.header("X-RapidAPI-Key", "137dda1372msh0c68a35b28964d5p142706jsn6d2024f2088a")
		.asJson();
	    	
    	HttpResponse<JsonNode> teams = Unirest.get("http://data.nba.net/10s/prod/v2/2018/teams.json")
    			.asJson();
    	
    	model.addAttribute("allTeams",teams);
        return "Test.jsp";
    }
}
