<%-- 
    Document   : index
    Created on : 06-Jan-2023, 2:35:18 pm
    Author     : OGGY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <!-- banner -->
        <div class="container-fluid p-0 m-0">
            
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog,</h3>
                <p>Welcome to technical blog, world of Technology</p>
                <p>A programming language is a system of notation for writing computer programs.Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</p>
                <a href="register.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start it's free</a>
                <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
                </div>
            </div>
        </div>
        
        <!-- cards -->
        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4" >
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                             <p class="card-text">Java is a powerful general-purpose programming language. It is used to develop desktop and mobile applications, big data processing, embedded systems, and so on. According to Oracle, the company that owns Java, Java runs on 3 billion devices worldwide, which makes Java one of the most popular programming languages.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                         </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                             <p class="card-text">Python is a popular general-purpose programming language. It is used in machine learning, web development, desktop applications, and many other fields. Fortunately for beginners, Python has a simple, easy-to-use syntax. This makes Python a great language to learn for beginners.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                         </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card" >
                        
                        <div class="card-body">
                            <h5 class="card-title">C Programming</h5>
                             <p class="card-text">C is a powerful general-purpose programming language. It can be used to develop software like operating systems, databases, compilers, and so on. C programming is an excellent language to learn to program for beginners.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                         </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card" >
                        
                        <div class="card-body">
                            <h5 class="card-title">C++ Programming</h5>
                             <p class="card-text">C++ is a powerful general-purpose programming language. It can be used to develop operating systems, browsers, games, and so on. C++ supports different ways of programming like procedural, object-oriented, functional, and so on. This makes C++ powerful as well as flexible.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                         </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card" >
                        
                        <div class="card-body">
                            <h5 class="card-title">MYsql</h5>
                             <p class="card-text">MySQL is a relational database management system based on the Structured Query Language, which is the popular language for accessing and managing the records in the database. MySQL is open-source and free software under the GNU license. It is supported by Oracle Company.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                         </div>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="card" >
                        
                        <div class="card-body">
                            <h5 class="card-title">Data Structure</h5>
                             <p class="card-text">A data structure is a storage that is used to store and organize data. It is a way of arranging data on a computer so that it can be accessed and updated efficiently. A data structure is not only used for organizing the data. It is also used for processing, retrieving, and storing data.</p>
                            <a href="#" class="btn btn-primary primary-background text-white">Read more</a>
                         </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
        
        
        <!-- java script -->
        <script
        src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                
            });
        </script>
    
    </body>
</html>
