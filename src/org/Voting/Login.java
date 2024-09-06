package org.Voting;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
		}
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    		PrintWriter out = response.getWriter();
	    		String role = null;
	    		try {
	    			Connection connection = DBCon.initializeDatabase();
	                PreparedStatement preparedStatement = connection.prepareStatement("select * from user where id=? and password=?");
	                preparedStatement.setString(1, request.getParameter("username"));
	                preparedStatement.setString(2, request.getParameter("password"));
	                ResultSet rs =preparedStatement.executeQuery();
	                HttpSession session=null;
	                while(rs.next()) {
	                	role= rs.getString("role");
	                	session=request.getSession();
	                }
	                if(role.equalsIgnoreCase("Voter"))
	                {
	                    session.setAttribute("id",request.getParameter("username"));
	                	RequestDispatcher rd = request.getRequestDispatcher("/voter-dash.jsp");
	                	rd.forward(request, response);
	                }
	                else if(role.equalsIgnoreCase("Candid")) {
	                	session.setAttribute("id",request.getParameter("username"));
	                	RequestDispatcher rd = request.getRequestDispatcher("/candid-dash.jsp");
	                	rd.forward(request, response);
	                }
	                else if(role.equalsIgnoreCase("admin")){
	                	session.setAttribute("id",request.getParameter("username"));
	                	RequestDispatcher rd = request.getRequestDispatcher("/admin-dash.jsp");
	                	rd.forward(request, response);
	                }
	    		} catch (ClassNotFoundException |SQLException e) {
	    			// TODO Auto-generated catch block
	    			out.println(e.getMessage());
	    	}
	}
}