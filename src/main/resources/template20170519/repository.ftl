package ${packageName}.repository.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ${packageName}.model.${className_d};
import ${packageName}.repository.cache.${className_d}Cache;
import ${packageName}.repository.irepository.I${className_d}Repository;
import ${packageName}.repository.mapper.${className_d}Mapper;

/**
* ${className_d}Repository.
* @author zi dong
*/

@Repository
public class ${className_d}Repository implements I${className_d}Repository {

    @Autowired
    private ${className_d}Mapper ${className_x}Mapper;

    @Autowired
    private ${className_d}Cache ${className_x}Cache;

    public ${className_d}Repository() {

    }

    /**
    * 新增数据.
    * @param ${className_x} ${className_x}
    * @return true/false
    */
    @Override
    public boolean insert(final ${className_d} ${className_x}) {
        final int num = ${className_x}Mapper.insert(${className_x});
        if (num > 0) {
            ${className_x}Cache.save(${className_x});
        }
        return num > 0;
    }

    /**
    * 更新数据.
    * @param ${className_x} ${className_x}
    * @return true/false
    */
    @Override
    public boolean update(final ${className_d} ${className_x}) {
        final int num = ${className_x}Mapper.updateByPrimaryKeySelective(${className_x});
        if (num > 0) {
            ${className_x}Cache.save(${className_x});
        }
        return num > 0;
    }

    /**
    * 更新数据.
    * @param ${className_x} ${className_x}
    * @return true/false
    */
    @Override
    public boolean delete(final ${className_d} ${className_x}) {
        final int num = ${className_x}Mapper.delete(${className_x});
        if (num > 0) {
            ${className_x}Cache.delete(${className_x}.getId());
        }
        return num > 0;
    }

    /**
    * 更新数据.
    * @param id id
    * @return true/false
    */
    @Override
    public boolean logicDelete(final String id) {
        final int num = ${className_x}Mapper.logicDelete(id);
        if (num > 0) {
            ${className_x}Cache.delete(id);
        }
        return num > 0;
    }

    /**
    * 更新数据.
    * @param idList idList
    * @return 集合${className_d}
    */
    @Override
    public List<${className_d}> findByIdList(final List<String> idList) {
        return ${className_x}Mapper.selectList(idList);
    }

    /**
    * 分页查询数据.
    * @param ${className_x} ${className_x}
    * @return 集合${className_d}
    */
    @Override
    public List<${className_d}> search${className_d}ForPage(final
            ${className_d} ${className_x}) {
        return ${className_x}Mapper.search${className_d}ForPage(${className_x});
    }

    /**
    * 分页查询数据.
    * @param id id
    * @return 集合${className_d}
    */
    @Override
    public ${className_d} getBy${className_d}Id(final String id) {
        ${className_d} ${className_x} = ${className_x}Cache.getById(id);
        if (${className_x} == null) {
            ${className_x} = ${className_x}Mapper.getBy${className_d}Id(id);
            if (${className_x} != null) {
                ${className_x}Cache.save(${className_x});
            }
        }
        return ${className_x};
    }

}
