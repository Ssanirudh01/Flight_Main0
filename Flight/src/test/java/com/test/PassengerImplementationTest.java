package com.test;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.SessionFactory;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dao.PassengerDAO;
import com.model.Passenger;

public class PassengerImplementationTest {
	int t = (int)Math.random();
	private static ApplicationContext ctx;
	@Autowired
	private SessionFactory factory;
	@BeforeClass
	public static void fact(){
	
		ctx = new ClassPathXmlApplicationContext("mybeans.xml");
		System.out.println(ctx);
	}

	PassengerDAO passengerDAO=ctx.getBean(PassengerDAO.class);
	
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
    Date date = new Date();  
    String h = (formatter.format(date)).substring(11,13);
    String m = (formatter.format(date)).substring(14,16);  
	@Test
	public void testPassenger()
	{
		
		Passenger passenger=new Passenger();
		passenger.setPassengerId(t);
		passenger.setPassengerType("child");
		passenger.setFirstName("sunil");
		passenger.setMiddleName("babu");
		passenger.setLastName("xyz");
		passenger.setPassportNumber("PASS"+h+m);
		passenger.setMealPreferences("NVG");

		assertTrue(passengerDAO.newPassenger(passenger));
	}
	
	
}
