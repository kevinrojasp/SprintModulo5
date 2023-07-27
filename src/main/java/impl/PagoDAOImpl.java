package impl;

import dao.Conexion;
import models.Pago;


import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PagoDAOImpl{


    public boolean registrar(Pago pago) {
        boolean registrar = false;
        Statement stm = null;
        Connection con = null;

        String sql = "INSERT INTO pagos (cliente_id,monto,fecha_pago) values ("+
                pago.getIdCliente()+","+pago.getPago()+",'"+pago.getFecha()+"')";

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



    public List<Pago> listarPagos() {
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;

        String sql = "SELECT * from pagos ORDER BY id";

        List<Pago> listaPago = new ArrayList<Pago>();

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            while(rs.next()){
                Pago pago = new Pago();
                pago.setId(rs.getInt(1));
                pago.setIdCliente(rs.getInt(2));
                pago.setPago(rs.getFloat(3));
                pago.setFecha(rs.getString(4));
                listaPago.add(pago);
            }

            rs.close();
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método listar");
            e.printStackTrace();
        }

        return listaPago;

    }





}
