<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blogger</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
	<header class="text-gray-600 body-font bg-stone-800 px-10 sticky top-0" >
  <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-white mb-4 md:mb-0" href="index.jsp">
      
      <span class="ml-3 text-xl">Blogger</span>
    </a>
  </div>
</header>

<section class="text-gray-600 body-font relative">
  <div class="container px-5 py-10 mx-auto">
    <div class="flex flex-col text-center w-full mb-12">
      <h1 class="sm:text-3xl text-2xl font-medium title-font mb-4 text-gray-900">Create the blog!!</h1>
      <p class="lg:w-2/3 mx-auto leading-relaxed text-base">Fill your details, write the blog</p>
    </div>
    
      <form action="uploadingBlog.jsp" method="post" enctype="multipart/form-data">
    <div class="lg:w-1/2 md:w-2/3 mx-auto">
      <div class="flex flex-wrap -m-2">
      
        <div class="p-2 w-full">
          <div class="relative">
            <label for="name" class="leading-7 text-sm text-gray-600">Name</label>
            <input required type="text" id="name" name="name" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
          </div>
        </div>
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="rollno" class="leading-7 text-sm text-gray-600">Roll No</label>
            <input required type="text" id="rollno" name="rollno" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
          </div>
        </div>
        <div class="p-2 w-1/2">
          <div class="relative">
            <label for="email" class="leading-7 text-sm text-gray-600">Email</label>
            <input required type="email" id="email" name="email" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
          </div>
        </div>
        
        <div class="p-2 w-full">
          <div class="relative">
            <label for="title" class="leading-7 text-sm text-gray-600">Title for your Blog</label>
            <input required type="text" id="title" name="title" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out">
          </div>
        </div>
        
        <div class="p-2 w-full">
          <div class="relative">
            <label for="blog" class="leading-7 text-sm text-gray-600">Blog</label>
            <textarea required id="blog" name="blog" class="w-full bg-gray-100 bg-opacity-50 rounded border border-gray-300 focus:border-indigo-500 focus:bg-white focus:ring-2 focus:ring-indigo-200 h-96 text-base outline-none text-gray-700 py-1 px-3 resize-y leading-6 transition-colors duration-200 ease-in-out"></textarea>
          </div>
        </div>
        
        <div class="p-2 w-full">
          <div class="relative">
           
					    <label for="image" class="leading-7 text-sm text-gray-600">Upload Image for your Blog</label>
					    <input required class="form-control
					    block
					    w-full
					    px-3
					    py-1.5
					    text-base
					    font-normal
					    text-gray-700
					    bg-white bg-clip-padding
					    border border-solid border-gray-300
					    rounded
					    transition
					    ease-in-out
					    m-0
					    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" type="file" name="image" accept="image/*" id="formFile">
					
          </div>
        </div>
       
        <div class="p-2 w-full">
          <input  type= "submit" name="submit" value="Publish" class="flex mx-auto text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg">
        </div>
       
       
       
       
      </div>
    </div>
    </form>
  </div>
</section>



</body>
</html>