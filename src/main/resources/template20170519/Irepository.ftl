package ${packageName}.repository.irepository;

import java.util.List;

import ${packageName}.model.${className_d};

/**
 * ${className}.
 *@author zi dong
 */

public interface I${className_d}Repository {

    /**
    * 插入一个${className}.
    * @param ${className_x} ${className_x}
    * @return true/false
    */
    boolean insert(${className_d} ${className_x});

    /**
    * 根据主键Id 更新${className}.
    * @param ${className_x} ${className_x}
    * @return true/false
    */
    boolean update(${className_d} ${className_x});

    /**
    * 根据主键Id 更新${className}.
    * @param ${className_x} ${className_x}
    * @return true/false
    */
    boolean delete(${className_d} ${className_x});

    /**
    * 逻辑删除.
    * @param id 主键
    * @return true/false
    */
    boolean logicDelete(String id);

    /**
    * 根据条件获得一个列表.
    * @param idList idList
    * @return 集合${className_d}
    */
    List<${className_d}> findByIdList(List<String> idList);

    /**
    * 分页查询.
    * @param ${className_x} ${className_x}
    * @return 集合${className_d}
    */
    List<${className_d}> search${className_d}ForPage(${className_d} ${className_x});

    /**
    * 根据主键ID获得数据.
    * @param id id
    * @return ${className_d}
    */
    ${className_d} getBy${className_d}Id(String id);

}
