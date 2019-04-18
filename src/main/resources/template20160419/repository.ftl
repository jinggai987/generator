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

    @Override
    public boolean insert(${className_d} ${className_x}) {
        return ${className_x}Mapper.insert(${className_x})>0;
    }

    @Override
    public boolean update(${className_d} ${className_x}) {
        return ${className_x}Mapper.updateByPrimaryKeySelective(${className_x})>0;
    }

    @Override
    public boolean delete(${className_d} ${className_x}) {
        return ${className_x}Mapper.deleteByPrimaryKey(${className_x})>0;
    }

    @Override
    public boolean logicDelete(String id) {
        return ${className_x}Mapper.logicDelete(id)>0;
    }

    @Override
    public List<${className_d}> findByIdList(List<String> idList) {
        return ${className_x}Mapper.selectList(idList);
    }

    @Override
    public List<${className_d}> search${className_d}ForPage(${className_d} ${className_x}){
    return ${className_x}Mapper.search${className_d}ForPage(${className_x});
    }

    @Override
    public ${className_d} getBy${className_d}Id(String id){
        return ${className_x}Mapper.getBy${className_d}Id(id);
    }

}