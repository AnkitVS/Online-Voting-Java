<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/addash-style.css" type="text/css" rel="stylesheet"></link>
<script src="https://kit.fontawesome.com/588fa32905.js"></script>
<title>Administrator Dashboard</title>
</head>
<body>
<%
session=request.getSession(false);  
if(session==null){
	RequestDispatcher rd = request.getRequestDispatcher("/login.html");
}
%>
	<header>
		<div class="navbar-logo">
			<a href="land.html">Home</a>
		</div>
		<nav>
			<ul>
				<li><a href="reg.html">Vote</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<div class="container">
			<button class="pulse" type="submit"
				onclick="location.href='creElect.html'">Create Election</button>
			<button class="pulse" type="submit"
				onclick="location.href='elec.jsp'">Running Election</button>
		</div>
		<div id="menu-bar">
        <div class="menu-btn">
            <div class="menu-btn__burger">
            </div>
            <div class="option">
                <ul id="nav">
                    <li><a href="profile.jsp"><i class="fas fa-user-alt"></i></a></li>
                    <li><a href=""><i class="fas fa-sign-out-alt"></i></a></li>
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
						<li><a href="https://github.com/AnkitVS"><i
								class="fab fa-github-alt"></i></a></li>
						<li><a href="https://www.linkedin.com/in/ankit-ved-ashm/"><i
								class="fab fa-linkedin-in"></i></a></li>
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
    </script>
</body>
</html>