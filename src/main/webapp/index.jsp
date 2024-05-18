<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Song</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightgray;
        }
        table {
            width: 100%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="text-center m-2">
        <a class="btn btn-dark" href="song?action=add">Add new song</a>
    </div>
    <table class="table table-danger text-center">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Artist</th>
            <th scope="col">Title</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="song" items="${songs}">
            <tr>
                <td><c:out value="${song.id}" /></td>
                <td><c:out value="${song.artist}" /></td>
                <td><c:out value="${song.title}" /></td>
                <td>
                    <div class="btn-group" role="group" aria-label="Actions">
                        <a href="song?action=edit&amp;id=${song.id}" class="btn btn-warning">Edit</a>
                        <a href="song?action=delete&amp;id=${song.id}" class="btn btn-danger">Delete</a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Включение скриптов Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>