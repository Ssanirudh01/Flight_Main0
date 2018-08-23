package com.controller;


import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.model.FareMaster;
import com.model.FleetMaster;
import com.model.FlightMaster;
import com.model.LocationMaster;
import com.service.AdminService;
import com.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	
	
	@RequestMapping("admin_locationMaster")
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response)
	{
		LocationMaster locationMaster=new LocationMaster();
		String city_name=request.getParameter("city_name");
		String code=request.getParameter("code");
		String airportName=request.getParameter("airport_name");
		String country=request.getParameter("country");
		if(validate(city_name,code,airportName,country))
		{
			locationMaster.setLocationMasterId(2345);
			locationMaster.setCode(code);locationMaster.setCountry(country);locationMaster.setAirportName(airportName);
			locationMaster.setName(city_name);
			if(adminService.addLocation(locationMaster))
				return null;
		}	
		return new ModelAndView("admin_locationMaster");
	}


/*	@RequestMapping("admin_locationMaster/view")
	public ModelAndView view(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("flightResult");
		List<LocationMaster> list=new ArrayList();
		list=adminService.getAllLocationDetail();
		if(list.size()>0)
		{
			return new ModelAndView("admin_locationMaster");
		}
		else
		{
			return new ModelAndView("admin_locationMaster");
		}
	}

	
*/	
	private boolean validate(String...values) {
		for(String data:values)
		{
			if(data.trim().length()<3)
				return false;
		}
		return true;
	}
	
	@RequestMapping("/admin")
	public ModelAndView admin() {
		return new ModelAndView("admin");
	}

	@RequestMapping(value = "/addFleet", method = RequestMethod.POST)
	public ModelAndView addFleet(
			@ModelAttribute("fleet") FleetMaster fleetMaster,
			BindingResult bindingResult) {
		boolean flag = adminService.addFleet(fleetMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}

	@RequestMapping(value = "/modifyFleet", method = RequestMethod.POST)
	public ModelAndView modifyFleet(@ModelAttribute("fleet") FleetMaster fleetMaster,
			BindingResult bindingResult) {
		boolean flag = adminService.modifyFleet(fleetMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");

	}

	@RequestMapping("/deleteFleet")
	public ModelAndView deleteFleet(HttpServletRequest request,
			HttpServletResponse res) {
		String fleetId = request.getParameter("fleetId");
		boolean flag = adminService.deleteFleet(Integer.parseInt(fleetId));
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}
	
	@RequestMapping("/displayFleet")
	public ModelAndView displayFleet() {
		FleetMaster fleetMaster = null;
		List <FleetMaster> fleetMasters=adminService.getAllFleetDetail(fleetMaster);
		return new ModelAndView("allFleetDetails","list",fleetMasters);
	}
	
	/* fare master*/
	
	
	@RequestMapping(value = "/addFare", method = RequestMethod.POST)
	public ModelAndView addFare(
			@ModelAttribute("fare") FareMaster fareMaster,
			BindingResult bindingResult) {
		boolean flag = adminService.addFare(fareMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}

	@RequestMapping(value = "/modifyFare", method = RequestMethod.POST)
	public ModelAndView modifyFare(@ModelAttribute("fare") FareMaster fareMaster,
			BindingResult bindingResult) {
		boolean flag = adminService.modifyFare(fareMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");

	}

	@RequestMapping("/deleteFare")
	public ModelAndView deleteFare(HttpServletRequest request,
			HttpServletResponse res) {
		String fareMasterId = request.getParameter("fareMasterId");
		boolean flag = adminService.deleteFare(Integer.parseInt(fareMasterId));
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}
	
	@RequestMapping("/displayFare")
	public ModelAndView displayFare() {
		FareMaster fareMaster = new FareMaster();
		List <FareMaster> fareMasters=adminService.getAllFareDetail(fareMaster);
		return new ModelAndView("allFareDetails", "list", fareMasters);		
	}
	
	/* Location Master  */
	
	@RequestMapping(value = "/addLocation", method = RequestMethod.POST)
	public ModelAndView addLocation(
			@ModelAttribute("location") LocationMaster locationMaster,
			BindingResult bindingResult) {
		boolean flag = adminService.addLocation(locationMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}

	@RequestMapping(value = "/modifyLocation", method = RequestMethod.POST)
	public ModelAndView modifyFare(@ModelAttribute("location") LocationMaster locationMaster,
			BindingResult bindingResult) {
		boolean flag = adminService.modifyLocation(locationMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");

	}

	@RequestMapping("/deleteLocation")
	public ModelAndView deleteLocation(HttpServletRequest request,
			HttpServletResponse res) {
		String locationMasterId = request.getParameter("locationMasterId");
		boolean flag = adminService.deleteLocation(Integer.parseInt(locationMasterId));
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}
	
	@RequestMapping("/displayLocation")
	public ModelAndView displayLocation() {
		LocationMaster locationMaster=null;
		List<LocationMaster> locationMasters=adminService.getAllLocationDetail(locationMaster);
		return new ModelAndView("allLocationDetails","list",locationMasters);
	}
	
/* Flight Master  */
	
	@RequestMapping("/addFlight")
	public ModelAndView addFlight(HttpServletRequest req,HttpServletResponse res) throws ParseException {
		String flightId=req.getParameter("flightId");
		String departureLoc=req.getParameter("departureLoc");
		String arrivalLoc=req.getParameter("arrivalLoc");
		String fleet=req.getParameter("fleet");
		String fare=req.getParameter("fare");
		String dtime=req.getParameter("departureTime");
		String atime=req.getParameter("arrivalTime");
		String flightTravelDate=req.getParameter("flightTravelDate");
		String eseats=req.getParameter("remainingEconomySeats");
		String pseats=req.getParameter("remainingPremiumSeats");
		String bseats=req.getParameter("remainingBusinessSeats");
		
		FlightMaster flightMaster=new FlightMaster();
		flightMaster.setFlightId(Integer.parseInt(flightId));
		LocationMaster locationMaster1=new LocationMaster();
		locationMaster1.setLocationMasterId(Integer.parseInt(departureLoc));
		LocationMaster locationMaster2=new LocationMaster();
		locationMaster2.setLocationMasterId(Integer.parseInt(arrivalLoc));
		
		FleetMaster fleetMaster=new FleetMaster();
		fleetMaster.setFleetMasterId(Integer.parseInt(fleet));
		FareMaster fareMaster=new FareMaster();
		fareMaster.setFareMasterId(Integer.parseInt(fare));
		
		flightMaster.setLocationMaster1(locationMaster1);
		flightMaster.setLocationMaster2(locationMaster2);
		flightMaster.setFleetMaster(fleetMaster);
		flightMaster.setFareMaster(fareMaster);
		
		Date date=null;
		date=new SimpleDateFormat("HH:mm:ss").parse(atime);
		java.sql.Time time = new Time(date.getTime());		
		flightMaster.setArrivalTime(time);
		
		date=new SimpleDateFormat("HH:mm:ss").parse(dtime);
	    time = new Time(date.getTime());	
		flightMaster.setDepartureTime(time);
		
		Date date1=new SimpleDateFormat("yyyy-mm-dd").parse(flightTravelDate);
		flightMaster.setFlightTravelDate(date1);
		
		flightMaster.setRemainingBusinessSeats(Integer.parseInt(bseats));
		flightMaster.setRemainingEconomySeats(Integer.parseInt(eseats));
		flightMaster.setRemainingPremiumSeats(Integer.parseInt(pseats));
	
		boolean flag=adminService.addFlight(flightMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");	
		
	}
/*
	@RequestMapping( "/modifyFlight")
	public ModelAndView modifyFlight(HttpServletRequest req,HttpServletResponse res) {
		String flightId=req.getParameter("flightId");
		String departureLoc=req.getParameter("departureLoc");
		String arrivalLoc=req.getParameter("arrivalLoc");
		String fleet=req.getParameter("fleet");
		String fare=req.getParameter("fare");
		String dtime=req.getParameter("departureTime");
		String atime=req.getParameter("arrivalTime");
		String flightTravelDate=req.getParameter("flightTravelDate");
		String eseats=req.getParameter("remainingEconomySeats");
		String pseats=req.getParameter("remainingPremiumSeats");
		String bseats=req.getParameter("remainingBusinessSeats");
		
		FlightMaster flightMaster=new FlightMaster();
		LocationMaster locationMaster1=new LocationMaster();
		locationMaster1.setName(departureLoc);
		LocationMaster locationMaster2=new LocationMaster();
		locationMaster2.setName(arrivalLoc);
		
		FleetMaster fleetMaster=new FleetMaster();
		FareMaster fareMaster=new FareMaster();
		
		flightMaster.setLocationMaster1(locationMaster1);
		flightMaster.setLocationMaster2(locationMaster2);
		flightMaster.setFleetMaster(fleetMaster);
		flightMaster.setFareMaster(fareMaster);
		flightMaster.setArrivalTime(Time.valueOf(atime));
		flightMaster.setDepartureTime(Time.valueOf(dtime));
		flightMaster.setFlightTravelDate(java.sql.Date.valueOf(flightTravelDate));
		flightMaster.setRemainingBusinessSeats(Integer.parseInt(bseats));
		flightMaster.setRemainingEconomySeats(Integer.parseInt(eseats));
		flightMaster.setRemainingPremiumSeats(Integer.parseInt(pseats));
	
		boolean flag=adminService.modifyFlight(flightMaster);
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}
*/
	@RequestMapping("/deleteFlight")
	public ModelAndView deleteFlight(HttpServletRequest request,
			HttpServletResponse res) {
		String flightId = request.getParameter("flightId");
		boolean flag = adminService.deleteFlight(Integer.parseInt(flightId));
		if (flag)
			return new ModelAndView("successfulAdmin");
		else
			return new ModelAndView("admin");
	}
	
	@RequestMapping("/displayFlight")
	public ModelAndView displayFlight() {
		List<FlightMaster> flightMasters=adminService.getAllFlightDetail();
		return new ModelAndView("allFlightDetails","list",flightMasters);
	}
	
}