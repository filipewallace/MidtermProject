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
									alt="golden retriever" width="500">
							</div>
							<div class="carousel-item">
								<img
									src="https://townsquare.media/site/696/files/2021/10/attachment-Maine-Coon-Cat-Twix-and-Twizzle-bros-rescued-from-Brooklyn-in-Biddeford.jpg?w=1200&h=0&zc=1&s=0&a=t&q=89"
									alt="Maine Coone Cat"width="500" >
							</div>
							<div class="carousel-item">
								<img
									src="https://exoticbirdscorners.com/wp-content/uploads/2020/03/WhatsApp-Image-2019-11-11-at-12.03.09-PM1.jpeg"
									alt="Birb" width="500" >
							</div>
							<div class="carousel-item">
								<img
									src="https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/cute-hamster-photo-nicole-ellissa.jpg"
									alt="small hamster" width="500" >
							</div>
							<div class="carousel-item">
								<img
									src="data:image/jpeg;base64,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"
									alt="" width="500">
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