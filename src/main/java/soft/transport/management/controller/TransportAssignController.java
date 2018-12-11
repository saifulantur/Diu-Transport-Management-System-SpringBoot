package soft.transport.management.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TransportAssignController {
	
	@RequestMapping(value = "/transport-assign")
	public String showTransportAssign() {
		return "viewTransportAssign";
	}

}
