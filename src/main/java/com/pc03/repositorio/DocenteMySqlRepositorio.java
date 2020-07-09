package com.pc03.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import com.pc03.entidad.*;

@Repository
public class DocenteMySqlRepositorio implements DocenteRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	RowMapper<Docente> mapperDocente = new RowMapper<Docente>() {

		@Override
		public Docente mapRow(ResultSet rs, int rowNum) throws SQLException {
			Docente obj = new Docente();
			obj.setIdDocente(rs.getInt(1));	
			obj.setNombre(rs.getString(2));
			obj.setDni(rs.getString(3));
			obj.setFechaNacimiento(rs.getString(4));
			obj.setSueldo(rs.getDouble(5));
			obj.setEmail(rs.getString(6));
			obj.setSexo(rs.getString(7));
			
			Categoria cat= new Categoria();
			cat.setIdCategoria(rs.getInt(8));
			cat.setNombre(rs.getString(9));
			
			obj.setCategoria(cat);
			
		
			return obj;
		}
	};
	
	@Override
	public Docente inserta(Docente obj) {
		Docente salida = null;
		if (obj.getIdDocente() == 0) {
			jdbcTemplate.update("insert into docente values (null,?,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(),obj.getDni(),obj.getFechaNacimiento(),obj.getSueldo(),obj.getEmail(),obj.getSexo(),obj.getCategoria().getIdCategoria()});	
			List<Docente> lista= jdbcTemplate.query("select d.*,c.nombre from docente d inner join categoria c on c.idCategoria = d.idCategoria", new Object [] {},mapperDocente);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update docente set  nombre=?,dni=?,fechanacimiento=?,sueldo=?,email=?,sexo =?, idCategoria = ? where idDocente=?", new Object[] {obj.getNombre(),obj.getDni(),obj.getFechaNacimiento(),obj.getSueldo(),obj.getEmail(),obj.getSexo(),obj.getCategoria().getIdCategoria(),obj.getIdDocente()});
			List<Docente> lista= jdbcTemplate.query("select d.*,c.nombre from docente d inner join categoria c on c.idCategoria = d.idCategoria", new Object [] {},mapperDocente);
			salida = lista.get(0);
		}
		return salida;
				
//		return jdbcTemplate.update("insert into docente values (null,?,?,?,?,?,?,?)",new Object[]{obj.getNombre(),obj.getDni(),obj.getFechaNacimiento(),obj.getSueldo(),obj.getEmail(),obj.getSexo(),obj.getCategoria().getIdCategoria()});
//		
	}
	
	@Override
	public void elimina(int idDocente) {
		
		
		
		 jdbcTemplate.update("delete from docente where idDocente = ?",new Object[]{idDocente});
		
	}
	

	@Override
	public List<Docente> lista() {
		List<Docente> lista= jdbcTemplate.query("select d.*,c.nombre from docente d inner join categoria c on c.idCategoria = d.idCategoria", new Object [] {},mapperDocente);
		return lista;
	}
	
	@Override
	public List<Docente> lista(String filtro) {
		List<Docente> lista= jdbcTemplate.query("select d.*,c.nombre from docente d inner join categoria c on c.idCategoria = d.idCategoria where d.nombre like ?", new Object [] {filtro},mapperDocente);
		return lista;
	}

}
