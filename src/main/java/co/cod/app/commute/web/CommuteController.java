package co.cod.app.commute.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import co.cod.app.commute.service.CommuteService;

@Controller
class CommuteController {
	
	@Autowired CommuteService commuteService;
	
}
