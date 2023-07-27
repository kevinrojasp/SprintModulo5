package models;

import java.util.ArrayList;
import java.util.List;

public class Contenedor {
    private static List<Capacitacion> capacitaciones = new ArrayList<>();
    private static List<Usuario> usuarios = new ArrayList<>();
    private static List<Pago> pagos = new ArrayList<>();

    public static List<Capacitacion> getCapacitaciones() {
        return capacitaciones;
    }
    public static List<Usuario> getUsuarios() {
        return usuarios;
    }
    public static List<Pago> getPagos() {
        return pagos;
    }

    public static void agregarCapacitacion(Capacitacion capacitacion) {
        capacitaciones.add(capacitacion);
    }
    public static void agregarUsuario(Usuario usuario) {
        usuarios.add(usuario);
    }
    public static void agregarPago(Pago pago) {
        pagos.add(pago);
    }
}