package ${packageName}.model;


import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.Table;

import witparking.core.data.mybatis.mapper.mapper.annotation.NameStyle;
import witparking.core.data.mybatis.mapper.mapper.code.Style;
/**
 * ${className}.
 * 如果表名跟实体类不同 需要注明一下表名.
 * @author zi dong
 */

@Table(name = "${className}")
@NameStyle(Style.normal)
public class ${className_d} implements Serializable {

    private static final long serialVersionUID = 1L;

    <#--列出所有的字段 -->
	<#list tableCarrays as tableCarray>
    /*
    * ${tableCarray.remark}.
    */
    <#if (tableCarray.carrayName_x == "id")>@Id</#if>
    private <#if (tableCarray.carrayType == "byte")>Integer<#else>${tableCarray.carrayType}</#if> ${tableCarray.carrayName_x};

	</#list>

    /*
    * 无参构造方法.
    */
    public ${className_d}() {

    }

	 <#--字段的get和set -->
	<#list tableCarrays as tableCarray>

    /*
    * @return ${tableCarray.carrayName_x}
    */
    public <#if (tableCarray.carrayType == "byte")>Integer<#else>${tableCarray.carrayType}</#if> get${tableCarray.carrayName_d}() {
        return ${tableCarray.carrayName_x};
    }

    /*
    * @param ${tableCarray.carrayName_x} ${tableCarray.carrayName_x}
    */
    public void set${tableCarray.carrayName_d}(final <#if (tableCarray.carrayType == "byte")>Integer<#else>${tableCarray.carrayType}</#if> ${tableCarray.carrayName_x}) {
        this.${tableCarray.carrayName_x} = ${tableCarray.carrayName_x};
    }
    </#list>

}
