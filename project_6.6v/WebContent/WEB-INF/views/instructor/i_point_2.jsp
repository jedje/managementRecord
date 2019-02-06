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
					<li class="active"><a href="${pageContext.request.contextPath}/i/schedule?instructor_id=${sessionScope.login.instructor_id}">
							<i class="fa fa-calendar"></i>
							강의 스케쥴 조회
					</a></li>
					<li><a href="${pageContext.request.contextPath}/i/point?instructor_id=${sessionScope.login.instructor_id}"> <i
							class="nc-icon nc-pin-3"></i>
							배점 관리
					</a></li>
					<li><a href="${pageContext.request.contextPath}/i/grade?instructor_id=${sessionScope.login.instructor_id}">
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
							href="${pageContext.request.contextPath}/i/point">배점
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
										<tr>
											<td>${info.os_id}</td>
											<td>${info.subject_name}</td>
											<td>${info.os_start_date}~<br>${info.os_end_date}</td>
											<td>
											<a href="#" rel="${info.isbn}" data-toggle="popover" title="${info.book_name}"
											data-content="">
											<span>${info.book_name}</span></a>
											</td>
											<td>${info.room_name}</td>
											<td>${info.curriculum_name}</td>
											<td>${info.oc_start_date}~<br>${info.oc_end_date}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="card">

							<div class="card-header text-right">
								<div class="pull-left">
									<h4 class="card-title">배점 정보</h4>
								</div>
								<button type="button" class="btn btn-default btn-icon"
                                            data-toggle="modal" data-target="#addPoint" title="배점 입력">
                                           <i class="fa fa-plus"></i></button>
							</div>

							<div class="card-body">

								<table class="table text-center">
									<thead class=" text-primary">
										<tr>
											<th>시험번호</th>
											<th hidden="hidden">개설과목번호</th>
											<th hidden="hidden">과목명</th>
											<th>출결배점</th>
											<th>필기배점</th>
											<th>실기배점</th>
											<th>시험일자</th>
											<th>시험문제</th>
											<th>-</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="m" items="${point}">
										<tr>
											<td>${m.ex_id}</td>
											<td hidden="hidden">${m.os_id}</td>
											<td hidden="hidden">${m.subject_name}</td>
											<td>${m.absence_point}</td>
											<td>${m.writtenExam_point}</td>
											<td>${m.practical_point}</td>
											<td>${m.ex_date}</td>
											<td><a href="">${m.question}</a></td>
											<td>
												<button type="button" class="btn btn-default btn-icon btnDel" value="${m.ex_id}"
                                            data-toggle="modal" data-target="#delPoint">
                                           <i class="fa fa-trash-o"></i>
                                         </button>
											</td>
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


			<footer class="footer footer-black  footer-white "> </footer>
		</div>
	</div>

	<div id="addPoint" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">배점 정보 입력</h5>
				</div>
				<form action="${pageContext.request.contextPath}/i/point/add" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<input type="hidden" name="os_id" value="${info.os_id}">
						<input type="hidden" name="instructor_id" value="${sessionScope.login.instructor_id}">
						<div class="card card-plain">
							<div class="form-group">
								<label>출결배점(최소20점):</label> <input type="number"
									class="form-control absence_point" name="absence_point"
									placeholder="max 20" required>
							</div>
							<div class="form-group">
								<label>필기배점:</label> <input type="number"
									class="form-control writtenExam_point" name="writtenExam_point"
									placeholder="max 20" required>
							</div>
							<div class="form-group">
								<label>실기배점:</label> <input type="number"
									class="form-control practical_point" name="practical_point"
									placeholder="max 20" required>
							</div>
							<div class="form-group">
								<label>시험일자:</label> <input type="date"
									class="form-control ex_date" name="ex_date"
									placeholder="max 20">
							</div>
							<label>시험문제:</label> <input type="file" name="examFile"
								class="btn btn-default btn-block">
						</div>
						<hr>
						<div class="text-right">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">CANCEL</button>
							<button type="submit" class="btn btn-primary">OK</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



	<div id="delPoint" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">배점 정보 삭제</h5>
				</div>
				<form action="${pageContext.request.contextPath}/i/point/del" method="POST">
				<div class="modal-body">
 					<input type="hidden" class="ex_id" name="ex_id">
						<b id="info"> </b>
					<p>배점 정보를 삭제하시겠습니까?</p>
				</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
						<button type="submit" class="btn btn-primary">OK</button>
					</div>
				</form>
			</div>
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

	      	$(".btnDel").on("click", function(){
	      		var ex_id = $(this).parents("td").siblings("td").eq(0).text();
				var os_id = $(this).parents("td").siblings("td").eq(1).text();
				var subject_name = $(this).parents("td").siblings("td").eq(2).text();
	      		var ex_date = $(this).parents("td").siblings("td").eq(6).text();
				$("#delPoint .ex_id").val($(this).val());
	      		$("#delPoint #info").text(os_id+ " (" +  subject_name + ") "+ "의" +ex_id + " (" + ex_date + " )" );
	      	});


		});

	</script>
</body>

</html>