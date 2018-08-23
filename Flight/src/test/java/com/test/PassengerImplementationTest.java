package com.test;

import static org.junit.Assert.*;

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
	
	String x = (""+Math.random()).substring(0, 2);
	@Test
	public void testPassenger()
	{
		
		Passenger passenger=new Passenger();
		passenger.setPassengerId(t);
		passenger.setPassengerType("child");
		passenger.setFirstName("sunil");
		passenger.setMiddleName("babu");
		passenger.setLastName("xyz");
		passenger.setPassportNumber("PA"+ x +"18722");
		passenger.setMealPreferences("NVG");

		assertTrue(passengerDAO.newPassenger(passenger));
	}
	
	
}
