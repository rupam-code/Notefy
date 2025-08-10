<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Notefy - For Your Daily Notes</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    
    <!-- Custom Styles -->
    <style>
      body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(120deg, #f8f9fa, #e3f2fd);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
      }
      .hero-section {
        padding: 80px 0;
        text-align: center;
      }
      .hero-title {
        font-size: 3rem;
        font-weight: bold;
        color: #00FFFF;
      }
      .hero-subtitle {
        font-size: 1.2rem;
        color: #555;
        margin-bottom: 30px;
      }
      .features {
        padding: 50px 0;
      }
      .feature-card {
        border: none;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        transition: transform 0.3s;
      }
      .feature-card:hover {
        transform: translateY(-5px);
      }
      footer {
        margin-top: auto;
		background: #86aeb8;
		background: linear-gradient(90deg,rgba(134, 174, 184, 1) 0%, rgba(87, 199, 133, 1) 50%, rgba(237, 221, 83, 1) 95%);        
		color: white;
        padding: 15px 0;
        text-align: center;
      }
      .my_btn{
      background: #2A7B9B;
		background: linear-gradient(90deg, rgba(42, 123, 155, 1) 0%, rgba(87, 199, 133, 1) 50%, rgba(237, 221, 83, 1) 100%);
      }
      
    </style>
  </head>
  <body>

    <%@ include file="navbar.jsp" %>

    <!-- Hero Section -->
    <section class="hero-section">
      <div class="container">
        <h1 class="hero-title">Welcome to Notefy</h1>
        <p class="hero-subtitle">Your simple, beautiful, and secure place for daily notes</p>
        <a href="Add_notes.jsp" class="btn my_btn btn-lg">Create Your First Note</a>
      </div>
    </section>

    <!-- Features Section -->
    <section class="features">
      <div class="container">
        <div class="row text-center">
          <div class="col-md-4 mb-4">
            <div class="card feature-card p-4">
              <h4> Easy to Use</h4>
              <p>Write and organize your thoughts with just a few clicks.</p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="card feature-card p-4">
              <h4> My SQL Storage</h4>
              <p>Access your notes anytime, anywhere with secure Sql backup.</p>
            </div>
          </div>
          <div class="col-md-4 mb-4">
            <div class="card feature-card p-4">
              <h4> Privacy First</h4>
              <p>Your notes are encrypted and safe from prying eyes.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Footer -->
    <footer>
      <p>2025 Notefy | Made with  by Rupam</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
