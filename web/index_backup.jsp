<%@page import="UserTweetsPkg.UserTweetsCls"%>
<%@ page import="UserTweetsPkg.GetTwitterInfo" %>
<%@ page import="twitter4j.*" %>
<%@ page import="twitter4j.conf.ConfigurationBuilder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%--
  Created by IntelliJ IDEA.
  User: agashe
  Date: 11/19/18
  Time: 2:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
	<title>Cold Start Problem</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

  </head>
  <body>

  <%--The Navigation bar / The Menu Bar--%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<a class="navbar-brand" href="#">Neflix</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
  	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarText">
  	<ul class="navbar-nav mr-auto">
    	<li class="nav-item active">
      	<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
    	</li>
    	<li class="nav-item">
      	<a class="nav-link" href="#">Features</a>
    	</li>
    	<li class="nav-item">
      	<a class="nav-link" href="#">Pricing</a>
    	</li>
  	</ul>
  	<span class="navbar-text">
  	Navbar text with an inline element
	</span>
	</div>
  </nav>

  <%--The Slide Bar--%>
  <div class="container-fluid">
  	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height: 400px">
      	<ol class="carousel-indicators">
          	<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          	<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          	<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      	</ol>
      	<div class="carousel-inner">
          	<div class="carousel-item active">
              	<img class="d-block w-100" src="Shot1.png" height="400px" alt="First slide">
          	</div>
          	<div class="carousel-item">
              	<img class="d-block w-100" src=".../800x400?auto=yes&bg=666&fg=444&text=Second slide" height="400px" alt="Second slide">
          	</div>
          	<div class="carousel-item">
              	<img class="d-block w-100" src=".../800x400?auto=yes&bg=555&fg=333&text=Third slide" height="400px" alt="Third slide">
          	</div>
      	</div>
      	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
          	<span class="sr-only">Previous</span>
      	</a>
      	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          	<span class="carousel-control-next-icon" aria-hidden="true"></span>
          	<span class="sr-only">Next</span>
      	</a>
  	</div>
  </div>

  <%--Card for twitter--%>
  <div class="card">
  	<h5 class="card-header">Tweets</h5>
  <%

    try
    {
            UserTweetsCls[] userTweetCls = GetTwitterInfo.getUserTweets();

            for (int i=0 ; i< userTweetCls.length ; i++){
                if(userTweetCls[i].getUserName()!=null)
                {

  %>
  	
        <div class="card-body">
      	<h5 class="card-title"><%= userTweetCls[i].getUserName() %></h5>
        <% for(String twt : userTweetCls[i].getUserTweets()){%>
            <p class="card-text"><%= twt %></p>
  	<%} %>
        </div>

<%
    }
  	}
    }catch(Exception te){
            out.print(te);
    }
%>
  </div>

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>




