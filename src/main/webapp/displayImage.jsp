<%@ page language="java" contentType="image/*; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*" %> 
<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="image/*; charset=UTF-8"">
<title>Blogger</title>
</head>
<body>
<%
	int id = Integer.parseInt(request.getParameter("imgid"));
	//String type=request.getParameter("type");
  	try{
	       
			Statement st=connection.createStatement();
			String strQuery = "select image from blogs where id="+id ;
			ResultSet rs = st.executeQuery(strQuery);
	
			Blob image=null;
			byte[] imgData=null;
			if(rs.next()){
				image=rs.getBlob(1);
				imgData=image.getBytes(1,(int)image.length());
			}
			response.setContentType("image/*");
			OutputStream o= response.getOutputStream();
			o.write(imgData);
			o.flush();
			o.close();
			out.clear(); 
			out = pageContext.pushBody();
			
    	/*  String imgLen="";
    	if(rs.next())
		{
      		imgLen = rs.getString(1);
     	}  
    	rs = st.executeQuery(strQuery);
    	if(rs.next())
		{
      		int len = imgLen.length();
		  	byte [] rb = new byte[len];
		  	InputStream readImg = rs.getBinaryStream(1);
		 	int index=readImg.read(rb, 0, len);  
		  	st.close();
		  	response.reset();
		  	response.getOutputStream().write(rb,0,len); 
		  	response.getOutputStream().flush();
		  	response.getOutputStream().close();
		 } */
    	connection.close();
  	}
  	catch (Exception e){
    	e.printStackTrace();
  	}
%>

</body>
</html>