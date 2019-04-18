package ${packageName}.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${packageName}.interfaces.I${className_d}Service;
import ${packageName}.repository.irepository.I${className_d}Repository;

/**
 * ${className}.
 * @author zi dong
 */

@Service("${className_x}Service")
public  class ${className_d}Service implements I${className_d}Service{

    @Autowired
    private I${className_d}Repository ${className_x}Repository;

    public CategoryinapplicationService() {

    }

}
