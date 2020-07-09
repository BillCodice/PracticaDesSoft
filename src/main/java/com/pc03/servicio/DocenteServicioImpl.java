package com.pc03.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pc03.entidad.Docente;
import com.pc03.repositorio.DocenteRepositorio;
@Service
public class DocenteServicioImpl implements DocenteServicio {
	
	@Autowired
	private DocenteRepositorio repositorio;
	
	
	@Override
	public Docente insertaActualizaDocente(Docente obj) {
		
		return repositorio.inserta(obj);
	}
	
	@Override
	public void eliminaDocente(int idDocente) {
		
		repositorio.elimina(idDocente);
	}

	@Override
	public List<Docente> listaDocente() {
		
		return repositorio.lista();
	}
	
public List<Docente> listaDocente(String filtro) {
		
		return repositorio.lista(filtro);
	}

}
