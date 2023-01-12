/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author Lorena
 */
public class Paciente {
    private String username;
    private String password;
    private String name;
    private String last_name;
    String nro_turno;
    private final Date signup_date;
    //private static int cont = 0;
    
    //creacion con datos minimos obligatorios
    public Paciente(String username, String password){
        this.username = username;
        this.password = password;
        this.signup_date = new Date();
    }
    
    /**
     *
     * @param username
     * @param password
     * @param name
     * @param last_name
     * @param nro_turno
     */
    
    //este constructor sirve para pedir turnos
    public Paciente(String username, String password, String name, String last_name, String nro_turno){
        this.username = username;
        this.password = password;
        this.name = name;
        this.last_name = last_name;
        this.nro_turno = nro_turno;
        this.signup_date = new Date();
    }
    
    //este constructor sirve para actualizaciones
    public Paciente(String username, String password, String name, String last_name){
        this.username = username;
        this.password = password;
        this.name = name;
        this.last_name = last_name;
        this.signup_date = new Date();
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getNro_turno() {
        return nro_turno;
    }
    //actualizar turno (borrar en la bd el turno anterior y actualizarlo)
    public void setNro_turno(String nro_turno) {
        this.nro_turno = nro_turno;
    }

    public Date getSignup_date() {
        return signup_date;
    }
 
}
