package soft.transport.management.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import soft.transport.management.model.ViewBrandModel;
import soft.transport.management.service.ViewBrandModelService;

@Controller
public class ViewBrandController {
	
	@Autowired
	private ViewBrandModelService viewBrandModelService;
	
	@RequestMapping(value="/view-rpt-brands")
	public String viewBrandsReportParameterPage() {
		return "rptbrands";
	}
	
	@RequestMapping(value="/view-all-brands")
	public @ResponseBody List<ViewBrandModel> showAllBrandsModel() {
		return viewBrandModelService.findAllBrandModel();
		
	}

}
