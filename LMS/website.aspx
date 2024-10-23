<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="website.aspx.cs" Inherits="LMS.website" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap");


.footer {
  position: relative;
  width: 100%;
  background: #3586ff;
  min-height: 100px;
  padding: 20px 50px;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.social-icon,
.menu {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 10px 0;
  flex-wrap: wrap;
}

.social-icon__item,
.menu__item {
  list-style: none;
}

.social-icon__link {
  font-size: 2rem;
  color: #fff;
  margin: 0 10px;
  display: inline-block;
  transition: 0.5s;
}
.social-icon__link:hover {
  transform: translateY(-10px);
}

.menu__link {
  font-size: 1.2rem;
  color: #fff;
  margin: 0 10px;
  display: inline-block;
  transition: 0.5s;
  text-decoration: none;
  opacity: 0.75;
  font-weight: 300;
}

.menu__link:hover {
  opacity: 1;
}

.footer p {
  color: #fff;
  margin: 15px 0 10px 0;
  font-size: 1rem;
  font-weight: 300;
}

.wave {
  position: absolute;
  top: -100px;
  left: 0;
  width: 100%;
  height: 100px;
  background: url("https://i.ibb.co/wQZVxxk/wave.png");
  background-size: 1000px 100px;
}

.wave#wave1 {
  z-index: 1000;
  opacity: 1;
  bottom: 0;
  animation: animateWaves 4s linear infinite;
}

.wave#wave2 {
  z-index: 999;
  opacity: 0.5;
  bottom: 10px;
  animation: animate 4s linear infinite !important;
}

.wave#wave3 {
  z-index: 1000;
  opacity: 0.2;
  bottom: 15px;
  animation: animateWaves 3s linear infinite;
}

.wave#wave4 {
  z-index: 999;
  opacity: 0.7;
  bottom: 20px;
  animation: animate 3s linear infinite;
}

@keyframes animateWaves {
  0% {
    background-position-x: 1000px;
  }
  100% {
    background-positon-x: 0px;
  }
}

@keyframes animate {
  0% {
    background-position-x: -1000px;
  }
  100% {
    background-positon-x: 0px;
  }
}
             * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f9;
        }

        /* Navbar Styles */
        .navbar {
            background-color: #e9fbff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 10px 12px rgba(0, 0, 0, 0.1);
            height: 14vh;
            position:fixed;
            width:100%;
            z-index:9999;
        }
        .header-logo
        {
            margin-left:15px;
        }
        
        .navbar .nav-left a
        {
            color: #2c3e50;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 22px;
            font-weight: 500;
            border-radius: 25px;
            transition: background-color 0.4s ease, color 0.4s ease;
        }
        .navbar .nav-right a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 18px;
            font-weight: 500;
            border-radius: 25px;
            transition: background-color 0.4s ease, color 0.4s ease;
        }
         .navbar .nav-right a.admin-btn:hover {
            background-color: #34495e;
            color: white;
        }
        .navbar .nav-left a:hover
        {
             background-color: darkslategray;
            color: white;
        }
        .navbar .nav-right a.admin-btn {
            background-color: #3498db;
            padding: 12px 25px;
            font-weight: 600;
            border-radius: 30px;
            transition: background-color 0.4s ease, box-shadow 0.3s ease;
        }

        .navbar .nav-right a.admin-btn:hover {
            background-color: #darkslategray;
            box-shadow: 0 2px 20px  #3498db ;
        }
       /* for align and set the links */
        .home-align
        {
            margin-right:25px;
        }
        .profile-align
        {
            margin-left:25px;
        }
        
         .header 
        {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 50px 30px;
            margin-bottom:60px;
            background-color: #e9fbff;
        }
        .main-container
        {
            margin-top:4%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 50px 30px;
            background-color: #e9fbff;
        }
        .header-content {
            max-width: 50%;
        }

        .header-content h1 {
            font-size: 48px;
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 20px;
        }

        .header-content p {
            font-size: 18px;
            color: #7f8c8d;
            line-height: 1.6;
        }

        .header-content .cta-btn {
            display: inline-block;
            background-color: #3498db;
            color: white;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: 500;
            border-radius: 30px;
            margin-top: 20px;
            text-decoration: none;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .header-content .cta-btn:hover {
            background-color: #2980b9;
            box-shadow: 0 8px 20px rgba(52, 152, 219, 0.6);
        }

        .header-image {
            max-width: 45%;
        }

        .header-image img {
            width: 100%;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.6s ease;            
        }
        .header-image img:hover {
            transform: scale(1.1);
            transition: transform 0.6s ease;
             box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        
        /* Responsive  */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
            }

            .header-content, .header-image {
                max-width: 100%;
            }

            .header-content h1 {
                font-size: 36px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <header>
        <nav class="navbar">
          <div class="header-logo">
          <%--logo --%>
            <img width="160px" height="80px" src="/images/LmsLogo.png" alt="Classy Header Image">            
        </div>
            <div class="nav-left">
                <a class="home-align" href="#">Home</a>
                <a class="bookissue-align"  href="/ViewBook.aspx">View Books</a>
                <a class="profile-align" href="/login.aspx">Login</a>
            </div>
            <div class="nav-right">
                <a class="admin-btn" href="AdminLogin.aspx">Admin</a>
            </div>
        </nav>
    </header>
    </div>
    </form>

     <section class="header">
    <div class="main-container">
        <div class="header-content">
            <h1>Welcome to Library Management System</h1>
            <p>We provide the best services to help you manage your library efficiently. Explore our features and manage your books with ease.</p>
            <a class="cta-btn" href="/ViewBook.aspx">Show Books</a>
        </div>
        <div class="header-image">
            <img src="/images/headerimg.jpeg" alt="Classy Header Image">
        </div>
    </div>
    </section>

    <footer class="footer">
    <div class="waves">
      <div class="wave" id="wave1"></div>
      <div class="wave" id="wave2"></div>
      <div class="wave" id="wave3"></div>
      <div class="wave" id="wave4"></div>
    </div>
    <ul class="social-icon">
      <li class="social-icon__item"><a class="social-icon__link" href="#">
          <ion-icon name="logo-facebook"></ion-icon>
        </a></li>
      <li class="social-icon__item"><a class="social-icon__link" href="#">
          <ion-icon name="logo-twitter"></ion-icon>
        </a></li>
      <li class="social-icon__item"><a class="social-icon__link" href="#">
          <ion-icon name="logo-linkedin"></ion-icon>
        </a></li>
      <li class="social-icon__item"><a class="social-icon__link" href="#">
          <ion-icon name="logo-instagram"></ion-icon>
        </a></li>
    </ul>
    <ul class="menu">

    </ul>
    <p>&copy;2024 mmd zhr | All Rights Reserved</p>
  </footer>
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>
</html>
