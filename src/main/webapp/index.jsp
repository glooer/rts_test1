<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.HashMap,models.Human" %>
<% request.setCharacterEncoding("utf-8"); %>

<%


String auth_hash = "";

for (Cookie cookie : request.getCookies()) {
	if (cookie.getName().equals("auth_hash")) {
		auth_hash = cookie.getValue();
	};
}

String current_user = helper.Auth.isAuth(auth_hash);

if (current_user.equals("")) {
	response.sendRedirect("/auth");
}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<header>

			<nav class="navbar navbar-light bg-light justify-content-between">
				<div class="container">
					<a href="/" class="navbar-brand"><%= current_user %></a>
					<ul class="navbar-nav">
						<li class="nav-item active">
							<% if (current_user.isEmpty()) {%>
								<a class="nav-link" href="/auth/">Вход</a>
							<% } else { %>
								<a class="nav-link" href="/auth/process?unlogin=true">Выход</a>
							<% } %>
						</li>
					</ul>
				</div>

			</nav>
		</header>
		<br>

    <div class="warp">
      <div class="container">
        <form method="post" class="js-main-search-form">
          <div class="form-group">
            <h4>Поиск по фио</h4>

            <div class="row">
              <div class="col-md-4">
                <input class="form-control" type="text" name="first_name" value="<%= helper.Other.replaceNull(request.getParameter("first_name")) %>" placeholder="Имя">
              </div>
              <div class="col-md-4">
                <input class="form-control" type="text" name="last_name" value="<%= helper.Other.replaceNull(request.getParameter("last_name")) %>" placeholder="Фамилия">
              </div>
              <div class="col-md-4">
                <input class="form-control" type="text" name="middle_name" value="<%= helper.Other.replaceNull(request.getParameter("middle_name")) %>" placeholder="Отчество">
              </div>
            </div>
          </div>

          <div class="form-group">
            <h4>Поиск по городу</h4>
            <input class="form-control" type="text" name="city" value="<%= helper.Other.replaceNull(request.getParameter("city")) %>" placeholder="Город">
          </div>

					<div class="form-group">
            <h4>Поиск по машине</h4>
						<div class="row">
							<div class="col-md-6">
								<input class="form-control" type="text" name="car" value="<%= helper.Other.replaceNull(request.getParameter("car")) %>" placeholder="Название машины">
							</div>
							<div class="col-md-6">
								<input class="form-control" type="text" name="car_gos" value="<%= helper.Other.replaceNull(request.getParameter("car_gos")) %>" placeholder="Номер машины">

							</div>
						</div>
          </div>
          <div class="form-group">
            <button class="btn btn-light" type="submit">Поиск!</button>
          </div>


        </form>
				<div class="js-result">

				</div>
				<%-- <table class="table">

				<%

				HashMap<String, Human> userList = web.app.search.SearchHuman.byHttpParams(request);
				out.print(web.app.search.SearchHuman.getHtml(userList));


				%>
				</table> --%>



      </div>
    </div>

		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      $('.js-main-search-form').on('submit', function() {
        var is_okay = false;
        var form_fields = $(this).serializeArray();

        Object.keys(form_fields).forEach(function(key) {
          if ($.trim(form_fields[key]['value'])) {
            is_okay = true;
          }
        })

        if (!is_okay) {
          alert('Необходимо заполнить хотя бы одно поле!')
        } else {
					$('.js-result').load("/hello", $(this).serializeArray())
				}

				return false;
      })
    </script>
	</body>
</html>
