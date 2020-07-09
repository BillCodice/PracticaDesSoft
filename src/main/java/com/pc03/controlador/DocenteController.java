package com.pc03.controlador;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pc03.entidad.*;
import com.pc03.servicio.CategoriaServicio;
import com.pc03.servicio.DocenteServicio;



@Controller
public class DocenteController {

	
	@Autowired
	private DocenteServicio docenteServicio;
	
	
	@Autowired
	private CategoriaServicio servicioCategoria;
	
	
	@RequestMapping("/verDocente")
	public String muestraDocente(Model m) {
		List<Docente> lista = docenteServicio.listaDocente();
		m.addAttribute("docentes", lista);				
		return "crudDocente";
	}
	
	@RequestMapping("/registraActualizaDocente")
	public String registraActualiza(Docente obj, Model m) {
		docenteServicio.insertaActualizaDocente(obj);
		List<Docente> lista =  docenteServicio.listaDocente();
		m.addAttribute("docentes", lista);
		return "crudDocente";
	}	
	
	@RequestMapping("/eliminaDocente")
	public String elimina(int id, Model m) {
		docenteServicio.eliminaDocente(id);
		List<Docente> lista =  docenteServicio.listaDocente();
		m.addAttribute("docentes", lista);
		return "crudDocente";
	}
	
	@RequestMapping("/consultaDocente")
	public String lista(String filtro, Model m) {
		List<Docente> lista =  docenteServicio.listaDocente(filtro+"%");
		m.addAttribute("docentes", lista);
		return "crudDocente";
	}
	
	
	@RequestMapping("/cargaCategoria")
	@ResponseBody
	public List<Categoria> listaCategoria() {
		return servicioCategoria.listaCategoria();
	}
	
	
}
