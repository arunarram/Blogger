<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="connect.jsp" %>
    <%@ page import="java.sql.*,java.io.*,java.util.*,java.text.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.tailwindcss.com"></script>
<title>Blogger</title>
</head>
<body>
<header class="text-gray-600 body-font bg-stone-800 px-10 sticky top-0" >
  <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0" href="index.jsp">
      <span class="ml-3 text-xl">Blogger</span>
    </a>
   <!--  <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center text-slate-100">
      <a class="mr-5 hover:text-white" href="#">Admin</a>
    </nav> -->
    <a href="createblog.jsp" class="md:ml-auto flex flex-wrap items-center text-base justify-center ">
    <button class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0" >Create your Blog
      <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
        <path d="M5 12h14M12 5l7 7-7 7"></path>
      </svg>
    </button>
    </a>
  </div>
</header>

<%
	int id=Integer.parseInt(request.getParameter("id"));
	String rollno="",name="",email="",blog="",blogTitle;
	java.util.Date date;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
	try{
		String query;
		if(application.getAttribute("admin")!=null){
			query="select * from blogs where id = "+id;
        }
		else{
			query="select * from blogs where status='"+"published"+"' and id = "+id ;
		}
		Statement st=connection.createStatement();
	   	ResultSet rs=st.executeQuery(query);
	   	
	   	if(rs.next()){
	   		
	   		rollno=rs.getString(2);
	   		name=rs.getString(3);
	   		email=rs.getString(4);
	   		date=sdf.parse(rs.getString(5));
	   		blogTitle=rs.getString(6);
	   		blog=rs.getString(7);

	   		
	   		
	   	%>

	<!--Container-->
	<div class="container w-full md:max-w-3xl mx-auto pt-5 bg-gray-100 font-sans leading-normal tracking-normal">

		<div class="w-full px-4 md:px-6 text-xl text-gray-800 leading-normal" style="font-family:Georgia,serif;">

			<!--Title-->
			<div class="font-sans">
				<p class="text-base md:text-sm text-green-500 font-bold">&lt; <a href="index.jsp" class="text-base md:text-sm text-green-500 font-bold no-underline hover:underline">BACK TO BLOGS</a></p>
						<h1 class="font-bold font-sans break-normal text-gray-900 pt-6 pb-2 text-3xl md:text-4xl"><%out.println(blogTitle);%></h1>
						<p class="text-sm md:text-base font-normal text-gray-600">Published <%out.println(date);%></p>
			</div>


			<!--Post Content-->

			 <div class="rounded-lg h-64 overflow-hidden">
		        <img alt="image" class="object-cover object-center h-full w-full" src="displayImage.jsp?imgid=<%=id%>">
		      </div>
			<p class="py-6 break-words">
				<%out.println(blog.replaceAll("(\r\n|\n)", "<br>"));%>
			</p>


			<!--/ Post Content-->

		</div>

		


		<!--Author-->
		<div class="flex w-full items-center font-sans px-4 py-12">
			
			<div class="flex-1 px-2">
				<p class="text-base font-bold text-base md:text-xl leading-none mb-2"><%out.println(name);%></p>
				<p class="text-gray-600 text-xs md:text-base"><%out.println(rollno);%></p>
			</div>
			
		</div>
		<!--/Author-->
	<%	
	   	}
	   	connection.close();
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}










%>
	

</body>
</html>