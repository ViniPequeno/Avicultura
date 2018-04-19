/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Funcionario;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateUtil;
import br.com.avicultura.chicken_tracker.Models.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class FuncionarioDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Funcionario f = Funcionario.getInstance();
        HibernateUtil<Funcionario> hup = new HibernateUtil<>();
        PrintWriter out = response.getWriter();
        if (request.getParameter("inputCPF") != null) {
            f.setCPF(request.getParameter("inputCPF"));
            String s = hup.deletar(f);
            out.print(s);
            response.sendRedirect("seusNegocios/funcionario.jsp");
        } else {
            ArrayList<String> chkBoxIds = new ArrayList<String>();
            Enumeration enumeration = request.getParameterNames();
            while (enumeration.hasMoreElements()) {
                String parameterName = (String) enumeration.nextElement();
                chkBoxIds.add(parameterName);
            }
            out.println(chkBoxIds.size());
            String[] cpf = new String[chkBoxIds.size()];
            int index = 0;
            for (String s : chkBoxIds) {
                cpf[index] = s.split("!")[1];
                index++;
            }
            for (index = 0; index < cpf.length; index++) {
                f.setCPF(cpf[index]);
                String s = hup.deletar(f);
                out.print(s);
            }
        }
    }

}
