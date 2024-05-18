package com.bigel.servlet;

import com.bigel.bean.SongBean;
import com.bigel.entity.Song;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/song")
public class SongServlet extends HttpServlet {
    @EJB
    private SongBean songBean;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        switch (req.getParameter("action")) {
            case "add" -> {
                String title = req.getParameter("title");
                String artist = req.getParameter("artist");
                songBean.save(new Song(title, artist));
                resp.sendRedirect(req.getContextPath() + "/song");
            }
            case "edit" -> {
                Long id = Long.parseLong(req.getParameter("id"));
                String title = req.getParameter("title");
                String artist = req.getParameter("artist");
                songBean.edit(id, new Song(title, artist));
                resp.sendRedirect(req.getContextPath() + "/song");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            getAll(req, resp);
        }
        try {
            switch (action) {
                case "add" -> {
                    getServletContext().getRequestDispatcher("/template.jsp").forward(req, resp);
                }
                case "edit" -> {
                    req.setAttribute("song", songBean.findById(Long.parseLong(req.getParameter("id"))));
                    getServletContext().getRequestDispatcher("/template.jsp").forward(req, resp);
                }
                case "delete" -> {
                    songBean.deleteById(Long.parseLong(req.getParameter("id")));
                    resp.sendRedirect(req.getContextPath() + "/song");
                }
            }
        } catch (NumberFormatException ex) {
            getAll(req, resp);
        }
    }

    private void getAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("songs", songBean.findAll());
        getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
