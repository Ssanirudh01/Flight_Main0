package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.Booking;
import com.model.FlightMaster;
import com.model.LocationMaster;
import com.model.Passenger;
import com.model.Person;
import com.service.AdminService;
import com.service.BookingService;
import com.service.FlightService;
import com.service.UserService;

@Controller
public class BookingController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private BookingService bookingService;
	@Autowired
	private FlightService flightService;
	@Autowired
	private UserService userService;
	
	List<Passenger> passengers=new ArrayList();
	Booking booking =new Booking();
	
	@RequestMapping("/bookTicket")
	public void flight(HttpServletRequest request,HttpServletResponse response)
	{
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0);
		//Passenger passenger=new Passenger();
		FlightMaster flightMaster=new FlightMaster();
		Passenger passenger=new Passenger();
		Person person=null;
		if(request.getSession().getAttribute("logged")!=null)
		{
			person=(Person) request.getSession().getAttribute("person");
		}
		
		String flightid=request.getParameter("flightId");
		String classType=request.getParameter("classType");
		System.out.println(flightid);
		String s=request.getParameter("seat");
		int seat=Integer.parseInt(s);
		int flightId=Integer.parseInt(flightid);
		FlightMaster flightMaster2=flightService.getFlightForDisplay(flightId);
		//flightMaster.setFlightId(flightId);
		//booking.setBookingId(22473);
		booking.setSeatClass(classType);
		booking.setSeatsBooked(seat);
		booking.setFlightMaster(flightMaster2);
		booking.setTravelDate(flightMaster2.getFlightTravelDate());
		int total=seat*flightService.getFare(flightId, classType);
		booking.setBookingNumber("231254");
		System.out.println(total);
		booking.setPerson(person);
		booking.setTotalCost(total);
		booking.setBookingId(87878);
		//booking.setFlightMaster(flightMaster);
		for(int i=0;i<seat;i++)
		{
			String userName=request.getParameter("username"+i);
			String middleName=request.getParameter("middlename"+i);
			String lastName=request.getParameter("lastname"+i);
			String gender=request.getParameter("gender"+i);
			String mealPreferences=request.getParameter("meal"+i);
			String passengerType=request.getParameter("passengerType"+i);
			String age=request.getParameter("age"+i);
			String passportNumber=request.getParameter("passport"+i);
		
			
			//passenger.setPassengerId(9000+i);
			passenger.setPassengerId(6776+i);
			passenger.setFirstName(userName);
			passenger.setMiddleName(middleName);
			passenger.setLastName(lastName);
			passenger.setGender(gender);
			passenger.setMealPreferences(mealPreferences);
			passenger.setPassengerType(passengerType);
			passenger.setPassportNumber(passportNumber);
			passenger.setAge(Integer.parseInt(age));
			passengers.add(passenger);
		}
		try
		{
		request.getSession().setAttribute("booking", booking);
		request.getSession().setAttribute("list", passengers);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("modeSelect");
		requestDispatcher.include(request, response);
		}
		catch(Exception e)
		{}
	}
	@RequestMapping("modeSelect")
	public ModelAndView modeSelect(HttpServletRequest request,HttpServletResponse response)
	{
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0);
		return new ModelAndView("modeSelect");
	}
	
	@RequestMapping("payment")
	public ModelAndView pay(HttpServletRequest request,HttpServletResponse response)
	{		
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0);
		return new ModelAndView("payment");
	}
	
	@RequestMapping("donePayment")
	public ModelAndView payed(HttpServletRequest request,HttpServletResponse response)
	{
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0);
		ModelAndView model=new ModelAndView("donePayment");
		model.addObject("passenger",passengers);
		model.addObject("booking",booking);
		return model;
	}
	
	@RequestMapping("paymentFailure")
	public ModelAndView fail(HttpServletRequest request,HttpServletResponse response)
	{
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0);
		return new ModelAndView("modeSelect","msg","Payment Failed try again");
	}
	
	@RequestMapping("paymentPass")
	public ModelAndView succ(HttpServletRequest request,HttpServletResponse response)
	{
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires", 0);
		/*booking=(Booking)request.getSession().getAttribute("booking");
		passengers=(List<Passenger>)request.getSession().getAttribute("list");
		*/if(bookingService.bookTicket(booking, passengers))
		{
/*			request.getSession().removeAttribute("booking");
			request.getSession().removeAttribute("list");
*/			return new ModelAndView("successful","msg","from booking");
		}
		else
		{
			return new ModelAndView("unsuccessful");
		}
	}
	
	@RequestMapping("/sessionTest")
	public ModelAndView sessionStrat(HttpServletRequest request,HttpServletResponse response)
	{
		if(request.getSession().getAttribute("logged")==null)
		{
		request.getSession().setAttribute("logged", "true");
		request.getSession().setAttribute("name", "pravesh");
		}
		else
		{
			return new ModelAndView("online","msg","you are already logged in");
		}
		return new ModelAndView("online");
	}
	@RequestMapping("/sessionInv")
	public ModelAndView sessionInva(HttpServletRequest request,HttpServletResponse response)
	{
		if(request.getSession().getAttribute("logged")!=null)
		{
			request.getSession().invalidate();
		}
		else
		{
			return new ModelAndView("online","msg","already logged out");
		}
		return new ModelAndView("online");
	}
	
	@RequestMapping("generateTicket")
	public ModelAndView genrateTicket(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView model=new ModelAndView("generateTicket");
/*		booking=(Booking)request.getSession().getAttribute("booking");
		passengers=(List<Passenger>)request.getSession().getAttribute("list");
*/		model.addObject("booking",booking);
		model.addObject("total", passengers);
/*		request.getSession().removeAttribute("booking");
		request.getSession().removeAttribute("list");
*/		return model;
	}
}
