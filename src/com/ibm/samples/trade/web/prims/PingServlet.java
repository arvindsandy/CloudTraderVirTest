//
// "This sample program is provided AS IS and may be used, executed, copied and modified without royalty payment by customer (a) for its own
// instruction and study, (b) in order to develop applications designed to run with an IBM WebSphere product, either for customer's own internal use 
// or for redistribution by customer, as part of such an application, in customer's own products. " 
//
// (C) COPYRIGHT International Business Machines Corp., 2005
// All Rights Reserved * Licensed Materials - Property of IBM
//

package com.ibm.samples.trade.web.prims;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.ibm.samples.trade.util.*;

/**
 *
 * PingServlet tests fundamental dynamic HTML creation functionality through
 * server side servlet processing.
 *
 */
public class PingServlet extends HttpServlet
{

	private static String initTime;
	private static int hitCount;

	/**
	 * forwards post requests to the doGet method
	 * Creation date: (11/6/2000 10:52:39 AM)
	 * @param res javax.servlet.http.HttpServletRequest
	 * @param res2 javax.servlet.http.HttpServletResponse
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		doGet(req, res);
	}
	/**
		* this is the main method of the servlet that will service all get requests.
		* @param request HttpServletRequest
		* @param responce HttpServletResponce
		**/
	public void doGet(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException
	{
		try
			{
			res.setContentType("text/html");

			// The following 2 lines are the difference between PingServlet and PingServletWriter
			//   the latter uses a PrintWriter for output versus a binary output stream.
			ServletOutputStream out = res.getOutputStream();
			//java.io.PrintWriter out = res.getWriter();
                        hitCount++;
			out.println(
				"<html><head><title>Ping Servlet</title></head>"
					+ "<body><HR><BR><FONT size=\"+2\" color=\"#000066\">Ping Servlet<BR></FONT><FONT size=\"+1\" color=\"#000066\">Init time : "
					+ initTime
					+ "<BR><BR></FONT>  <B>Hit Count: "
					+ hitCount
					+ "</B></body></html>");
		}
		catch (Exception e)
			{
			Log.error(e, "PingServlet.doGet(...): general exception caught");
			res.sendError(500, e.toString());

		}
	}
	/** 
	 * returns a string of information about the servlet
	 * @return info String: contains info about the servlet
	 **/
	public String getServletInfo()
	{
		return "Basic dynamic HTML generation through a servlet";
	}
	/**
	* called when the class is loaded to initialize the servlet
	* @param config ServletConfig:
	**/
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
		initTime = new java.util.Date().toString();
		hitCount = 0;

	}
}