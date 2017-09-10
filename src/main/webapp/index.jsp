<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<fmt:requestEncoding value="UTF-8" />
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>


    <div class="warp">
      <div class="container">
        <h3>Поиск человека в бд</h3>
        <form method="post" class="js-main-search-form">
          <div class="form-group">
            <h4>Поиск по фио</h4>

            <div class="row">
              <div class="col-md-4">
                <input class="form-control" type="text" name="first-name" value="<%= helper.Other.replaceNull(request.getParameter("first-name")) %>" placeholder="Имя">
              </div>
              <div class="col-md-4">
                <input class="form-control" type="text" name="last-name" value="<%= helper.Other.replaceNull(request.getParameter("last-name")) %>" placeholder="Фамилия">
              </div>
              <div class="col-md-4">
                <input class="form-control" type="text" name="middle-name" value="<%= helper.Other.replaceNull(request.getParameter("middle-name")) %>" placeholder="Отчество">
              </div>
            </div>
          </div>

          <div class="form-group">
            <h4>Поиск по городу</h4>
            <input class="form-control" type="text" name="city" value="<%= helper.Other.replaceNull(request.getParameter("city")) %>" placeholder="Город">
          </div>
          <div class="form-group">
            <button class="btn btn-light" type="submit">Поиск!</button>
          </div>


        </form>
      </div>
    </div>

		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
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
          return false;
        }

      })
    </script>
	</body>
</html>
