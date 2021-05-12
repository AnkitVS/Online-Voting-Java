package org.Voting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/createElect")
public class createElect extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			Connection connection = DBCon.initializeDatabase();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into election(name,electid) value (?,?)");
            preparedStatement.setString(1, request.getParameter("elname"));
            Random random = new Random();
            String id= (((String)request.getParameter("elname")).split(" ", 1))[0]+random.nextInt(1000);;
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("/admin-dash.jsp");
            rd.include(request, response);
		} catch (ClassNotFoundException |SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
	}
	}

}
