package edu.cientifica.convivirx.servicesimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cientifica.convivirx.mappers.TipoUnidadMapper;
import edu.cientifica.convivirx.model.TipoUnidad;
import edu.cientifica.convivirx.services.TipoUnidadService;

@Service
public class TipoUnidadServiceImpl implements TipoUnidadService{

	@Autowired
	private TipoUnidadMapper tipoUnidadMapper;
	@Override
	public List<TipoUnidad> listaTipoUnidad() {
		return tipoUnidadMapper.selectTipoUnidadAll();
	}
	

}
