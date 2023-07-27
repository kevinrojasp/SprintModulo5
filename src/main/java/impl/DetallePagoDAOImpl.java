package impl;

import dao.Conexion;
import dto.DetallePagoDTO;
import models.Pago;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DetallePagoDAOImpl{





    public List<DetallePagoDTO> listadoDetallePago() {
        Statement stm = null;
        Connection con = null;
        ResultSet rs = null;

        String sql = "SELECT p.id, u.nombre AS nombre_cliente, p.monto, p.fecha_pago\n" +
                "FROM pagos p\n" +
                "INNER JOIN usuarios u ON p.cliente_id = u.id\n" +
                "WHERE u.tipo = 'Cliente'";

        List<DetallePagoDTO> listadoPagoDTO = new ArrayList<DetallePagoDTO>();

        try{
            con = Conexion.conectar();
            stm = con.createStatement();
            rs = stm.executeQuery(sql);

            while(rs.next()){
                DetallePagoDTO pagoDTO = new DetallePagoDTO();
                pagoDTO.setId(rs.getInt(1));
                pagoDTO.setNombreCliente(rs.getString(2));
                pagoDTO.setMontoPago(rs.getFloat(3));
                pagoDTO.setFechaPago(rs.getString(4));
                listadoPagoDTO.add(pagoDTO);
            }

            rs.close();
            stm.close();
            con.close();

        }catch (SQLException e) {
            System.out.println("Error : clase ActorDAOImpl en el método listar");
            e.printStackTrace();
        }

        return listadoPagoDTO;

    }





}
