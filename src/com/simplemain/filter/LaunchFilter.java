package com.simplemain.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.logicalcobwebs.proxool.ProxoolFacade;
import org.logicalcobwebs.proxool.configuration.PropertyConfigurator;
import org.slf4j.MDC;

import com.simplemain.util.L;

public class LaunchFilter implements Filter
{

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException
	{
		final HttpServletRequest  request  = (HttpServletRequest)req;
		final HttpServletResponse response = (HttpServletResponse)res;
		final long processStartTime        = System.currentTimeMillis();
		
		try
		{
			chain.doFilter(req, res);
		}
		finally
		{
			final long processEndTime = System.currentTimeMillis();
			final long useTime        = processEndTime - processStartTime;
			
			printLog(request, response, useTime);
		}
	}

	public void init(FilterConfig arg0) throws ServletException
	{
		try
		{
			PropertyConfigurator.configure(System.getProperty("user.dir") + "/conf/db");
		}
		catch (Throwable e)
		{
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

	public void destroy()
	{
		ProxoolFacade.shutdown(1);
	}
	
	private void printLog(HttpServletRequest request, HttpServletResponse response, long useTime)
	{
		final String remoteIp = request.getRemoteAddr();
		MDC.put("ip", remoteIp);
		
		final String logId    = "" + System.currentTimeMillis();
		MDC.put("logid", logId);
		
		final String msg = String.format("NOTICE: proctime[%d] status[%d] url[%s]", 
				useTime, response.getStatus(), request.getRequestURL());
		
		L.log.info(msg);
	}
}
