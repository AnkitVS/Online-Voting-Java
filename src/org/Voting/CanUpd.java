package org.Voting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CanUpd")
public class CanUpd extends HttpServlet {
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
					.prepareStatement("insert into candidate(candid,electid) values(?,?)");
			preparedStatement.setString(1, (String)request.getParameter("cid"));
			preparedStatement.setString(2, (String)request.getParameter("eid"));
			preparedStatement.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage()+" "+ request.getAttribute("cid"));
		}

	}
}
