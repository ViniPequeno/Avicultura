/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Login;

import br.com.avicultura.chicken_tracker.Servlets.Perfil.ConsultaPerfil;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class executarLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        HttpSession sessao = request.getSession();
        sessao.setAttribute("usuario_logado", null);
        sessao.setAttribute("nome_usuario", null);
        sessao.setAttribute("usuario", null);
        sessao.invalidate();
        response.sendRedirect("main/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession sessao = request.getSession();
        String login = request.getParameter("inputLogin");
        response.getWriter().println();
        Perfil p = ConsultaPerfil.findById(login);
        if (p == null) {
            response.sendRedirect("main/login.jsp?login=false");
        } else if (request.getParameter("inputSenha").equals(p.getSenha())) {
            sessao.setAttribute("usuario_logado", "true");
            sessao.setAttribute("nome_usuario", request.getParameter("inputLogin"));
            sessao.setAttribute("usuario", p);
            response.sendRedirect("seusNegocios/negocios.jsp");
        } else {
            response.sendRedirect("main/login.jsp?password=false");
        }

    }

}
