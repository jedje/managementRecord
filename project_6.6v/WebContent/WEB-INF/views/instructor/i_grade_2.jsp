<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/resources/img/test1.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/resources/img/test1.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>성적처리시스템</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/paper-dashboard.css?v=2.0.0"
	rel="stylesheet" />

</head>

<body>
	<div class="wrapper ">
		<div class="sidebar" data-color="white" data-active-color="danger">

			<div class="logo text-center">
            	<a href="${pageContext.request.contextPath}/i/index" class="simple-text logo-normal">
               		<img src="${pageContext.request.contextPath}/resources/img/sist_logo.png">
           		</a>
            </div>
            <div class="logo">
				<div class="logo-image-small">
					<a class="simple-text logo-mini">
					<img style="border-radius: 100%;" src="${pageContext.request.contextPath}/resources/img/avatar.png">
					</a>
				</div>
				<a class="simple-text logo-normal"> 강사 [${sessionScope.login.instructor_name}] </a>
			</div>
            


			<div class="sidebar-wrapper">
				<ul class="nav">
					<li><a href="${pageContext.request.contextPath}/i/profile?instructor_id=${sessionScope.login.instructor_id}"><i class="fa fa-gear"></i>
							개인 정보 관리
					</a></li>
					<li><a href="${pageContext.request.contextPath}/i/schedule?instructor_id=${sessionScope.login.instructor_id}">
							<i class="fa fa-calendar"></i>
							강의 스케쥴 조회
					</a></li>
					<li><a href="${pageContext.request.contextPath}/i/point?instructor_id=${sessionScope.login.instructor_id}"> <i
							class="nc-icon nc-pin-3"></i>
							배점 관리
					</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/i/grade?instructor_id=${sessionScope.login.instructor_id}">
						<i class="fa fa-list-ol"></i>
							성적 관리
					</a></li>
				</ul>
			</div>
		</div>


		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/i/index">Home
							></a> <a class="navbar-brand"
							href="${pageContext.request.contextPath}/i/grade">성적
							관리</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-controls="navigation-index"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						<ul class="navbar-nav">
							<li class="nav-item btn-rotate dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="fa fa-unlock-alt"></i> <span
									class="d-lg-none d-md-block"></span>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/logout">로그아웃</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-plain">
							<div class="card-header">
								<h4 class="card-title">강의 과목 정보</h4>
							</div>
							<div class="card-body">
								<table class="table text-center">
									<thead class=" text-primary">
										<tr>
											<th>개설<br>과목 번호</th>
											<th>과목명</th>
											<th>과목기간</th>
											<th>교재명</th>
											<th>강의실</th>
											<th>과정명</th>
											<th>과정기간</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="m" items="${info}">
										<tr>
											<td>${m.os_id}</td>
											<td>${m.subject_name}</td>
											<td>${m.os_start_date}~<br>${m.os_end_date}</td>
											<td>
											<a href="#" rel="${m.isbn}" data-toggle="popover" title="${m.book_name}"
											data-content="">
											<span>${m.book_name}</span></a>
											</td>
											<td>${m.room_name}</td>
											<td>${m.curriculum_name}</td>
											<td>${m.oc_start_date}~<br>${m.oc_end_date}</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">배점 정보</h4>
							</div>
							<div class="card-body">
								<table class="table text-center">
									<thead class=" text-primary">
										<tr>
											<th>시험번호</th>
											<th>출결배점</th>
											<th>필기배점</th>
											<th>실기배점</th>
											<th>시험일자</th>
											<th>시험문제</th>
											<th>자세히</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="m" items="${point}">
										<tr>
											<td>${m.ex_id}</td>
											<td>${m.absence_point}</td>
											<td>${m.writtenExam_point}</td>
											<td>${m.practical_point}</td>
											<td>${m.ex_date}</td>
											<td><a href="">${m.question}</a></td>
											<td><a
												href="${pageContext.request.contextPath}/i/grade/info2?instructor_id=${sessionScope.login.instructor_id}&os_id=${os_id}&ex_id=${m.ex_id}">
													<button type="button" class="btn btn-default btn-icon" title="성적 정보 조회">
                                          						<i class="fa fa-search-plus"></i>
                                          						</button>
											</a></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<hr>
								<form class="form-inline">
									<div class="form-group mr-auto"></div>
									<div>
										<button type="button" class="btn btn-neutral btn-lg"
											disabled="disabled">총 ${count}건</button>
									</div>
									<div class="btn-group btn-sm">
										<button type="button" class="btn btn-round btn-outline-primary" id="preious">
											<i class="nc-icon nc-minimal-left"></i>
										</button>
										<button type="button" class="btn btn-round btn-primary" value="${pageNum}" id="pageNum_">
											<span>${pageNum}</span></button>
										<button type="button" class="btn btn-round btn-outline-primary" id="next">
											<i class="nc-icon nc-minimal-right"></i>
										</button>
									</div>
								</form>

							</div>
						</div>
					</div>
				</div>

			</div>

			<footer class="footer footer-black  footer-white ">
			</footer>
		</div>
	</div>





	<!--   Core JS Files   -->
	<script
		src="${pageContext.request.contextPath}/resources/js/core/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/core/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script
		src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${pageContext.request.contextPath}/resources/js/paper-dashboard.min.js?v=2.0.0"
		type="text/javascript"></script>
	<script>
		$(document).ready(function() {
	      	if('${pageNum}' == 1){
				$("#preious").attr("disabled", "disabled");
			};
			
			if('${pageNum}' == '${lastPage}'){
				$("#next").attr("disabled", "disabled");
			};
			$("#next").on("click", function(){
				var pageNum = parseInt($("#pageNum_").val())+1;
				window.location.assign("${pageContext.request.contextPath}/a/student?key="+'${key}'+"&value="+'${value}'+"&pageNum_=" + pageNum);
			});
			
			$("#preious").on("click", function(){
				var pageNum = parseInt($("#pageNum_").val())-1;
				window.location.assign("${pageContext.request.contextPath}/a/student?key="+'${key}'+"&value="+'${value}'+"&pageNum_=" + pageNum);
			});
			
			$("#key option[value='${key}']").attr("selected", "selected");
			$("#value").val('${value}');
	    	$("a[rel]").on("mouseover", function(){
	    		var isbn = $(this).attr("rel");
	    		var s="a[rel="+isbn+"]";
	    		$.ajax({
	    			url: "${pageContext.request.contextPath}/a/book/info"
	    			,data: {isbn:isbn}
	    			,success: function(data_) {
	    				var array = data_.item;
	    				for (var i = 0; i < array.length; ++i) {
	    	                var item = array[i];
	    	                var title = item.title;
	    	                var publisher = item.publisher;
	    	                var author = item.author;
	    	                var priceStandard = item.priceStandard;
	    	                var coverLargeUrl = item.coverLargeUrl;
	    	            }
	    				var dataContent = "<img src='" + coverLargeUrl + "'><div><ul><li>저자 : " + author + "</li><li>가격 : " + priceStandard + "원 </li><li>출판사 : " + publisher + "</li></ul></div>";
	    				$(s).attr("data-content", dataContent);
	    		}});
	    	});

	    	
	    	$('[data-toggle="popover"]').popover({
	    		trigger : "focus",
				placement : "bottom",
				html : true
			});
		});
		
	</script>
</body>

</html>