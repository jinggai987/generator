package ${packageName}.repository.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import ${packageName}.model.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import ${packageName}.repository.mapper.${className_d}Mapper;

@Repository
public class ${className_d}Repository implements I${className_d}Repository{

    @Autowired
    private ${className_d}Mapper ${className_x}Mapper;


    public boolean insert(${className_d} ${className_x}) {
        return ${className_x}Mapper.insert(${className_x})>0;
    }

    public boolean update(${className_d} ${className_x}) {
        return ${className_x}Mapper.updateByPrimaryKeySelective(${className_x})>0;
    }

    public boolean delete(${className_d} ${className_x}) {
        return ${className_x}Mapper.deleteByPrimaryKey(${className_x})>0;
    }

    public List<${className_d}> select(${className_d} ${className_x}) {
        return ${className_x}Mapper.select(${className_x});
    }

    public List<${className_d}> selectList(List<String> idList) {
        return ${className_x}Mapper.selectList(idList);
    }

}