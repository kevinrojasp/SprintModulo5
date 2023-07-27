package impl;

import dao.Conexion;
import interfaces.IUsuarioDAO;
import models.Usuario;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOImpl implements IUsuarioDAO {

    @Override
    public boolean registrar(Usuario usuario) {
        boolean registrar = false;
        Statement stm = null;
        Connection con = null;

        String sql = "INSERT INTO usuarios (nombre,tipo,pass) values ('"+
                usuario.getNombre()+"','"+usuario.getTipo()+"','"+usuario.getPass()+"')";

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            registrar = true;
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método registrar");
            e.printStackTrace();
        }
        return registrar;
    }


    @Override
    public List<Usuario> listarUsuarios() {
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;

        String sql = "SELECT * from usuarios ORDER BY id";

        List<Usuario> listaUsuarios = new ArrayList<Usuario>();

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            while(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setTipo(rs.getString(3));
                usuario.setPass(rs.getString(4));
                listaUsuarios.add(usuario);
            }

            rs.close();
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método listar");
            e.printStackTrace();
        }

        return listaUsuarios;

    }

    @Override
    public boolean eliminar(Usuario usuario) {
        return false;
    }

    @Override
    public boolean modificar(Usuario usuario) {
        return false;
    }


    public Usuario modificarUsuario(int id){
        Usuario usuario = new Usuario();
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;
        String sql = "SELECT * from usuarios where id='"+id+"';";
        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            while(rs.next()){
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setTipo(rs.getString(3));
                usuario.setPass(rs.getString(4));
            }
            rs.close();
            stm.close();
            con.close();
        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método listar");
            e.printStackTrace();
        }
        return usuario;
    }
    public boolean modificarUser(Usuario usuario) {
        boolean modificar = false;
        Statement stm = null;
        Connection con = null;
        String sql = "UPDATE usuarios SET nombre = '" + usuario.getNombre() +
                "', tipo = '" + usuario.getTipo() +
                "', pass = '" + usuario.getPass() +
                "' WHERE id = '" + usuario.getId() +
                "';";
        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            modificar = true;
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método modificarUser");
            e.printStackTrace();
        }
        return modificar;
    }

    public boolean eliminarUsuario(Usuario usuario) {
        boolean eliminar = false;
        Statement stm = null;
        Connection con = null;
        String sql = "DELETE FROM usuarios WHERE id = "+usuario.getId();
        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            stm.execute(sql);
            eliminar = true;
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método modificarUser");
            e.printStackTrace();
        }
        return eliminar;
    }

}
