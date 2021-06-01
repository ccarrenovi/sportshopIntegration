package org.jbossgroup.tx;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Named;
import javax.transaction.TransactionManager;
import javax.transaction.UserTransaction;

import org.springframework.transaction.jta.JtaTransactionManager;

@Named("transactionManager")
public class CustomTransactionManager extends JtaTransactionManager {

	
	private static final long serialVersionUID = 1L;
	
	@Resource(mappedName = "java:/TransactionManager")
	private TransactionManager transactionManager;
	
	@Resource(mappedName="java:jboss/UserTransaction")
	private UserTransaction userTransaction;
	
	@PostConstruct
	public void initTransactionManager() {
		setTransactionManager(transactionManager);
		setUserTransaction(userTransaction);
	}
}
