package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import soft.transport.management.model.Driver;
import soft.transport.management.service.DriverService;

@Controller
public class DriverController {
	
	@Autowired
	DriverService driverService;
	
	@RequestMapping(value="/driverinformation")
	public String showDriver() {
		return "driverinformation";
	}
	
	@RequestMapping(value="/saveDriver")
	// , method = RequestMethod.POST
	public @ResponseBody String saveDriver(@RequestBody Driver driver) {
	
		
		if(driver.getTmpId() > 0) {
			Driver existingDriver = driverService.findById(driver.getTmpId());
			existingDriver.setDriverName(driver.getDriverName());
			existingDriver.setDriverCode(driver.getDriverCode());
			existingDriver.setDriverDateOfBirth(driver.getDriverDateOfBirth());
			existingDriver.setDrivingLicense(driver.getDrivingLicense());
			existingDriver.setLicenseExpireDate(driver.getLicenseExpireDate());
			existingDriver.setDriverNid(driver.getDriverNid());
			existingDriver.setPresentAddress(driver.getPresentAddress());
			existingDriver.setParmanentAddress(driver.getParmanentAddress());
			existingDriver.setDriverContactNO(driver.getDriverContactNO());
			existingDriver.setDriverEmail(driver.getDriverEmail());
			existingDriver.setDriverImage(driver.getDriverImage());
			
			driverService.add(existingDriver);
			return "Data Successfully Updated";
		}
		
		else {
		driverService.add(driver);
		return "Data Successfully saved";
		}
	}
	
	@RequestMapping(value="/viewAllDriver", method = RequestMethod.POST)
	public @ResponseBody List<Driver> viewAllDriver() {
		return driverService.showAllDriverInformation();
	}

}
