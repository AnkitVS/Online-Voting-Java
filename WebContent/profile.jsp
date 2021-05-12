<%@ page
	import="java.io.IOException,java.io.PrintWriter,java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException"%>
<%@ page import="org.Voting.DBCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/profile.css">
    <script src="https://kit.fontawesome.com/588fa32905.js"></script>
    <title>Profile</title>
</head>

<body>
    <header>
        <div class="navbar-logo"><a href="land.html">Home</a></div>
        <nav>
            <ul>
                <li><a href="reg.html">Vote</a></li>
            </ul>
        </nav>
    </header>
	<main>
		<%
			try {
			Connection connection = DBCon.initializeDatabase();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from user where id=?");
			preparedStatement.setString(1, (String) session.getAttribute("id"));
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
		%>

		<div class="container">
			<div style="height: 150px; width: 100%;"></div>
			<form action="" method="get">
				<div class="form-ele">
					<label for="name">Name</label> <input type="text" class="inp-field"
						id="name" value=<%=rs.getString("name")%>>
				</div>
				<div class="form-ele">
					<label for="mnum">Mobile Number</label> <input type="tel"
						class="inp-field" id="mnum" value=<%=rs.getString("phone")%>>
				</div>
				<div class="form-ele">
					<label for="email">Email</label> <input type="email"
						class="inp-field" id="email" value=<%=rs.getString("email")%>>
				</div>
				<div class="form-ele">
					<label for="dob">Date of Birth</label> <input type="text"
						class="inp-field" id="dob" value=<%=rs.getString("dob")%>>
				</div>
				<button type="button">Save</button>
			</form>
		</div>
		<%
			}
		} catch (ClassNotFoundException | SQLException e) {
		out.println(e.getMessage());
		}
		%>
		<div id="menu-bar">
        <div class="menu-btn">
            <div class="menu-btn__burger">
            </div>
            <div class="option">
                <ul id="nav">
                    <li><a href="profile.html"><i class="fas fa-user-alt"></i></a></li>
                    <li><a class=""><i class="fas fa-sign-out-alt"></i></a></li>
                    <li><a class="back"><i class="fas fa-long-arrow-alt-left"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
	</main>
	<footer>
        <div class="container">
            <div class="copy">
                <p>Copyright &copy; Ankit Ved 2020</p>
                <span>
                    <ul>
                        <li><a href="https://github.com/AnkitVS"><i class="fab fa-github-alt"></i></a></li>
                        <li><a href="https://www.linkedin.com/in/ankit-ved-ashm/"><i class="fab fa-linkedin-in"></i></a>
                        </li>
                    </ul>
                </span>
            </div>
        </div>
    </footer>
    <script>
    const menuBtn = document.querySelector('.menu-btn');
    let menuOpen = false;
    menuBtn.addEventListener('click', () => {
        if (!menuOpen) {
            menuBtn.classList.add('open');
            menuBtn.parentElement.classList.add('open');
            menuOpen = true;
        } else {
            menuBtn.classList.remove('open');
            menuBtn.parentElement.classList.remove('open');
            menuOpen = false;
        }
    });
    const back = document.querySelector('.back');
    back.addEventListener('click', () => {
        window.history.back();
    });
    const logout = document.querySelector('.back');
    logout.addEventListener('click', () => {
    	 var xhttp = new XMLHttpRequest(); 
    	 if (window.XMLHttpRequest) {
    	    // code for modern browsers
    	    xhttp = new XMLHttpRequest();
    	 } else {
    	    // code for old IE browsers
    	    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    	} 
    	 xhttp.open("GET", "Logout.java", true);
    	 xhttp.send(); 
    });
</script>
</body>
</html>