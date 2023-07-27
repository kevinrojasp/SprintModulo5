package impl;

import dao.Conexion;
import models.Capacitacion;

import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CapacitacionDAOImpl implements dao.ICapacitacionDAO {
    @Override
    public boolean registrar(Capacitacion capacitacion) {
        boolean registrar = false;
        Statement stm = null;
        Connection con = null;

        String sql = "INSERT INTO capacitaciones (nombre,detalle) values ('"+
                capacitacion.getNombre()+"','"+capacitacion.getDetalle()+"')";

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
    public List<Capacitacion> listarCapacitaciones() {
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;

        String sql = "SELECT * from capacitaciones ORDER BY id";

        List<Capacitacion> listaCapacitaciones = new ArrayList<Capacitacion>();

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            while(rs.next()){

                Capacitacion capacitacion = new Capacitacion();

                capacitacion.setId(rs.getInt(1));
                capacitacion.setNombre(rs.getString(2));
                capacitacion.setDetalle(rs.getString(3));


                listaCapacitaciones.add(capacitacion);

            }

            rs.close();
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método listar");
            e.printStackTrace();
        }

        return listaCapacitaciones;


    }

    @Override
    public boolean eliminar(Capacitacion capacitacion) {
        return false;
    }

    @Override
    public boolean modificar(Capacitacion capacitacion) {
        return false;
    }
}
