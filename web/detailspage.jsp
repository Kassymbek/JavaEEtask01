<%@ page import="model.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">
    <%@ include file="navbar.jsp"%>
    <br><br>
    <%
            Tasks task = (Tasks) request.getAttribute("taskdetails");
    %>
    <form action="/updatetask" method="post">
    <div class="mb-3">
        <label for="name" class="form-label">Наименование : </label>
        <input type="text" class="form-control" id="name"  placeholder=<%=task.getName()%>>
    </div>
    <div class="mb-3">
        <label for="description" class="form-label">Описание : </label>
        <textarea class="form-control" id="description" name="description" rows="3" placeholder=<%=task.getDescription()%>></textarea>
    </div>
    <div class="mb-3">
        <label for="deadline" class="form-label">Крайний срок :</label>
        <input type="date" class="form-control" id="deadline" name="deadline" placeholder="<%=task.getDeadlineDate()%>">
    </div>
    <div class="mb-3">
        <label for="status" class="form-label">Выполнено :</label>
        <select class="form-control" id="status" name="status">
            <option value="false" <%= !task.isStatus() ? "selected" : "" %>>Нет</option>
            <option value="true" <%= task.isStatus() ? "selected" : "" %>>Да</option>
        </select>
    </div>
<div class="modal-footer">
    <button type="submit" class="btn btn-primary">Сохранить</button>
    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Удалить</button>
</div>
    </form>
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Удалить</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/deletetask" method="post">
                    <div class="modal-body">
                        <p>Вы уверены?</p>
                        <input type="hidden" name="id" value="<%= task.getId() %>">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                        <button type="submit" class="btn btn-danger">Да</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
