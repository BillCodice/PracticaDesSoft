package com.pc03.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.pc03.entidad.Categoria;

@Repository
public class CategoriaMySqlRepositorio implements CategoriaRepositorio {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	RowMapper<Categoria> mapperCategoria = new RowMapper<Categoria>() {

		@Override
		public Categoria mapRow(ResultSet rs, int rowNum) throws SQLException {
			Categoria obj=new Categoria();
			obj.setIdCategoria(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			return obj;
		}
	};
	
	@Override
	public List<Categoria> lista() {
		List<Categoria> lista=jdbcTemplate.query("select * from categoria",new Object[] {},mapperCategoria);
		return lista;
	}

}
