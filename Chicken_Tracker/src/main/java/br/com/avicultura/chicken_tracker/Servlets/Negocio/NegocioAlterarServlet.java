/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Negocio;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Negocio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class NegocioAlterarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Negocio n = Negocio.getInstance();
        n.setNome(request.getParameter("inputNome"));
        n.setEmpresaCNPJ(request.getParameter("inputEmpresaCNPJ"));
        n.setLinkEmail(request.getParameter("inputLinkEmail"));
        n.setLinkInstragram(request.getParameter("inputLinkInstragram"));
        n.setLinkFacebook(request.getParameter("inputLinkFacebook"));
        //f.setEstabelecimentos();
        HibernateUtil<Negocio> hup = new HibernateUtil<>();
        String s = hup.atualizar(n);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");

    }

}