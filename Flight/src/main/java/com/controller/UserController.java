package com.controller;

import java.util.ArrayList;
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

import com.dao.PersonDAO;
import com.dao.implementation.PersonImplementation;
import com.model.AddressDetail;
import com.model.Booking;
import com.model.LocationMaster;
import com.model.Person;
import com.service.UserService;
import com.service.UserServiceImplementation;

@Controller  
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/checkLogin")  
    public ModelAndView checkLogin(HttpServletRequest request,HttpServletResponse response) {   
		String emailId=request.getParameter("email");  
	    String password=request.getParameter("password");
	    Boolean isUser = userService.checkLogin(emailId, password);
	    if(isUser) {	      	    	    
	    	request.getSession().setAttribute("logged", "true"); //---------- edited in integration v2
	    	Person person = userService.getPerson(emailId);
	    	request.getSession().setAttribute("person", person);	    	
/*	    	System.out.println("Session saved: "+emailId);	
*/	        //return new ModelAndView("homepage","message","Logged in successfully!");
	    	return new ModelAndView("homepage_logged","message","Logged in successfully!"); //---------- added in integration v2
	    }
	    else {	        	    	
        	//return new ModelAndView("unsuccessfulLogin","message","Invalid credentials!");
/*	    	System.out.println("Invalid credentials!");
*/	    	return new ModelAndView("unsuccessful","message","Invalid credentials!"); //---------- added in integration v2
	    }
	} 
	
	@RequestMapping("/register")  
    public ModelAndView register() {   
	        return new ModelAndView("register"); 
	}
	
	@RequestMapping("/homepage")  
    public ModelAndView homeIfLogged() {   
	        return new ModelAndView("homepage_logged"); 
	}
	
	@RequestMapping("/login")  
    public ModelAndView login() {   		 
	        return new ModelAndView("login"); 
	}
	@RequestMapping("/contact")  
    public ModelAndView contact() {   		 
	        return new ModelAndView("contact"); 
	}
	@RequestMapping("/about")  
    public ModelAndView about() {   		 
	        return new ModelAndView("about"); 
	}
	
	@RequestMapping(value="/registrationDetails",method=RequestMethod.POST)
	public ModelAndView registrationDetails(HttpServletRequest request,HttpServletResponse res) {
	        	Person person=new Person();	        
		        //person.setPersonId(12345);
	        	String title=request.getParameter("title");
	        	person.setTitle(title);
		        String emailId = request.getParameter("emailAddress");
		        person.setEmailAddress(emailId);
		        person.setFirstName(request.getParameter("firstName"));
		        person.setMiddleName(request.getParameter("middleName"));
		        person.setLastName(request.getParameter("lastName"));
		        person.setPassword(request.getParameter("password"));
		        person.setGender(request.getParameter("gender"));
		        person.setMobileNumber(Long.parseLong(request.getParameter("mobileNumber")));
		        person.setPassportNumber(request.getParameter("passportNumber"));
		        person.setDateOfBirth(java.sql.Date.valueOf(request.getParameter("dateOfBirth")));
	   		
	   		boolean ifUserNotExists=userService.checkIfUserExists(person.getEmailAddress());
	   		 if(ifUserNotExists)
	   		 {
	   			if(userService.registerPerson(person))
	   			 {
	   				request.getSession().setAttribute("logged", "true"); //---------- edited in integration v2
	   		    	Person person1 = userService.getPerson(emailId);
	   		    	request.getSession().setAttribute("person", person1);
	   		    	ModelAndView model=new ModelAndView("userProfile");
	   		    	model.addObject("message", "Registered successfully");
	   				 return model; //i.e if registered
	   			 }
	   			 else
	   			 {
		   			 return new ModelAndView("registrationDetails","message","Error! Couldn't register!"); //i.e if not registered...add relevant message here
	   			 }
	   		 }
	   		 else
	   		 {
	   			 return new ModelAndView("unsuccessful","message","Couldn't register! User already exists!");
	   		 }  
	   		 
	   			 /*userService.registerPerson(person);
	   			 System.out.println("User registered successfully");
	   			 return new ModelAndView("homepage"); 
	   		 }
	   		 else
	   		 {
	   			String message=emailId+" already exists";
	   			return new ModelAndView("unsuccessfulRegistration", "message",message); 
	   		 }  */
	  }
	 
