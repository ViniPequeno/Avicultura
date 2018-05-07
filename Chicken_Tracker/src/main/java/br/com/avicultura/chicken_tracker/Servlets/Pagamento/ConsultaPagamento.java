/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Pagamento;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Pagamento;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author vinic
 */
public class ConsultaPagamento {
    
    public static List<Pagamento> returnList(String estabelecimento) {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Pagamento p where p.estabelecimento.sufixoCNPJ =:estabelecimento"
                + "ORDEY BY ano DESC, mes DESC, dia DESC, valor DESC");
        query.setParameter("estabelecimento", estabelecimento);
        List<Pagamento> lista = query.getResultList();
        return lista;
    }
}