<%-- 
    Document   : register
    Created on : 06-Jan-2023, 5:31:28 pm
    Author     : OGGY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        <main>
        <div class="container p-5">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header text-center primary-background">
                        <span class="fa fa-3x fa-user-circle"></span>
                        <br>
                        Register here
                    </div>
                    <div class="card-body">
                        <form action="register" method="POST" id="reg-form">
                                    <div class="form-group">
                                        <label for="user_name">User Name</label>
                                        <input type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name" name="user_name">
                                        
                                     </div>
                                     <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="user_email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                     </div>
                            
                            
                                     <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="user_password">
                                     </div>
                                    <div class="form-group">
                                        <label for="user_gender">Gender</label>
                                        <br>
                                        <input type="radio" id="user_gender" name="user_gender" value="male">Male
                                        <input type="radio" id="user_gender" name="user_gender" value="female">Female
                                     </div>
                            
                                     <div class="form-check">
                                         <input type="checkbox" class="form-check-input" id="exampleCheck1" value="cheaked" name="cheak">
                                        <label class="form-check-label" for="exampleCheck1">Terms and condition</label>
                                     </div>
                                     <div class="container text-center" id="loader" style="display: none">
                                         <span class="fa fa-refresh fa-spin fa-4x"></span>
                                         <h4>Plese wait..</h4>
                                     </div>
                                       <br>
                                       <button type="submit" id="submit-btn" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                    <div class="card-footer primary-background">
                        
                    </div>
                </div>
            </div>
            
        </div>
        </main>
        
        <script
        src="https://code.jquery.com/jquery-3.6.3.min.js"
        integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded....");
                $('#reg-form').on("submit",function(event){
                    event.preventDefault();
                    let form=new FormData(this);
                    $('#submit-btn').hide();
                    $('#loader').show();
                    $.ajax({
                        url:"register",
                        type:"POST",
                        data:form,
                        success:function(data,textStatus,jqXHR)
                        {
                            console.log(data);
                            $('#submit-btn').show();
                            $('#loader').hide();
                            if(data.trim()==='done')
                            {
                             swal("You have successfully registered")
                                    .then((value) => {window.location="login.jsp";});
                            }
                            else
                            {
                                swal(data);
                            }
                        },
                        error:function(jqXHR,textStatus,errorThrown)
                        {
                           
                           $('#submit-btn').show();
                           $('#loader').hide();
                           swal("something went wrong try again!!");
                        },
                        processData:false,
                        contentType:false
                    });
                });
            });
        </script>
    </body>
</html>
