package org.jbossgroup.bean;

import javax.annotation.Resource;
import javax.ejb.Startup;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.jms.ConnectionFactory;
import javax.persistence.EntityManager;
import javax.ws.rs.core.MediaType;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.cdi.ContextName;
import org.apache.camel.component.jms.JmsComponent;
import org.apache.camel.component.jpa.JpaComponent;
import org.apache.camel.model.rest.RestBindingMode;
import org.jbossgroup.entity.Customer;
import org.jbossgroup.tx.CustomTransactionManager;

@Startup
@ApplicationScoped
@ContextName("camel-eap-context")
public class HelloRouteBuilder extends RouteBuilder {
	@Inject
	private EntityManager entityManager;

	@Inject
	private CustomTransactionManager transactionManager;

	@Resource(mappedName = "java:jboss/exported/jms/RemoteConnectionFactory")
	private ConnectionFactory connectionFactory;

	@Override
	public void configure() throws Exception {

		JmsComponent jmsComponent = JmsComponent.jmsComponentTransacted(connectionFactory, transactionManager);
		jmsComponent.setTransacted(false);
		jmsComponent.setUsername("jmsuser");
		jmsComponent.setPassword("Redh@t123");
		getContext().addComponent("jms", jmsComponent);

		JpaComponent jpaComponent = new JpaComponent();
		jpaComponent.setEntityManagerFactory(entityManager.getEntityManagerFactory());
		jpaComponent.setTransactionManager(transactionManager);
		getContext().addComponent("jpa", jpaComponent);
        
		//Referencia Student Guide AD421 Pagina 276
		onException(Exception.class)
		   .handled(true)
		   .to("jms:queue:DeadLetter");

		restConfiguration()
		    .component("undertow")
		    .bindingMode(RestBindingMode.json)
			.dataFormatProperty("prettyPrint", "true")
			.contextPath("api");

		rest("/hello")
		  .get("{name}")
		  .produces(MediaType.APPLICATION_JSON)
		  .route()
			 .bean(HelloBean.class, "hello(${header.name})")
			 .log("recibiendo respuesta ...")
		  .endRest();

		rest("/customer")
		  .post()
		  .type(Customer.class)
		  .route()
		     .wireTap("direct:entities")
		     .marshal().json()
			 .log("message body: ${body}")
		  .endRest();

		from("direct:entities")
		  .transacted("PROPAGATION_REQUIRES_NEW")
		  .to("jpa:" + Customer.class.getName());
	}

}
