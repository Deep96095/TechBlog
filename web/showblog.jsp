<%-- 
    Document   : showblog
    Created on : 11-Jan-2023, 7:52:12 pm
    Author     : OGGY
--%>

<%@page import="com.tech.blog.dao.likedao"%>
<%@page import="com.tech.blog.dao.userdao"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<%
    User u=(User)session.getAttribute("currentuser");
    if(u==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<%
    likedao l=new likedao(ConnectionProvider.getConnection());
    int postid=Integer.parseInt(request.getParameter("postid"));
    postdao ob=new postdao(ConnectionProvider.getConnection());
    posts p=ob.getpostbypid(postid);
%>    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getPtitle()%></title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .post-title
            {
                font-weight: 100;
                font-size: 30px;
            }
            .post-content
            {
                font-weight: 100;
                font-size: 25px;
            }
            .post-date
            {
                font-style: italic;
                font-weight:bold; 
            }
            .post-name
            {
                font-style: italic;
                font-weight:bold; 
            }
        </style>
    </head>
    <body>
        <div class="primary-background" style="height: 1cm">
            <h3 class="text-white">TechBlog</h3>
        </div>
        <div class="container my-4">
            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background">
                            <h4 class="text-center text-white post-title"><%= p.getPtitle() %></h4>
                        </div>
                        <div class="card-body">
                            <div class="row" style="border-style: solid;border-width: 2px" >
                                <div class="col-md-8">
                                    <%
                                        userdao uid=new userdao(ConnectionProvider.getConnection());
                                        User o=uid.getUserByuserid(p.getUserid());
                                        %>
                                        <p class="post-name">POSTED BY. <%=o.getName()%></p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%=p.getDate().toLocaleString()%></p>
                                </div>
                            </div>
                            <p class="post-content"><%=p.getPcontent()%></p>
                            <br>
                            <br>
                            <div class="post-code">
                                <pre><%=p.getPcode()%></pre>
                            </div>
                        </div>
                        <div class="card-footer primary-background">
                            <a href="#!" class="btn btn-outline-light btn-sm" onclick="doliked(<%=p.getPid()%>,<%=u.getId()%>)"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=l.likecount(p.getPid()) %></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <script
        src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script> 
        <script>
            function doliked(pid,uid)
            {
                let d={uid:uid,pid:pid,operation:"like"};
                $.ajax({
                    url:"LikedServ",
                    type:"GET",
                    data:d,
                    success:function(data,textStatus,jqXHR)
                    {
                        if(data.trim()=='true')
                        {
                            let c=$(".like-counter").html();
                            c++;
                            $(".like-counter").html(c);
                        }
                        else
                        {
                            swal("already liked");
                        }
                    },
                    error:function(jqXHR,textStatus,errorThrown)
                    {
                        swal("Error!!");
                    }
                });
            };
        </script>
    </body>
</html>
