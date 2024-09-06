package org.Voting;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/canIns")
public class canIns extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String sta="";
		try {
			Connection connection = DBCon.initializeDatabase();
			PreparedStatement preparedStatement = connection
					.prepareStatement("update candidate set electionid=? where candidateid=?");
			preparedStatement.setString(1, (String)request.getParameter("cid"));
			preparedStatement.setString(2, (String)request.getParameter("eid"));
			preparedStatement.executeUpdate();
			preparedStatement = connection
					.prepareStatement("select status from candidate where candidateid=? and electionid=?");
			preparedStatement.setString(1, (String)request.getParameter("cid"));
			preparedStatement.setString(2, (String)request.getParameter("eid"));
			ResultSet rs =preparedStatement.executeQuery();
			while(rs.next()) {
            	sta= rs.getString("status");
			}
			response.setContentType("text/html");
			out.write(sta);
		}catch (ClassNotFoundException |SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

