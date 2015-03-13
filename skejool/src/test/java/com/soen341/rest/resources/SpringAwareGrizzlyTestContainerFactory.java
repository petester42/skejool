package com.soen341.rest.resources;

import java.io.IOException;
import java.net.URI;
import java.util.EventListener;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import javax.servlet.Servlet;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.core.UriBuilder;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.sun.grizzly.http.embed.GrizzlyWebServer;
import com.sun.grizzly.http.servlet.ServletAdapter;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.client.apache.ApacheHttpClient;
import com.sun.jersey.client.apache.config.ApacheHttpClientConfig;
import com.sun.jersey.client.apache.config.DefaultApacheHttpClientConfig;
import com.sun.jersey.spi.spring.container.servlet.SpringServlet;
import com.sun.jersey.test.framework.AppDescriptor;
import com.sun.jersey.test.framework.WebAppDescriptor;
import com.sun.jersey.test.framework.WebAppDescriptor.FilterDescriptor;
import com.sun.jersey.test.framework.spi.container.TestContainer;
import com.sun.jersey.test.framework.spi.container.TestContainerException;
import com.sun.jersey.test.framework.spi.container.TestContainerFactory;

//--------------------------------------------------------------------------------------------------------------------------------
// Extracted from :
// http://geek.riffpie.com/2010/08/09/unit-testing-restful-jersey-services-glued-together-with-spring/
// --------------------------------------------------------------------------------------------------------------------------------
public class SpringAwareGrizzlyTestContainerFactory implements TestContainerFactory
{
	private Object springTarget;

	// --------------------------------------------------------------------------------------------------------------------------------
	public SpringAwareGrizzlyTestContainerFactory(Object pSpringTarget)
	{
		this.springTarget = pSpringTarget;
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	public TestContainer create(URI baseUri, AppDescriptor ad)
	{
		assertWebAppDescriptor(ad);
		return new SpringAwareGrizzlyWebTestContainer(baseUri, (WebAppDescriptor) ad, springTarget);
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	@SuppressWarnings("unchecked")
	public Class<?> supports()
	{
		return WebAppDescriptor.class;
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	private void assertWebAppDescriptor(AppDescriptor ad)
	{
		if (!(ad instanceof WebAppDescriptor))
		{
			throw new IllegalArgumentException("The application descriptor must be an instance of WebAppDescriptor");
		}
	}

	//--------------------------------------------------------------------------------------------------------------------------------
	private static class SpringAwareGrizzlyWebTestContainer implements TestContainer
	{
		private static final Logger log = Logger.getLogger(SpringAwareGrizzlyWebTestContainer.class.getName());
		private URI baseUri;
		private GrizzlyWebServer webServer;
		private Object springTarget;
		private Servlet servletInstance;

		//--------------------------------------------------------------------------------------------------------------------------------
		private SpringAwareGrizzlyWebTestContainer(URI pBaseUri, WebAppDescriptor pAd, Object pSpringTarget)
		{
			this.springTarget = pSpringTarget;
			this.baseUri = UriBuilder.fromUri(pBaseUri).path(pAd.getContextPath()).path(pAd.getServletPath()).build();

			log.info("Creating Grizzly Web Container configured at the base URI " + this.baseUri);
			if (pAd.getServletClass() != null && pAd.getServletClass().equals(SpringServlet.class))
				log.warning("You have configured a SpringServlet class - this is unnecessary, as I default to that anyway");

			instantiateGrizzlyWebServer(pAd);
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		public Client getClient()
		{
			DefaultApacheHttpClientConfig config = new DefaultApacheHttpClientConfig();
			config.getProperties().put(ApacheHttpClientConfig.PROPERTY_HANDLE_COOKIES, Boolean.TRUE);
			ApacheHttpClient client = ApacheHttpClient.create(config);
			return client;
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		public URI getBaseUri()
		{
			return baseUri;
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		public void start()
		{
			log.info("Starting the Grizzly Web Container...");

			try
			{
				webServer.start();
				autoWireSpringTarget();
			}
			catch (IOException ex)
			{
				throw new TestContainerException(ex);
			}
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		public void stop()
		{
			log.info("Stopping the Grizzly Web Container...");
			webServer.stop();
			webServer.getSelectorThread().stopEndpoint();
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void instantiateGrizzlyWebServer(WebAppDescriptor pAd)
		{
			webServer = new GrizzlyWebServer(baseUri.getPort());
			ServletAdapter sa = new ServletAdapter();
			sa.setProperty("load-on-startup", Integer.valueOf(1));
			servletInstance = createrServletInstance(pAd.getServletClass());
			sa.setServletInstance(servletInstance);

			populateEventListeners(sa, pAd.getListeners());
			populateFilterDescriptors(sa, pAd.getFilters());
			populateContextParams(sa, pAd.getContextParams());
			populateInitParams(sa, pAd.getInitParams());
			setContextPath(sa, pAd.getContextPath());
			setServletPath(sa, pAd.getServletPath());

			String[] mapping = null;
			webServer.addGrizzlyAdapter(sa, mapping);
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void setServletPath(ServletAdapter sa, String servletPath)
		{
			if (notEmpty(servletPath))
			{
				sa.setServletPath(servletPath);
			}
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void setContextPath(ServletAdapter sa, String contextPath)
		{
			if (notEmpty(contextPath))
			{
				sa.setContextPath(ensureLeadingSlash(contextPath));
			}
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private boolean notEmpty(String string)
		{
			return string != null && string.length() > 0;
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void populateInitParams(ServletAdapter sa, Map<String, String> initParams)
		{
			for (String initParamName : initParams.keySet())
			{
				sa.addInitParameter(initParamName, initParams.get(initParamName));
			}
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void populateContextParams(ServletAdapter sa, Map<String, String> contextParams)
		{
			for (String contextParamName : contextParams.keySet())
			{
				sa.addContextParameter(contextParamName, contextParams.get(contextParamName));
			}
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void populateFilterDescriptors(ServletAdapter sa, List<FilterDescriptor> filters)
		{
			if (filters != null)
			{
				for (WebAppDescriptor.FilterDescriptor d : filters)
				{
					sa.addFilter(instantiate(d.getFilterClass()), d.getFilterName(), d.getInitParams());
				}
			}
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void populateEventListeners(ServletAdapter sa, List<Class<? extends EventListener>> listeners)
		{
			for (Class<? extends EventListener> eventListener : listeners)
			{
				sa.addServletListener(eventListener.getName());
			}
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private String ensureLeadingSlash(String string)
		{
			return(string.startsWith("/") ? string : "/".concat(string));
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private Servlet createrServletInstance(Class<? extends HttpServlet> servletClass)
		{
			return(servletClass == null ? new SpringServlet() : instantiate(servletClass));
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private <I> I instantiate(Class<? extends I> clazz)
		{
			I instance = null;
			try
			{
				instance = clazz.newInstance();
			}
			catch (InstantiationException e)
			{
				throw new TestContainerException(e);
			}
			catch (IllegalAccessException e)
			{
				throw new TestContainerException(e);
			}
			return instance;
		}

		//--------------------------------------------------------------------------------------------------------------------------------
		private void autoWireSpringTarget()
		{
			WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletInstance
				.getServletConfig().getServletContext());
			AutowireCapableBeanFactory beanFactory = ctx.getAutowireCapableBeanFactory();
			beanFactory.autowireBean(springTarget);
		}
	}
}
