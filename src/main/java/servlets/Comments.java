package servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.util.LinkedList;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import lib.CassandraHosts;
import lib.Convertors;
import models.PicModel;
import stores.*;

/**
 * Servlet for Image Notes/Comments
 * @author Luke
 */

@WebServlet(name = "Comments", urlPatterns = {"/Comments/*"}) @MultipartConfig
public class Comments extends HttpServlet {
    
    private Cluster cluster;
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

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
        String args[] = Convertors.SplitRequestPath(request);
        request.setAttribute("picID", args[2]);
        
        PicModel pm = new PicModel();
        pm.setCluster(cluster);
        
        java.util.UUID picID = java.util.UUID.fromString(args[2]);
        LinkedList<Comment> comments = pm.getPicComments(picID);
        
        request.setAttribute("Comments", comments);
        
        RequestDispatcher rd = request.getRequestDispatcher("/Comments.jsp");
        rd.forward(request, response);
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
        HttpSession session = request.getSession();
        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
        
        if (lg == null || !lg.getloggedin()){
            response.sendRedirect("/myDental");
        } else {
            String comment = request.getParameter("comment");
            String picIDString = request.getParameter("picID");

            UUID picID = UUID.fromString(picIDString);

            if (comment.compareTo("") != 0){
                String username = lg.getUsername();
                PicModel pm = new PicModel();
                pm.setCluster(cluster);
                pm.insertComment(username, picID, comment);

                response.sendRedirect("/myDental/Comments/" + picID);
            }
        }
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

