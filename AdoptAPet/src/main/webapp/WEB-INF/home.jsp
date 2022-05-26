<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
/* Make the image fully responsive */
</style>
<title>Adopt A Pet</title>
<jsp:include page="bootstrapAndCSSHeader.jsp" />
</head>
<body class="homeBackgroundImage">

	<div class="container">

		<%@ include file="nav.jsp"%>
		<div class="body">
			<h1>Adopt A Pet</h1>
			<footer class="footer">
				<div class="container">
					<span class="text-muted">Created by Luka, Noah, Devan, Brian</span>
				</div>
			</footer>
			</div>
			<!-- <header class="border border-2 rounded-2">
			<h1>Adopt A Pet</h1>
		</header> -->
			<br> <br> <br> <br> <br>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-sm"></div>
				<div class="col-sm">
					<div id="demo" class="carousel slide" data-ride="carousel">

						<!-- Indicators -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
							<li data-target="#demo" data-slide-to="3"></li>
							<li data-target="#demo" data-slide-to="4"></li>
						</ul>

						<!-- The slideshow -->
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img
									src="https://nationaltoday.com/wp-content/uploads/2020/02/national-golden-retriever-day.jpg"
									alt="golden retriever" width="500" height="500">
							</div>
							<div class="carousel-item">
								<img
									src="https://townsquare.media/site/696/files/2021/10/attachment-Maine-Coon-Cat-Twix-and-Twizzle-bros-rescued-from-Brooklyn-in-Biddeford.jpg?w=1200&h=0&zc=1&s=0&a=t&q=89"
									alt="Maine Coone Cat"width="500" height="500">
							</div>
							<div class="carousel-item">
								<img
									src="https://exoticbirdscorners.com/wp-content/uploads/2020/03/WhatsApp-Image-2019-11-11-at-12.03.09-PM1.jpeg"
									alt="Birb" width="500" height="500">
							</div>
							<div class="carousel-item">
								<img
									src="https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/cute-hamster-photo-nicole-ellissa.jpg"
									alt="small hamster" width="500" height="500">
							</div>
							<div class="carousel-item">
								<img
									src="../images/KamAndKeefer.png"
									alt="" width="500" height="500">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
				<div class="col-sm"></div>
			</div>
		</div>
</body>
</html>

</body>
</html>