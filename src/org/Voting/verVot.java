package org.Voting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/verVot")
public class verVot extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			Connection connection = DBCon.initializeDatabase();
			PreparedStatement preparedStatement = connection
					.prepareStatement("update voter set status='V' where voterid=?");
			preparedStatement.setString(1, (String) request.getParameter("vid"));
			preparedStatement.executeUpdate();

			preparedStatement = connection.prepareStatement("select status from voter where voterid=?");
			preparedStatement.setString(1, (String) request.getParameter("vid"));
			ResultSet rs = preparedStatement.executeQuery();
			if (rs.next()) {
				response.setContentType("text/html");
				out.write(rs.getString("status"));
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
		}

	}
}