/*	 @RequestMapping("/logout")  
	 public ModelAndView logout(HttpServletRequest request,
			 HttpServletResponse response) {  
		 request.getSession().invalidate();
		 System.out.println("Logged out...");
	     return new ModelAndView("homepage");  
	 }
	 @RequestMapping("login")
	 public String goLogin()
	 {
		 return ("/login");
	 }*/ //---------- added in integration v2
	
	@RequestMapping("logout")
	 public ModelAndView log(HttpServletRequest request,HttpServletResponse response)
	 {
		 if(request.getSession().getAttribute("logged")!=null)
		 {
			 request.getSession().invalidate();
			 System.out.println("Logged out!");
			 return new ModelAndView("homepage");
		 }
		 else
		 {
			 System.out.println("Already logged out!");
			 return new ModelAndView("homepage");
		 }
	 } //---------- added in integration v2
	
	@RequestMapping("logins")
	 public ModelAndView logins(HttpServletRequest request,HttpServletResponse response)
	 {
		 return new ModelAndView("logins");
	 } //---------- added in integration v2
	
	 @RequestMapping("checkLogins")
	 public void loginss(HttpServletRequest request,HttpServletResponse response)
	 {
		 request.getSession().setAttribute("logged", "true");
		 String path="bookflight"+(String)request.getSession().getAttribute("path");
		 System.out.println("path is "+path);
		 String emailId=request.getParameter("email");  
	     String password=request.getParameter("password");
	     Boolean temp=userService.checkLogin(emailId, password);
	     if(temp){
		 try{
			 request.getSession().setAttribute("logged", "true");
		    	Person person = userService.getPerson(emailId);
		    	request.getSession().setAttribute("person", person);	    	
		    	System.out.println("Session saved: "+emailId);
			 response.sendRedirect(path);
		 }
		 catch(Exception e){}
		 //return new ModelAndView(path);
	     }
	 } //---------- added in integration v2
	 
	 @RequestMapping("/user")
	 public ModelAndView viewUserProfile(HttpServletRequest request,
			 HttpServletResponse response) {  
		 	String emailId = (String) request.getSession().getAttribute("emailId");
		 	Person person = userService.getPerson(emailId);
		 	return new ModelAndView("userProfile","person",person);
	 }
	 
	 @RequestMapping("/editUser")
	 public ModelAndView editUserProfile(HttpServletRequest request,
			 HttpServletResponse response) {   		 	
		 	String emailId = (String) request.getSession().getAttribute("emailId");
		 	Person person = userService.getPerson(emailId);		 
		 	return new ModelAndView("userProfileEdit","person",person);
	 }
	 
	 @RequestMapping(value="/addAddressDetails",method=RequestMethod.GET)
	 public ModelAndView addAddressDetails (HttpServletRequest request,
			 HttpServletResponse response) {       	
     	AddressDetail addressDetail=new AddressDetail();
     	addressDetail.setAddressId(3);
     	addressDetail.setType(request.getParameter("type"));
     	addressDetail.setLine1(request.getParameter("line1"));
     	addressDetail.setLine2(request.getParameter("line2"));
     	addressDetail.setLine3(request.getParameter("line3"));
     	addressDetail.setCity(request.getParameter("city"));
     	addressDetail.setPincode(Integer.parseInt(request.getParameter("pincode")));
     	addressDetail.setCountry(request.getParameter("country"));
     	/*String personEmailId = (String) request.getSession().getAttribute("emailId");
     	Person person = userService.getPerson(personEmailId);*/ 
     	Person person = (Person) request.getSession().getAttribute("person"); //----- added in integration v2
     	addressDetail.setPerson(person);
     	userService.addAddress(addressDetail);	         	
     	return new ModelAndView("userProfile","message","Address added successfully!");  
	}
	 
	 /*@RequestMapping("/bookingDetails")
	 public ModelAndView bookingDetails (HttpServletRequest request,HttpServletResponse response) {   		 	
	        return new ModelAndView("bookingdetails");  
	 }
	 
	 @RequestMapping("/cancelBooking")
	 public ModelAndView cancelBooking() {
	        return new ModelAndView("welcomepage");  
	    }
	 
	 @RequestMapping("/getHistory")
	 public ModelAndView getHistory() {   	
		 	
	        return new ModelAndView("welcomepage");  
	    }
	 */
	   /* @RequestMapping("/homepage")  
	    public ModelAndView homepage() {   
		 List<LocationMaster> list=new ArrayList();
		 for(LocationMaster aa:list)
			{
				String name=aa.getAirportName()+"("+aa.getCode()+")";
				int id=aa.getLocationMasterId();
				System.out.println(id+" "+name);
			}
	        return new ModelAndView("homepage","total",list);  
	    }*/ 
	 
	 @RequestMapping("/getHistory")
	 public ModelAndView getHistory(HttpServletRequest request,HttpServletResponse res) {
		 System.out.println("history");
		 Person person=(Person) request.getSession().getAttribute("person");
		 System.out.println(person+person.getEmailAddress());
		 int personId=person.getPersonId();
		 System.out.println(person.getPersonId());
		 	List<Booking> bookings=userService.getHistory(personId);
	        return new ModelAndView("history","history",bookings);  
	    }
}
