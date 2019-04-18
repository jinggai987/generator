package ${packageName}.repository.cache;

import org.springframework.stereotype.Component;

import witparking.core.data.commons.persistence.CacheDao;
import witparking.core.utils.RedisCluster;
import ${packageName}.model.${className_d};

/**
* ${className_d}Cache.
* @author zi dong
*/

@Component("")
public class ${className_d}Cache extends CacheDao<${className_d}> {

    private static int expire = RedisCluster.EXPIRE_LEVEL1;

    public ${className_d}Cache() {

    }

    /**
    * 添加.
    * @param entity entity
    */
    public void save(final ${className_d} entity) {
        super.save(entity, entity.getId(), expire);
    }

    /**
    * 根据id查询.
    *
    * @param id id
    * @return ${className_d}
    */
    public ${className_d} getById(final String id) {
        return super.getById(id, expire);
    }

}
