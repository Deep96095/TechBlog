<%@page import="com.tech.blog.dao.likedao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.posts"%>
<%@page import="com.tech.blog.dao.postdao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp"%>
<div class="row">
<%
   likedao l=new likedao(ConnectionProvider.getConnection());
   postdao ob=new postdao(ConnectionProvider.getConnection());
   int cid=Integer.parseInt(request.getParameter("cd"));
   ArrayList<posts> post=null;
   if(cid>0)
   {
        post=ob.getpostbycid(cid);
   }
   else
   {
        post=ob.getallpost();
   }
  if(post.size()!=0)
  {
   for(posts p:post)
   {
%>
<div class="col-md-6 mt-4">
    <div class="card">
        <div class="card-body">
            <img class="card-img-top" src="pics/<%= p.getPpic() %>" alt="Card image cap">
            <b><%= p.getPtitle() %></b>
            <p><%= (p.getPcontent()).substring(0,150) %></p>
        </div>
        <div class="card-footer primary-background">
            <a href="showblog.jsp?postid=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more..</a>
            <a href="showblog.jsp?postid=<%= p.getPid() %>" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span><%=l.likecount(p.getPid()) %></span></a>
        </div>
    </div>
</div>
<%
   }}
else
{
%>
<div class="container text-center mt-4" style="background: yellowgreen">

            <h3 class="display-3">NO POSTS AVAILABLE</h3>

</div>
<%
}
%>

</div>