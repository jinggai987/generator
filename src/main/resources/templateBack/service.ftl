package ${packageName}.service.impl;
import java.util.*;
import ${packageName}.interfaces.I${className_d}Service;
import ${packageName}.model.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * ${className}
 */
@Service("${className_x}Service")
public  class ${className_d}Service implements I${className_d}Service{
    @Autowired
	private I${className_d}Repository ${className_x}Repository;

	public boolean insert(${className_d} ${className_x}) {
		return ${className_x}Repository.insert(${className_x});
	}

	public boolean update(${className_d} ${className_x}) {
		return ${className_x}Repository.update(${className_x});
	}

	public boolean delete(${className_d} ${className_x}) {
		return ${className_x}Repository.delete(${className_x});
	}

	public List<${className_d}> select(${className_d} ${className_x}) {
		return ${className_x}Repository.select(${className_x});
	}

	public List<${className_d}> selectList(List<String> idList) {
		return ${className_x}Repository.selectList(idList);
	}

	
}