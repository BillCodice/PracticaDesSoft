package com.pc03.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pc03.entidad.Categoria;
import com.pc03.repositorio.CategoriaRepositorio;

@Service
public class CategoriaServicioImpl implements CategoriaServicio {

	@Autowired
	private CategoriaRepositorio repositorio;
	
	
	@Override
	public List<Categoria> listaCategoria() {
		
		return repositorio.lista();
	}

}
