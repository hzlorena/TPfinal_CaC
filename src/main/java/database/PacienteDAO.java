/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

/**
 *
 * @author Lorena
 */

import config.DBConn;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Paciente;


public class PacienteDAO {
    private final Connection connection;
    
    public PacienteDAO(){
        DBConn conn = new DBConn();
        String DB = "paciente";
        String userDB = "root";
        String passDB = "1234";
       
        connection = conn.getConnection(DB, userDB, passDB);
    }
    
    public Paciente getUserByUsername(String username) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        Paciente u = null;

        ps = connection.prepareStatement("SELECT * FROM users WHERE username = ?");
        ps.setString(1, username);

        rs = ps.executeQuery();

        if(rs.next()) {
            String password = rs.getString("password");
            String name = rs.getString("name");
            String last_name = rs.getString("last_name");
            String nro_turno = rs.getString("nro_turno"); //ACA TENGO EL TURNO

            u = new Paciente(username, password, name, last_name, nro_turno);
        }
        return u;
    }
    
    public int createUser(Paciente u) throws SQLException {
        PreparedStatement ps;
        int lineasAfectadas;
        
        String pQuery = "INSERT INTO users (username, password, name, last_name, nro_turno, signup_date)"
                + " VALUES(?, ?, ?, ?, 0, sysdate());";
        ps = connection.prepareStatement(pQuery);
        
        
        //respetar el orden de lo que pide la consulta SQL
        ps.setString(1, u.getUsername());
        ps.setString(2, u.getPassword());
        ps.setString(3, u.getName());
        ps.setString(4, u.getLast_name());
        //ps.setString(5, u.getNro_turno());
         
        lineasAfectadas = ps.executeUpdate();
        return lineasAfectadas;
    }

    public int updateUser(Paciente u) throws SQLException { //paciente u me sirve para mostrar usuario
        PreparedStatement ps;                               //para modificar el usuario debo leerlos de vuelta del formulario,actualizar y despues mostrar
        int lineasAfectadas;
        
        String pQuery = "UPDATE users SET password = ?, name = ?, last_name = ?"
                + " WHERE username = ?;";
        ps = connection.prepareStatement(pQuery);
        
        //respetar el orden de lo que pide la consulta SQL
        ps.setString(1, u.getPassword());
        ps.setString(2, u.getName());
        ps.setString(3, u.getLast_name());
        ps.setString(4, u.getUsername());
        //ps.setString(5, u.getNro_turno());
         
        lineasAfectadas = ps.executeUpdate();
        return lineasAfectadas;
    }
    
     public int updateTurno(Paciente u) throws SQLException { 
        PreparedStatement ps;                                  
        int lineasAfectadas;
        
        String pQuery = "UPDATE users SET nro_turno = ?"
                + " WHERE username = ?;";
        ps = connection.prepareStatement(pQuery);
        
        //respetar el orden de lo que pide la consulta SQL
        ps.setString(1, u.getNro_turno());
        ps.setString(2, u.getUsername());
         
        lineasAfectadas = ps.executeUpdate();
        return lineasAfectadas;
    }
    
    public int deleteUser(String username) throws SQLException {
        PreparedStatement ps;
        int lineasAfectadas;
        
        String pQuery = "DELETE FROM users WHERE username = ?;";
        ps = connection.prepareStatement(pQuery);
        
        ps.setString(1, username);
        lineasAfectadas = ps.executeUpdate();
        return lineasAfectadas;
    }

    public boolean login(String userInput, String passInput) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
                
        ps = connection.prepareStatement("SELECT username, password FROM users WHERE username = ? AND password = ?;");

        ps.setString(1, userInput);
        ps.setString(2, passInput);

        rs = ps.executeQuery();
                
        return rs.next();
    }
    
        
    public boolean getBorrable(String username) throws SQLException {
        PreparedStatement ps;
        ResultSet rs;
        boolean borrable = false;

        ps = connection.prepareStatement("SELECT * FROM users WHERE username = ?");
        ps.setString(1, username);

        rs = ps.executeQuery();
        
        if(rs.next()) {
           borrable = rs.getBoolean("borrable");
        }
        
        return borrable;
    }
        
}
