package ${packageName}.model;


import witparking.core.data.mybatis.mapper.mapper.annotation.NameStyle;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

/**
 * ${className}
 */
@Table(name="${className}") //如果表名跟实体类不同 需要注明一下表名
@NameStyle()
public class ${className_d} implements Serializable{

	private static final long serialVersionUID =  1L;

    <#--列出所有的字段 -->
	<#list tableCarrays as tableCarray>
	/**
	   ${tableCarray.remark}
	 */
	private ${tableCarray.carrayType} ${tableCarray.carrayName_x};
	
	</#list>
		

	 <#--字段的get和set -->
	<#list tableCarrays as tableCarray>
	
	public ${tableCarray.carrayType} get${tableCarray.carrayName_d}() {
		return ${tableCarray.carrayName_x};
	}

	public void set${tableCarray.carrayName_d}(${tableCarray.carrayType} ${tableCarray.carrayName_x}) {
		this.${tableCarray.carrayName_x} = ${tableCarray.carrayName_x};
	} 
	</#list>
	
}
