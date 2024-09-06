package org.Voting;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignUpStore")
public class SignUpStore extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SignUpStore() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			Connection connection = DBCon.initializeDatabase();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into user (name,phone,password,role,dob,email,id) value (?,?,?,?,?,?,?)");
            preparedStatement.setString(1, request.getParameter("fname"));
            preparedStatement.setString(2, request.getParameter("mnum"));
            preparedStatement.setString(3, request.getParameter("psw"));
            preparedStatement.setString(4, request.getParameter("role"));
            preparedStatement.setString(5, request.getParameter("dob"));
            preparedStatement.setString(6, request.getParameter("email"));
            Random random = new Random();
            String id= (request.getParameter("fname")).split(" ",1)[0]+random.nextInt(1000);
            preparedStatement.setString(7, id);
            preparedStatement.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("/reg.html");
            rd.include(request, response);
		} catch (ClassNotFoundException |SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
	}
	}
}

