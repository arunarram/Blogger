<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
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
    <a href="createblog.jsp"class="md:ml-auto flex flex-wrap items-center text-base justify-center ">
    <button class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0" >Create your Blog
      <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-4 h-4 ml-1" viewBox="0 0 24 24">
        <path d="M5 12h14M12 5l7 7-7 7"></path>
      </svg>
    </button>
    </a>
  </div>
</header>
<%
					ArrayList list = new ArrayList();
					ServletContext context = getServletContext();
					String dirName =context.getRealPath("");
					//System.out.println(dirName);
					String paramname=null;
					String file=null;
					String a=null,b=null,c=null,d=null,image=null;
					String ee[]=null;
					String checkBok=" ";
					int ff=0;
					String bin = "";
					String name=null;     
        			String rollno=null;
					String email=null;
					String title=null;
					String blog=null;
					
				
					FileInputStream fs=null;
					File file1 = null;	
					
					try {
					
						MultipartRequest multi = new MultipartRequest(request, dirName,	5 * 1024 * 1024); // 10MB
						Enumeration params = multi.getParameterNames();
						while (params.hasMoreElements()) 
						{
							paramname = (String) params.nextElement();
							if(paramname.equalsIgnoreCase("name"))
							{
								name=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("rollno"))
							{
								rollno=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("email"))
							{
								email=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("title"))
							{
								title=multi.getParameter(paramname);
							}
							if(paramname.equalsIgnoreCase("blog"))
							{
								blog=multi.getParameter(paramname);
								
							}
							
									
							if(paramname.equalsIgnoreCase("image"))
							{
								image=multi.getParameter(paramname);
							}
						}
						int f = 0;
						Enumeration files = multi.getFileNames();	
						while (files.hasMoreElements()) 
						{
							paramname = (String) files.nextElement();
							
							
							if(paramname != null)
							{
								f = 1;
								image = multi.getFilesystemName(paramname);
								String fPath = context.getRealPath(""+image);
								//System.out.println(fPath);
								file1 = new File(fPath);
								fs = new FileInputStream(file1);
								list.add(fs);
							
								String ss=fPath;
								FileInputStream fis = new FileInputStream(ss);
								StringBuffer sb1=new StringBuffer();
								int i = 0;
								while ((i = fis.read()) != -1) {
									if (i != -1) {
										//System.out.println(i);
										String hex = Integer.toHexString(i);
										// session.put("hex",hex);
										sb1.append(hex);
										// sb1.append(",");
									
										String binFragment = "";
										int iHex;
			 
										for(int i1= 0; i1 < hex.length(); i1++){
											iHex = Integer.parseInt(""+hex.charAt(i1),16);
											binFragment = Integer.toBinaryString(iHex);
			
											while(binFragment.length() < 4){
												binFragment = "0" + binFragment;
											}
											bin += binFragment;
											//System.out.print(bin);
										}
									}	
								}
							}		
						}
						FileInputStream fs1 = null;
						//name=dirName+"\\Gallery\\"+image;
						int lyke=0;
						//String as="0";
						//image = image.replace(".", "_b.");
			 			//String query1="select * from patient  where name='"+uname+"'"; 
						//Statement st1=connection.createStatement();
						//ResultSet rs1=st1.executeQuery(query1);
						
							
					
					  
					  PreparedStatement ps=connection.prepareStatement("insert into blogs(rollno,name,email,blogTitle,blog,image) values(?,?,?,?,?,?)");
						ps.setString(1,rollno);
						ps.setString(2,name);
						ps.setString(3,email);	
						ps.setString(4,title);
						ps.setString(5,blog);
						ps.setBinaryStream(6, (InputStream)fs, (int)(file1.length()));	
						
						if(f == 0)
							ps.setObject(6,null);
						else if(f == 13)
						{
							fs1 = (FileInputStream)list.get(0);
							ps.setBinaryStream(6,fs1,fs1.available());
						}
					   
						
						int x=ps.executeUpdate();
						if(x>0){
								out.println("Thanks for writing the blog. Soon the blog will be published");
										%> <br><%
								out.println("click on Blogger to check out the new blogs");
								
						}
						else{
							out.println("Try publishing the blog again !!");
							out.println("click on Blogger to check out the new blogs");
						}
						connection.close();
						} 
					catch (Exception e) 
					{
						out.println(e.getMessage());
						e.printStackTrace();
					}
					finally{
						connection.close();
					}
				%>


</body>
</html>