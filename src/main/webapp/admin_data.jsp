<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.io.*,java.util.*,java.text.*" %> 
    <%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blogger</title>

</head>
<body class="bg-gray-100">
<header class="text-gray-600 body-font bg-stone-800 px-10 sticky top-0" >
  <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0" href="index.jsp">

      <span class="ml-3 text-xl">Blogger</span>
    </a>
  </div>
</header>
	<%	
	if(application.getAttribute("admin")==null){
		response.sendRedirect("index.jsp");
	}
	%>
	<section class="text-gray-600 body-font">
  <div class="container px-5 py-24 mx-auto">
    <div class="lg:w-2/3 w-full mx-auto overflow-auto">
      <table class="table-auto w-full text-left whitespace-no-wrap">
        <thead>
          <tr>
            <th class="px-5   py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tl rounded-bl">Title</th>
            <th class="px-4  py-3 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100">Publish</th>
            <th class="w-10 title-font tracking-wider font-medium text-gray-900 text-sm bg-gray-100 rounded-tr rounded-br"></th>
          </tr>
        </thead>
        <tbody>
          
          
          <%

	String status="",blogTitle="";
	int id;

	try{
		String query="select * from blogs where status='"+"published"+"' or status='"+"pending"+"' ORDER BY id DESC;  ";
		Statement st=connection.createStatement();
	   	ResultSet rs=st.executeQuery(query);
	   	
	   	while(rs.next()){
	   		id=rs.getInt(1);
	   		blogTitle=rs.getString(6);
	   		status=rs.getString(9);
	   		
	   		%>
	   		<tr>
	   		<td class="px-4  py-3"> <a href="blog.jsp?id=<%=id%>"> <% out.println(blogTitle); %></a></td>
            
            <%
            if(status.equalsIgnoreCase("pending"))
			{
			
		%>
              <td class="px-4  py-3 text-lg text-gray-900"><a href="publish.jsp?id=<%=id%>"><% out.println(status);%></a></div></td>
              <%
		
			}else
			{
		%>
              <td class="px-4  py-3 text-lg text-gray-900"><% out.println(status);%></td>
            <%
			  }
            
            
            
            %>
            <td class="px-4  py-3 text-lg text-gray-900"><a href="delete.jsp?id=<%=id%>">Delete</a></td>
          	</tr>

	   		<%
	   		
	   		
	   		
	   	}
	   	connection.close();
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}










%>
          
          
          
          
          
          
            
            
          
        </tbody>
      </table>
    </div>
    
    
    
    
    
    
    <div class="flex pl-4 mt-4 lg:w-2/3 w-full mx-auto">
    <a href="admin.jsp" >
      <button class="flex ml-auto text-white bg-indigo-500 border-0 py-2 px-6 focus:outline-none hover:bg-indigo-600 rounded">Log out</button>
      </a>
    </div>
  </div>
</section>
	
	
</body>
</html>