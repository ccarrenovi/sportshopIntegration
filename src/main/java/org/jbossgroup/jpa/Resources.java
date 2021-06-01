package org.jbossgroup.jpa;

import javax.enterprise.context.ApplicationScoped;
import javax.enterprise.inject.Produces;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@ApplicationScoped
public class Resources {
	
	@Produces
	@PersistenceContext(unitName = "sportShopJpa")
    private EntityManager entityManager;
}
