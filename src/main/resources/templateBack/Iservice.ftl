package ${packageName}.interfaces;
import java.util.*;
import ${packageName}.model.${className_d};

/**
 * ${className}
 */
public interface I${className_d}Service{

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
		* 根据条件获得一个列表
		* @param ${className_x}
		* @return
		*/
		List<${className_d}> select(${className_d} ${className_x});

		/**
		* 根据条件获得一个列表
		* @param idList
		* @return
		*/
		List<${className_d}> selectList(List<String> idList);
	
}