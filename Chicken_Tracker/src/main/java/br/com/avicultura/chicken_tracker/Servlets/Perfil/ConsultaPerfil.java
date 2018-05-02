/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.avicultura.chicken_tracker.Servlets.Perfil;

import br.com.avicultura.chicken_tracker.Hibernate.HibernateFactory;
import br.com.avicultura.chicken_tracker.Models.Perfil;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;

/**
 *
 * @author Pedro
 */
public class ConsultaPerfil {

    public static Perfil findById(String id) {
        Perfil p;
        Session s = HibernateFactory.getSession();
        p = s.get(Perfil.class, id);
        return p;
    }

    public static List<Perfil> returnList() {
        Session s = HibernateFactory.getSession();
        Query query = s.createQuery("from Perfil");
        return query.getResultList();
    }

    public static String returnValues(Perfil p) {
        String a = "";
        a += p.getNome() + "#";
        a += p.getEmail() + "#";
        a += p.getUsuario() + "#";
        return a;
    }
}
