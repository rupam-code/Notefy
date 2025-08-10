<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add Notes - Notefy</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
  
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
  
  <!-- Custom CSS -->
  <link href="css/Style.css" rel="stylesheet">
  <style>
  	.back-color{
  			background: #86aeb8;
		background: linear-gradient(90deg,rgba(134, 174, 184, 1) 0%, rgba(87, 199, 133, 1) 50%, rgba(237, 221, 83, 1) 95%);        
  	}
  </style>
</head>
<body>

  <div class="container-fluid p-0">
    <%@ include file="navbar.jsp" %>
  </div>

  <!-- Main Content Section -->
  <div class="container my-5">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card shadow-lg border-0">
          <div class="card-header back-color text-dark">
            <h3 class="text-center mb-0">📝 Add a New Note</h3>
          </div>
          <div class="card-body p-4">
            <!-- Add Note Form -->
            <form action="SaveNoteServlet" method="post">
              <div class="mb-3">
                <label for="tittle" class="form-label">Note Title</label>
                <input type="text" class="form-control" id="tittle" name="title" placeholder="Enter the title" required>
              </div>
              
              <div class="mb-3">
                <label for="content" class="form-label">Note Content</label>
                <textarea class="form-control" id="content" name="content" placeholder="Write your note here..." rows="6" required></textarea>
              </div>
              
              <div class="d-grid">
                <button type="submit" class="btn btn-primary btn-lg">➕ Add Note</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
