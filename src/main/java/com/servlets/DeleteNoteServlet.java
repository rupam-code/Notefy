package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;

@WebServlet("/DeleteNoteServlet")
public class DeleteNoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int noteId = Integer.parseInt(request.getParameter("noteId"));

            Session ses = factoryProvider.getFactory().openSession();
            Transaction tx = ses.beginTransaction();

            Note note = ses.get(Note.class, noteId);
            if (note != null) {
                ses.remove(note);
            }

            tx.commit();
            ses.close();

            response.sendRedirect("show_notes.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
