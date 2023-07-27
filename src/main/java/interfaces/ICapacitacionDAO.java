package dao;

import models.Capacitacion;

import java.util.List;

public interface ICapacitacionDAO {

    public boolean registrar(Capacitacion capacitacion);
    public List<Capacitacion> listarCapacitaciones();
    public boolean eliminar(Capacitacion capacitacion);
    public boolean modificar(Capacitacion capacitacion);

}