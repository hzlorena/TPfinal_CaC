/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import database.PacienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Paciente;

/**
 *
 * @author Lorena
 */
@WebServlet(name = "PacienteController", urlPatterns = {"/paciente/*"})
public class PacienteController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getPathInfo(); //lee la ruta que me dice que accion me piden
            PacienteDAO pdao = new PacienteDAO();
            HttpSession session = request.getSession();
            Paciente actualUser;
            String username;
            String password;
            String name;
            String last_name;
            String nro_turno;
            int regs_afectados;
                        
            switch (action) { //segun la accion que se me pida va a hacer algo
                case "/loginUser":
                    username = request.getParameter("username"); //dato que cargo el usuario en el formulario input name=username
                    password = request.getParameter("password"); //dato que cargo el usuario en el formulario (SIEMPRE LEE EL NAME DEL INPUT)
                    // verificar si existe el usuario y si coincide la clave
                    boolean existeUsuario = pdao.login(username, password);
                    session.setAttribute("isLogin", existeUsuario);
                    session.setAttribute("actualUsername", username);
                    response.sendRedirect("/turnero/views/user.jsp");
                    break;
                
                case "/logoutUser":
                    session.setAttribute("isLogin", false);
                    session.setAttribute("actualUsername", "");
                    response.sendRedirect("/turnero/");
                    break;
                    
                case "/createUser":
                    username = request.getParameter("username");
                    if( pdao.getUserByUsername(username) == null){
                        password = request.getParameter("password");
                        name = request.getParameter("name");
                        last_name = request.getParameter("last_name");
                        //nro_turno = request.getParameter("nro_turno");
                        
                        actualUser = new Paciente(username,password,name,last_name);
                        regs_afectados = pdao.createUser(actualUser);
                    }
                    else {
                        regs_afectados = 2;
                    }
                    
                    session.setAttribute("uCreado", regs_afectados);
                    response.sendRedirect("/turnero/views/userCreado.jsp");
                    break;
                    
                case "/viewUser":
                    username = (String) session.getAttribute("actualUsername"); //toma el usuario actual (ya estoy login) 
                    actualUser = pdao.getUserByUsername(username); //y lo guarda en la sesion
                    
                    session.setAttribute("actualUser", actualUser);
                    response.sendRedirect("/turnero/views/edicion.jsp");
                    break;
                
                case "/ver": //este seria un edicion.jsp pero solo para ver y editar turno
                    username = (String) session.getAttribute("actualUsername");
                    actualUser = pdao.getUserByUsername(username);
                    
                    session.setAttribute("actualUser", actualUser);
                    response.sendRedirect("/turnero/views/ver.jsp");
                    break;
                    
                case "/updateTurno":
                    username = (String) session.getAttribute("actualUsername"); //obtengo de la sesion el nombre actual del usuario
                    
                    //para actualizar leo el turno del formulario
                    nro_turno = request.getParameter("nro_turno");
                    
                    //obtengo los datos del usuario actual
                    password = (String) session.getAttribute("password");
                    name = (String) session.getAttribute("name");
                    last_name = (String) session.getAttribute("last_name");
                    
                    //creo un nuevo usuario con los datos actualizados
                    actualUser = new Paciente(username, password, name, last_name, nro_turno);
                    regs_afectados = pdao.updateTurno(actualUser);
                    
                    //actualiza el objeto usuario desactualizado en la sesion por el actualizado
                    session.setAttribute("actualUser", actualUser);
                    //me muestra mis datos con el turno
                    response.sendRedirect("/turnero/views/miTurno.jsp");
                    
                    
                    break;
                    
                case "/deleteUser":
                    username = (String) session.getAttribute("actualUsername");//obtengo de la sesion el nombre de usuario actual (ya estoy login)
                    regs_afectados = pdao.deleteUser(username); //borro el usuario
                    session.setAttribute("isLogin", false); //hago logout porque sino quedo atrapado en el usuario que eliminé
                    session.setAttribute("actualUsername", ""); //el usuario actual ahora es ""(nada), no hay actualUsername
                    response.sendRedirect("/turnero/views/cartelUsuarioEliminado.jsp");
                    break;
                    
                case "/updateUser":
                    username = (String) session.getAttribute("actualUsername"); //leo el fomulario del objeto sesion (porque estoy logueado)
                    
                    //para actualizar leo los input del formulario
                    password = request.getParameter("password");
                    name = request.getParameter("name");
                    last_name = request.getParameter("last_name");
                    //nro_turno = request.getParameter("nro_turno");
                    
                    //creo un usuario con los datos actualizados
                    actualUser = new Paciente(username, password, name, last_name);
                    regs_afectados = pdao.updateUser(actualUser); //actualiza el usuario en la BD
                    
                    session.setAttribute("actualUser", actualUser); //actualiza el objeto usuario desactualizado en la sesion por el actualizado
                    response.sendRedirect("/turnero/views/edicion.jsp"); //por si queremos seguir actualizando y no tener que volver a entrar
                    
                    break;
                
                default:
                    break;
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PacienteController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PacienteController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
