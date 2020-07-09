package com.pc03.repositorio;

import java.util.List;

import com.pc03.entidad.Docente;

public interface DocenteRepositorio {

	
	public abstract Docente inserta(Docente obj);
	public void elimina (int idDocente);
	public abstract List<Docente> lista();
	public abstract List<Docente> lista(String filtro);
}
