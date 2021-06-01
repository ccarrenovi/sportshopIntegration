package org.jbossgroup.bean;

import javax.inject.Named;

@Named("helloBean")
public class HelloBean {

	public String hello(String name) throws Exception{
		return "Hola "+name +", hoy es "+new java.util.Date()+"\n"; 
	}
	
}
