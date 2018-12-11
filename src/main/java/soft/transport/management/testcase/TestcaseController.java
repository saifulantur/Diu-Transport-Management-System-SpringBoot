package soft.transport.management.testcase;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestcaseController {
	
	@RequestMapping(value="/viewtestcase")
	public String Testcase() {
		return "testcase";
	}

}
