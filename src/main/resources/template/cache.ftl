package ${packageName}.repository.cache;

import org.springframework.stereotype.Component;
import witparking.core.data.commons.persistence.CacheDao;
import witparking.core.utils.RedisCluster;
import ${packageName}.model.${className_d};

/**

 */
@Component
public class ${className_d}Cache extends CacheDao<${className_d}>{

    private static int expire= RedisCluster.EXPIRE_LEVEL1;

    /**
    * 添加
    * @param entity
    */
    public void save(${className_d} entity){
        super.save(entity, entity.getId(), expire);
    }

    /**
    * 根据id查询
    *
    * @param id
    * @return
    */
    public ${className_d} getById(String id){
        return super.getById(id,expire);
    }

}