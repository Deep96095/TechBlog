/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.postdao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.entities.posts;
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

/**
 *
 * @author OGGY
 */
@MultipartConfig
public class addpost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String ptitle=request.getParameter("ptitle");
            String pcontent=request.getParameter("pcontent");
            String pcode=request.getParameter("pcode");
            int cid=Integer.parseInt(request.getParameter("cid"));
            Part pic=request.getPart("ppic");
            String ppic=pic.getSubmittedFileName();
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentuser");
            int userid=user.getId();
            posts ob=new posts(cid, ptitle, pcontent, pcode,ppic,userid);
            postdao dao=new postdao(ConnectionProvider.getConnection());
            if(dao.savepost(ob))
            {
                
                String path=request.getRealPath("/")+"pics"+File.separator+ppic;
                pichelper.savefile(pic.getInputStream(), path);
                out.println("done");
   
            }
            else
            {
                out.println("error");
            }
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
