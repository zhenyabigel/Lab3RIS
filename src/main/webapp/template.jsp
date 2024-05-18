<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title><c:if test="${empty song}">Adding</c:if><c:if test="${not empty song}">Editing</c:if> song</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: lightgray;
        }
    </style>
</head>
<body>
<div class="text-center m-2">
    <a class="btn btn-dark" href="song">Index page</a>
</div>
<div class="container text-center">
    <form action="song" method="POST">
        <c:if test="${not empty song}">
            <input type="hidden" name="id" value="<c:out value="${song.id}"/>">
        </c:if>
        <div class="form-group">
            <label for="artist">Artist:</label>
            <input type="text" name="artist" id="artist" class="form-control-sm m-1" value="<c:if test="${not empty song}"><c:out value="${song.artist}"/></c:if>" required>
        </div>
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" class="form-control-sm m-1" value="<c:if test="${not empty song}"><c:out value="${song.title}"/></c:if>" required>
        </div>
        <div class="button-container m-3">
            <c:if test="${empty song}">
                <input type="hidden" name="action" value="add">
            </c:if>
            <c:if test="${not empty song}">
                <input type="hidden" name="action" value="edit">
            </c:if>
            <button type="submit" class="btn btn-success">Save</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>