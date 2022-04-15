<title>Authentication Page</title>


<%@ include file="connect.jsp"%>

<%
	
try {
		
		String username = request.getParameter("username");
	String password = request.getParameter("password");
	application.setAttribute("admin","logged");
		String sql = "SELECT * FROM admin where username='" + username+ "' and password='" + password + "' ";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()==true)
		{
			response.sendRedirect("admin_data.jsp");
		}
		 else 
		{
			response.sendRedirect("index.jsp");
		}
		connection.close();
	}
	catch (Exception e)
	{
		//out.print(e);
	}%>

