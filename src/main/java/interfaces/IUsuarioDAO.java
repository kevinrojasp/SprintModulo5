package interfaces;

import models.Capacitacion;
import models.Usuario;

import java.util.List;

public interface IUsuarioDAO {
    public boolean registrar(Usuario usuario);
    public List<Usuario> listarUsuarios();
    public boolean eliminar(Usuario usuario);
    public boolean modificar(Usuario usuario);
}
