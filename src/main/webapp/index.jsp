<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.io.*,java.util.*,java.text.*" %> 
    <%@ include file="connect.jsp" %>
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
    <!-- <nav class="md:ml-auto flex flex-wrap items-center text-base justify-center text-slate-100">
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

<section class="text-gray-600 body-font">
  <div class="container px-5 py-10 mx-auto">
    <div class="flex flex-wrap -m-4">
    
    
<%

	String rollno="",name="",email="",blog="",blogTitle;
	int id;
	java.util.Date date;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
	try{
		String query="select * from blogs where status='"+"published"+"' ORDER BY id DESC;  ";
		Statement st=connection.createStatement();
	   	ResultSet rs=st.executeQuery(query);
	   	
	   	while(rs.next()){
	   		id=rs.getInt(1);
	   		rollno=rs.getString(2);
	   		name=rs.getString(3);
	   		email=rs.getString(4);
	   		date=sdf.parse(rs.getString(5));
	   		blogTitle=rs.getString(6);
	   		blog=rs.getString(7);
	   		blog=blog.substring(0,100);
	   		
	   		
	   	%>
	   	<div class="p-4 md:w-1/3">
        <div class="h-full border-2 border-gray-200 border-opacity-60 rounded-lg overflow-hidden">
          <img class="lg:h-48 md:h-36 w-full object-cover object-center" src="displayImage.jsp?imgid=<%=id%>" alt="blog">
          <div class="p-6">
            <h2 class="tracking-widest text-xs title-font font-medium text-gray-400 mb-1">TITLE</h2>
            <h1 class="title-font text-lg font-medium text-gray-900 mb-3"><%out.println(blogTitle);%></h1>
            <p class="leading-relaxed mb-3"><%out.println(blog);%></p>
            <div class="flex items-center flex-wrap ">
              <a class="text-indigo-500 inline-flex items-center md:mb-2 lg:mb-0" href="blog.jsp?id=<%=id%>">Read More
                <svg class="w-4 h-4 ml-2" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M5 12h14"></path>
                  <path d="M12 5l7 7-7 7"></path>
                </svg>
              </a>
              
            </div>
          </div>
        </div>
      </div>
	   	
	   	
	   	<%	
	   	}
	   	connection.close();
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}










%>
      
      
     
    </div>
  </div>
</section>

	
	

</body>
</html>