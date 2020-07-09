package com.pc03.servicio;

import java.util.List;

import com.pc03.entidad.Docente;

public interface DocenteServicio {

	public abstract Docente insertaActualizaDocente(Docente obj);
	public void eliminaDocente (int idDocente);
	public abstract List<Docente> listaDocente ();
	public abstract List<Docente> listaDocente (String filtro);
}
