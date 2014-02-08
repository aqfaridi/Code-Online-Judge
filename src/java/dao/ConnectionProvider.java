package dao;

/**
 *
 * @author kg
 */

import org.hibernate.SessionFactory;

import org.hibernate.cfg.Configuration;

public class ConnectionProvider {
    public Configuration cfg;
    public SessionFactory factory;
     
    public ConnectionProvider(){
         this.cfg = new Configuration().configure("hibernate.cfg.xml");
         this.factory = cfg.buildSessionFactory();
         
        }
    public SessionFactory getSessionFactory(){
    return this.factory;
    }
}