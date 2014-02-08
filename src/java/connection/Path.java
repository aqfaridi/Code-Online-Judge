/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package connection;

/**
 *
 * @author aqfaridi
 */
public class Path {
    static String separator = "/";
    //static String path = "/var/lib/tomcat7/webapps/codeoj";
    static String path = "/home/<YOUR_PC_USER>/NetBeansProjects/codeoj/web";
    public static String getPath()
    {
       return path+separator;
    }  
    public static String getArgPath(String a)
    {
        String temp =  path+separator+a+separator;
        return temp;
    }
    
    public static String getArgPath(String a,String b)
    {
        String temp =  path+separator+a+separator+b+separator;
        return temp;
    }
    public static String getArgPath(String a,String b,String c)
    {
        String temp =  path+separator+a+separator+b+separator+c+separator;
        return temp;
    }
    public static String getArgPath(String a,String b,String c,String d)
    {
        String temp =  path+separator+a+separator+b+separator+c+separator+d+separator;
        return temp;
    }
}
