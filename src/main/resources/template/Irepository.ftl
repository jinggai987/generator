package ${packageName}.repository.irepository;

import java.util.*;
import ${packageName}.model.${className_d};

/**
 * ${className}
 */
public interface I${className_d}Repository{

    /**
    * 插入一个${className}
    * @param ${className_x}
    * @return
    */
    boolean insert(${className_d} ${className_x});

    /**
    * 根据主键Id 更新${className}
    * @param ${className_x}
    * @return
    */
    boolean update(${className_d} ${className_x});

    /**
    * 根据主键Id 更新${className}
    * @param ${className_x}
    * @return
    */
    boolean delete(${className_d} ${className_x});

    /**
    * 逻辑删除
    * @param id  主键
    * @return
    */
    boolean logicDelete(String id);

    /**
    * 根据条件获得一个列表
    * @param idList
    * @return
    */
    List<${className_d}> findByIdList(List<String> idList);


    List<${className_d}> search${className_d}ForPage(${className_d} ${className_x});

    ${className_d} getBy${className_d}Id(String id);


}