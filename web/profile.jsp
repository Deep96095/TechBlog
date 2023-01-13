<%-- 
    Document   : profile
    Created on : 07-Jan-2023, 4:29:05 pm
    Author     : OGGY
--%>

<%@page import="com.tech.blog.entities.catagory"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp" %>
<%
    User u=(User)session.getAttribute("currentuser");
    if(u==null)
    {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        
        
        
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-bell"></span>LearnCode With Deep <span class="sr-only">(current)</span></a>
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-square"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"> <span class="fa fa-address-book-o"></span>Contact</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#do-post-model"> <span class="fa fa-asterisk"></span>Do post</a>
      </li>
      
    </ul>
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
              <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle"></span><%=u.getName()%></a>
          </li>
          <li class="nav-item">
          <a class="nav-link" href="logout"> <span class="fa fa-power-off"></span>logout</a>
          </li>
      </ul>
  </div>
</nav>
          
                            <%
                                Message m=(Message)session.getAttribute("msg1");
                                if(m!=null)
                                {
                             %>
                                <div class="alert <%=m.getCssClass()%>" role="alert">
                                    <%=m.getContent()%>
                                  </div>
                             <%
                                 session.removeAttribute("msg");
                                 }
                             %>   
                             
                             
                             
                             
                             
                             <!-- main body -->      

                             <main>
                                 <div class="container">
                                     <div class="row mt-4">
                                         <!-- first col -->
                                         <div class="col-md-4">
                                              <div class="list-group">
                                                    <a href="#" onclick="getpost(0,this)" class="c-link list-group-item list-group-item-action active">
                                                      All post
                                                    </a>
                                                            <%
                                                                postdao obj=new postdao(ConnectionProvider.getConnection());
                                                                ArrayList<catagory> list=obj.getCategories();
                                                                for(catagory c:list)
                                                                {
                                                            %>
                                                            <a href="#" onclick="getpost(<%=c.getCid()%>,this)" class="c-link list-group-item list-group-item-action"><%=c.getName()%></a>
                                                            <%
                                                                }
                                                            %>
                                              </div>
                                         </div>
                                        <div class="col-md-8">
                                            <div class="container text-center" id="loader">
                                                <i class="fa fa-refresh fa-4x fa-spin"></i>
                                                <h3 class="mt-2">loading..</h3>
                                            </div>
                                            <div class="container-fluid"id="post-container" >
                                                
                                            </div>
                                        </div>
                                       </div>
                                     </div>
                             </main>


<!-- profile Modal -->

<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              
              <img src="pics/<%=u.getProfile().replace("\"","")%>" class="img-fluid" style="border-radius: 50%">
              <br>
              <h5 class="modal-title" id="exampleModalLabel"><%=u.getName()%></h5>
              
              <div id="profile-details">
              <table class="table">
                    
                    <tbody>
                      <tr>
                        <th scope="row">ID:</th>
                        <td><%=u.getId()%></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">EMAIL:</th>
                        <td><%=u.getEmail()%></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">GENDER:</th>
                        <td><%=u.getGender()%></td>
                        
                      </tr>
                       <tr>
                        <th scope="row">REG DATE:</th>
                        <td><%=u.getDatetime()%></td>
                        
                      </tr>
                    </tbody>
                  </table>
                  </div> 
                  
                  <div id="profile-edit" style="display: none;">
                      <h3 class="mt-2">Please Edit carefully</h3>    
                      <form action="edit" method="post" enctype="multipart/form-data">
                          <table class="table">
                              <tr>
                                  <th>ID:</th>
                                  <td><%=u.getId()%></td>
                              </tr>
                              <tr>
                                  <th>EMAIL:</th>
                                  <td><input type="email" name="user_email" value="<%=u.getEmail()%>" class="form-control"></td>
                              </tr>
                              <tr>
                                  <th>PASSWORD:</th>
                                  <td><input type="password" name="user_password" value="<%=u.getPassword()%>" class="form-control"></td>
                              </tr>
                              <tr>
                                  <th>PROFILE PICTURE:</th>
                                  <td><input type="file" name="user_profile" class="form-control"></td>
                              </tr>
                              
                          </table>
                              <div class="container">
                                  <button class="btn btn-outline-primary">Save</button>
                              </div>
                      </form>   
                            
                  </div>                           
          </div>
      </div>                  
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="edit-profile-button">Edit</button>
      </div>
    </div>
  </div>
</div>    
             
                              
                              
                              
                              
                              
                              
                              
                              <!-- add model -->
<div class="modal fade" id="do-post-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="addpost" method="post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>---select catagory---</option>
                      <%
                          for(catagory ci:list)
                          {
                      %>
                      <option value="<%=ci.getCid()%>"><%=ci.getName()%></option>
                      <%
                          }
                      %>
                  </select>
              </div>
              <div class="form-group">
                  <input name="ptitle" type="text" placeholder="Enter post Title" class="form-control"/>
              </div>
              <div class="form-group">
                  <textarea name="pcontent" class="form-control" placeholder="Enter your content" style="height:200px;"></textarea>
              </div>
              <div class="form-group">
                  <textarea name="pcode" class="form-control" placeholder="Enter your code" style="height:100px;"></textarea>
              </div>
              <div class="form-group">
                  <label>Select post Pic</label>
                  <br>
                  <input name="ppic" type="file" class="form-control"/>
              </div>
            <div class="container text-center">
                <button type="submit" class="btn btn-outline-primary">Post</button>
            </div>
          </form>
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
            $(document).ready(function(){
                let editstatus=false;
                
                $('#edit-profile-button').click(function(event){
                    if(editstatus===false)
                    {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editstatus=true;
                        $(this).text("Back");
                    }
                    else
                    {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editstatus=false;
                        $(this).text("Edit");
                    }
                });
            });
        </script>
        
        <script>
            $(document).ready(function(e){
                $('#add-post-form').on("submit",function(event){
                    event.preventDefault();
                    let form=new FormData(this);
                    console.log("submitted");
                    $.ajax({
                        url:"addpost",
                        type:"POST",
                        data:form,
                        success:function(data,textStatus,jqXHR)
                        {
                           if(data.trim()==='done')
                           {
                               swal("GOOD JOB! Saved successfully","success");
                           }
                           else
                           {
                               swal("Error!!","error");
                           }
                        },
                        error:function(jqXHR,textStatus,errorThrown)
                        {
                           
                            swal("Error!!","error");
                        },
                        processData:false,
                        contentType:false
                    });
                });
            });
        </script>
        <script>
            function getpost(catid,o)
            {
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass("active");
                
                $.ajax({
                        url:"loadpost.jsp",
                        data:{cd:catid},
                        success:function(data,textStatus,jqXHR)
                        {
                           console.log(data);
                           $("#loader").hide();
                           $("#post-container").show();
                           $("#post-container").html(data);
                           $(o).addClass("active");
                        }
                    });
            }
            $(document).ready(function(e)
            {
                let temp=$('.c-link')[0];
                getpost(0,temp);
               
            });
        </script>
    </body>
</html>
