<%@ page import="com.entities.Note" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="com.helper.factoryProvider" %>
<%@ page import="org.hibernate.Session" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes - Notefy</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
<link href="css/Style.css" rel="stylesheet">

</head>
<body>

<div class="container-fluid p-0">
    <%@ include file="navbar.jsp" %>

    <div class="container mt-4">
        <h1 class="text-center mb-4">All Notes</h1>
        <div class="row g-3">
            <%
                Session ses = null;
                try {
                    ses = factoryProvider.getFactory().openSession();
                    Query<Note> q = ses.createQuery("from Note", Note.class);
                    List<Note> list = q.list();

                    if (list.isEmpty()) {
            %>
                        <div class="col-12">
                            <div class="alert alert-info text-center">No notes available.</div>
                        </div>
            <%
                    } else {
                        for (Note note : list) {
            %>
                            <div class="col-md-4">
                                <div class="card shadow-sm h-100 card-primary">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= note.getTitle() %></h5>
                                        <p class="card-text"><%= note.getContent() %></p>
                                        <div class="d-flex gap-2">
                                            <!-- Update Button -->
                                            <a href="edit_note.jsp?noteId=<%= note.getId() %>" class="btn btn-warning btn-sm">Update</a>
                                            <!-- Delete Button -->
                                            <a href="DeleteNoteServlet?noteId=<%= note.getId() %>" 
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('Are you sure you want to delete this note?');">
                                               Delete
                                            </a>
                                        </div>
                                    </div>
                                    <div class="card-footer text-muted small">
                                        Created on: <%= note.getAddedDate() %>
                                    </div>
                                </div>
                            </div>
            <%
                        }
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error fetching notes: " + e.getMessage() + "</div>");
                } finally {
                    if (ses != null) ses.close();
                }
            %>
        </div>
    </div>
</div>

</body>
</html>
