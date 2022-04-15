<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blogger</title>
<% 
        if(application.getAttribute("admin")!=null){
        	application.removeAttribute("admin");
        }
         %>
</head>
<body class="bg-gray-100">
<header class="text-gray-600 body-font bg-stone-800 px-10 sticky top-0" >
  <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0" href="index.jsp">
      
      <span class="ml-3 text-xl">Blogger</span>
    </a>
  </div>
</header>
	
	<div class="flex items-center justify-center mt-16  bg-gray-100">
    <div class="px-8 py-6 mt-2 text-left bg-white shadow-lg">
        <h3 class="text-2xl font-bold text-center">Login to Admin Account</h3>
        <form action="admin_auth.jsp" method="post">
            <div class="mt-4">
                <div>
                    <label class="block" for="username">Username<label>
                            <input type="text" placeholder="Username" name="username"
                                required class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                </div>
                <div class="mt-4">
                    <label class="block">Password<label>
                            <input type="password" placeholder="Password" name="password"
                                required class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600">
                </div>
                <div class="flex items-baseline justify-center">
                    <button class="px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900">Login</button>
                </div>
            </div>
        </form>
    </div>
</div>
	
</div>
</body>
</html>