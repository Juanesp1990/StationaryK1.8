/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.stationaryk1_8;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import Persistencia.ConexionBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main extends HttpServlet {

    public static void main(String[] args) {
        try {
            ConexionBD conn = new ConexionBD();
            Connection c = conn.getConnection();
            ResultSet rs = conn.consultarBD("SELECT * FROM producto");
            while (rs.next()){
                System.out.println("ID: "+rs.getString(1));
                System.out.println("Nombre: "+rs.getString(2));
                System.out.println("Unidades: "+rs.getString(3));
                System.out.println("-------------------------");
            }
            conn.closeConnection(c);
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /*
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Hello World!</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Hello World!</h1>");
        out.println("</body>");
        out.println("</html>");
    }
*/
}