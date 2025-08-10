package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int noteId = Integer.parseInt(request.getParameter("noteId"));
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            Session session = factoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            Note note = session.get(Note.class, noteId);
            if (note != null) {
                note.setTitle(title);
                note.setContent(content);
                note.setAddedDate(new Date());
                session.merge(note); // ✅ explicitly call update
            }

            tx.commit();
            session.close();

            response.sendRedirect("show_notes.jsp"); // redirect to notes page
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
