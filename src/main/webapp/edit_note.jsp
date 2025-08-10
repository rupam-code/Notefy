<%@page import="com.entities.Note"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note - Notefy</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
<link href="css/Style.css" rel="stylesheet">

<style>
    body {
        background-color: #f8f9fa;
    }
    .edit-card {
        max-width: 700px;
        margin: auto;
        margin-top: 40px;
        box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        border-radius: 10px;
    }
</style>
</head>
<body>
<div class="container-fluid p-0">
    <%@ include file="navbar.jsp" %>

    <%
        int noteId = Integer.parseInt(request.getParameter("noteId"));
        Session ses = factoryProvider.getFactory().openSession();
        Note note = ses.get(Note.class, noteId);
        ses.close();
    %>

    <div class="card edit-card">
        <div class="card-header bg-primary text-white text-center">
            <h3>Edit Note</h3>
        </div>
        <div class="card-body">
            <form action="updateServlet" method="post">
                <!-- Hidden Note ID -->
                <input type="hidden" name="noteId" value="<%= note.getId() %>">

                <!-- Title -->
                <div class="mb-3">
                    <label for="title" class="form-label fw-bold">Note Title</label>
                    <input type="text" class="form-control" id="title" name="title" 
                           value="<%= note.getTitle() %>" placeholder="Enter the title" required>
                </div>

                <!-- Content -->
                <div class="mb-3">
                    <label for="content" class="form-label fw-bold">Note Content</label>
                    <textarea class="form-control" id="content" name="content" placeholder="Write your note here..." rows="6" required><%= note.getContent() %></textarea>
                </div>

                <!-- Buttons -->
                <div class="d-flex justify-content-between">
                    <a href="show_notes.jsp" class="btn btn-secondary">⬅ Back</a>
                    <button type="submit" class="btn btn-success">💾 Update Note</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
