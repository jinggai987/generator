package ${packageName}.repository.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.*;
import ${packageName}.model.${className_d};
import ${packageName}.repository.irepository.I${className_d}Repository;
import ${packageName}.repository.cache.${className_d}Cache;
import ${packageName}.repository.mapper.${className_d}Mapper;

@Repository
public class ${className_d}Repository implements I${className_d}Repository{

    @Autowired
    private ${className_d}Mapper ${className_x}Mapper;

    @Autowired
    private ${className_d}Cache ${className_x}Cache;

    @Override
    public boolean insert(${className_d} ${className_x}) {
        int num = ${className_x}Mapper.insert(${className_x});
        if(num>0){
            ${className_x}Cache.save(${className_x});
        }
        return num>0;
    }

    @Override
    public boolean update(${className_d} ${className_x}) {
        int num = ${className_x}Mapper.updateByPrimaryKeySelective(${className_x});
        if(num>0){
            ${className_x}Cache.save(${className_x});
        }
        return num>0;
    }

    @Override
    public boolean delete(${className_d} ${className_x}) {
        int num = ${className_x}Mapper.delete(${className_x});
        if(num>0){
            ${className_x}Cache.delete(${className_x}.getId());
        }
        return num>0;
    }

    @Override
    public boolean logicDelete(String id) {
        int num =  ${className_x}Mapper.logicDelete(id);
        if(num>0){
            ${className_x}Cache.delete(id);
        }
        return num>0;
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
        ${className_d} ${className_x} = ${className_x}Cache.getById(id);
        if(${className_x}==null){
            ${className_x} = ${className_x}Mapper.getBy${className_d}Id(id);
            if(${className_x}!=null){
                ${className_x}Cache.save(${className_x});
            }
        }
        return ${className_x};
    }

}