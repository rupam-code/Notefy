package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;


@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//title , content fetch
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Note note = new Note(title,content,new Date());
			
//			System.out.print(note.getId() + ":" + note.getTitle());
			
//			Hibernate Save
		Session s=factoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		
		s.persist(note);
		tx.commit();
		s.close();
		response.setContentType("text/html");
		PrintWriter out =response.getWriter();
	

		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<meta name='viewport' content='width=device-width, initial-scale=1'>");
		out.println("<title>Note Added</title>");
		out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css' rel='stylesheet'>");
		out.println("</head>");
		out.println("<body>");

		out.println("<div class='container mt-5'>");
		out.println("  <div class='row justify-content-center'>");
		out.println("    <div class='col-md-6'>");
		out.println("      <div class='card shadow'>");
		out.println("        <div class='card-header bg-success text-white text-center'>");
		out.println("          <h3>✅ Note Added Successfully</h3>");
		out.println("        </div>");
		out.println("        <div class='card-body text-center'>");
		out.println("          <p class='lead'>Your note has been saved to the database.</p>");
		out.println("          <a href='Add_notes.jsp' class='btn btn-warning me-2'>➕ Add Another Note</a>");
		out.println("          <a href='show_notes.jsp' class='btn btn-dark'>📋 View All Notes</a>");
		out.println("        </div>");
		out.println("      </div>");
		out.println("    </div>");
		out.println("  </div>");
		out.println("</div>");

		out.println("</body>");
		out.println("</html>");
		
		

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
