package edu.cientifica.convivirx.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.cientifica.convivirx.model.Cuota;
import edu.cientifica.convivirx.model.UnidadPrivada;

@Mapper
public interface CuotaMapper {
	
	public List<Cuota>listaCuota();
	public List<Cuota> selectCuota();
	
}
