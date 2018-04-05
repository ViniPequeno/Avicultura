/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
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
public class EstabelecimentoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estabelecimento e = Estabelecimento.getInstance();
        e.setSufixoCNPJ(request.getParameter("inputSuficoCNPJ"));
        e.setCNAE(request.getParameter("inputCNAE"));
        e.setEndereco(request.getParameter("inputEndereco"));
        HibernateUtil<Estabelecimento> hup = new HibernateUtil<>();
        String s = hup.salvar(e);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estabelecimento e = Estabelecimento.getInstance();
        e.setSufixoCNPJ(request.getParameter("inputSuficoCNPJ"));
        e.setCNAE(request.getParameter("inputCNAE"));
        e.setEndereco(request.getParameter("inputEndereco"));
        HibernateUtil<Estabelecimento> hup = new HibernateUtil<>();
        String s = hup.atualizar(e);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Estabelecimento e = Estabelecimento.getInstance();
        e.setSufixoCNPJ(request.getParameter("inputSuficoCNPJ"));
        HibernateUtil<Estabelecimento> hup = new HibernateUtil<>();
        String s = hup.deletar(e);
        PrintWriter out = response.getWriter();
        out.print(s);
        response.sendRedirect("seusNegocios/negocios.jsp");
    }

}
