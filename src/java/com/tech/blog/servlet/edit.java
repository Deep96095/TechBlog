package com.tech.blog.servlet;
import com.tech.blog.dao.userdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.pichelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@MultipartConfig
public class edit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet edit</title>");            
            out.println("</head>");
            out.println("<body>");
            String email=request.getParameter("user_email");
            String pass=request.getParameter("user_password");
            Part part=request.getPart("user_profile");
            String imgname="";
            HttpSession s=request.getSession();
            User u=(User)s.getAttribute("currentuser");
            String old=u.getProfile();
            if(part.getSize()==0)
            {
                imgname=old;
            }
            else
            {
                imgname="\""+part.getSubmittedFileName()+"\"";
                
            }
            
            u.setEmail(email);
            u.setPassword(pass);
            u.setProfile(imgname);
            userdao ob=new userdao(ConnectionProvider.getConnection());
            if(ob.updateUser(u))
            {
                out.println("updated");
                String path=request.getRealPath("/")+"pics"+File.separator+u.getProfile().replace("\"", "");
                String oldpath=request.getRealPath("/")+"pics"+File.separator+old.replace("\"", "");
                if(old.equals("\"default.png\""))
                {  
                    //////
                }
                else
                {
                    pichelper.deletepic(oldpath);
                }
                if(pichelper.savefile(part.getInputStream(), path))
                {
                    out.println("pic saved");
                    Message msg1=new Message("updated...","success","alert-success");
                    s.setAttribute("msg1", msg1);

                }
                else
                {
                    out.println("error");
                    Message msg1=new Message("Something went wronge...","error","alert-danger");
                    s.setAttribute("msg1", msg1);

                }
                
            }
            else
            {
                out.println("not updated");
                Message msg1=new Message("not updated!!","error","alert-danger");
                s.setAttribute("msg1", msg1);
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
