package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.TreeMap;

import com.service.AdminService;
import com.service.AdminServiceImplementation;
import com.service.FlightService;
import com.service.FlightServiceImplementation;
import com.service.UserService;
import com.service.UserServiceImplementation;
import com.model.AddressDetail;
import com.model.FlightMaster;
import com.model.LocationMaster;

import java.util.ArrayList;
@Controller
public class FlightController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private FlightService flightService=new FlightServiceImplementation();
	
	
	@RequestMapping("/flightResult")
	public ModelAndView flight(HttpServletRequest request,HttpServletResponse res)
	{
		ModelAndView model=new ModelAndView("flightResult");
		List<LocationMaster> list=new ArrayList();
		LocationMaster locationMaster=new LocationMaster();
			list=adminService.getAllLocationDetail(locationMaster);
			if(list!=null)
			{
			for(LocationMaster aa:list)
			{
				String name=aa.getAirportName()+"("+aa.getCode()+")";
				int id=aa.getLocationMasterId();
				System.out.println(id+" "+name);
			}
			return new ModelAndView("flightResult","total",list);
			}
			else
			{
				return new ModelAndView("unsuccessful");		
			}
		
	}
	@RequestMapping("/bookflight")
	public ModelAndView bookTicket(HttpServletRequest request,HttpServletResponse response)
	{
		String flightId=request.getParameter("flightId");
		int id=Integer.parseInt(flightId);
		FlightMaster f=flightService.getFlightForDisplay(id);
		String path="?"+request.getQueryString();
		System.out.println(path);
		if(request.getSession().getAttribute("logged")!=null)
		{
			request.getSession().setAttribute("path", "tt");
			if(f!=null)
			{
				return new ModelAndView("ticketForm","flight",f);
			}
			else
			{
				return new ModelAndView("unsuccessful");		
			}
		}
		else
		{
			System.out.println(request.getSession().getAttribute("logged"));
			request.getSession().setAttribute("path", path);
			System.out.println("path is inside flightBook "+path);
			return new ModelAndView("logins");
		}
	}
	
	@RequestMapping("/flightList")
	public ModelAndView flightList(HttpServletRequest request,HttpServletResponse response)
	{

		String source=request.getParameter("source"); 
		String destination=request.getParameter("destination");
		String date=request.getParameter("dateOfJourney");
		//String classType=request.getParameter("classType");
		//String s=request.getParameter("seat");
		//int seat=Integer.parseInt(s);
		if(source!=null && destination!=null && date!=null)
		{
			int src=Integer.parseInt(source);
			int dst=Integer.parseInt(destination);
			java.sql.Date dt=java.sql.Date.valueOf(date);
/*			System.out.println(request.getRequestURI()+"?"+request.getQueryString());
*/			
			List<FlightMaster> list=flightService.getSearchDetails(src,dst,dt);
			if(list!=null)
			{
				for(FlightMaster f:list)
					System.out.println(f.getFlightId()+" "+f.getRemainingBusinessSeats()+" "+f.getArrivalTime());
				if(list.size()>0)
					return new ModelAndView("flightList","lists",list);
				else
					return new ModelAndView("noresult");			
			}
			else
			{
				return new ModelAndView("unsuccessful");						
			}
		}
		else
		{
			return new ModelAndView("unsuccessful");
		}
	}
	
	@RequestMapping("flightListt")
	public ModelAndView flightDataByPrice(HttpServletRequest request,HttpServletResponse response)
	{
		/*TreeMap<Integer,FlightMaster> tt=new TreeMap();
		List<FlightMaster> fm=(List<FlightMaster>) request.getAttribute("data");
		String classType=request.getParameter("classType");
		tt=flightService.filterByPrice(fm, classType);
		for(Map.Entry<Integer, FlightMaster> map:tt)
		{
			
		}
		*/
		return new ModelAndView("flightList");
	}
}