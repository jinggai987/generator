package ${packageName}.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import witparking.core.data.mybatis.MybatisMapper;
import ${packageName}.model.${className_d};

/**
 * ${className}.
 * @author zi dong
 */

public interface ${className_d}Mapper extends MybatisMapper<${className_d}> {

    ${className_d} getBy${className_d}Id(@Param("id") String id);

    List<${className_d}> search${className_d}ForPage(${className_d} ${className_x});

    int logicDelete(String id);

}
