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
import javax.servlet.http.HttpSession;

@WebServlet("/editElect")
public class editElect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String eid=request.getParameter("eid");
		String result = "<h1>Voter Details</h1>" + "<table>" + "<tr>" + "<th>Name</th>" + "<th>Contact</th>"
				+ "<th>Email</th>" + "<th>Voter ID</th>" + "<th>Status</th>" + "</tr>";
		try {
			int i=0;
			Connection connection = DBCon.initializeDatabase();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"select u.name,u.phone,u.email,v.voterid,v.status from voter v, user u where v.voterid=u.id and v.electid=?");
			preparedStatement.setString(1, eid);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				i++;
				result += "<tr class='row"+i+"'>" + "<td>" + rs.getString("name") + "</td>" + "<td>" + rs.getString("phone") + "</td>"
						+ "<td>" + rs.getString("email") + "</td>" + "<td class='vid'>" + rs.getString("voterid") + "</td> <td class='sta'>";
				if (rs.getString("status").equalsIgnoreCase("VP"))
					result += "<button type='button' onclick='VerifyCandidate(event)'>Verify</button>";
				else
					result += "Verified";
				result += "</td></tr>";
			}
		
		result += "</table>" + "<h1>Candidate Details</h1>" + "<table>" + "<tr>" + "<th>Name</th>" + "<th>Contact</th>"
				+ "<th>Email</th>" + "<th>Candidate Id</th>" + "<th>Status</th>" + "</tr>";
		
			preparedStatement = connection.prepareStatement(
					"select u.name,u.phone,u.email,c.cid,c.status from candidate c, user u where c.cid=u.id and c.electid=?");
			preparedStatement.setString(1, eid);
			rs = preparedStatement.executeQuery();
			i=0;
			while (rs.next()) {
				i++;
				result += "<tr class='row"+i+"'>" + "<td>" + rs.getString("name") + "</td>" + "<td>" + rs.getString("phone") + "</td>"
						+ "<td>" + rs.getString("email") + "</td>" + "<td class='cid'>" + rs.getString("cid") + "</td>"
						+ "<td class='sta'>";
				if (rs.getString("status").equalsIgnoreCase("VP"))
					result += "<button type='button' onclick='VerifyCandidate(event)'>Verify</button>";
				else
					result += "Verified";
				result += "</td>" + "</tr></table>";
			}
			response.setContentType("text/html");
			out.write(result);
		} catch (ClassNotFoundException | SQLException e) {
			out.println(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
