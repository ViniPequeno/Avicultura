/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Funcionario;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Estabelecimento;
import br.com.avicultura.chicken_tracker.Models.EstabelecimentoFuncionario;
import br.com.avicultura.chicken_tracker.Models.Funcionario;
import br.com.avicultura.chicken_tracker.Servlets.Estabelecimentos.ConsultaEstabelecimento;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author User
 */
public class ConsultaFuncionario {

    public static Funcionario findById(String id) {
        Session s = HibernateFactory.getSession();
        Funcionario f = s.get(Funcionario.class, id);
        return f;
    }

    public static List<Funcionario> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from EstabelecimentoFuncionario ef where "
                + "ef.estabelecimento.sufixoCNPJ =:estabelecimento");
        query.setParameter("estabelecimento", estabelecimento);
        List<EstabelecimentoFuncionario> listaEF = query.getResultList();

        List<Funcionario> lista = new ArrayList<>();
        for (EstabelecimentoFuncionario ef : listaEF) {
            lista.add(ef.getFuncionario());
        }

        return lista;
    }

    public static List<Funcionario> returnList() {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Funcionario");
        List<Funcionario> lista = query.getResultList();
        return lista;
    }

    public static String returnValues(Funcionario f, String estabelecimento) {
        String a = "";
        a += f.getCPF() + "#";
        //a += f.getCargo() + "#";
        a += f.getNome() + "#";
        a += f.getRG() + "#";
        Estabelecimento e = ConsultaEstabelecimento.findById(estabelecimento);
        for (EstabelecimentoFuncionario ef : f.getEstabelecimentos()) {
            if (e.equals(ef.getEstabelecimento())) {
                a += ef.getCargo() + "#";
                a += ef.getSituacao()+ "#";
                a += ef.getSalario()+ "#";
            }
        }
        //a += f.getSalario() + "#";
        //a += f.getSituacao() + "#";

        return a;
    }
}
