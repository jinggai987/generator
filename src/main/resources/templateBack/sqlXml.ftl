<#macro mapperEl value="">${r"#{"}${value}}</#macro>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${packageName}.repository.mapper.${className_d}Mapper">
	     <!-- 结果对应-->
	<resultMap id="${className_d}Map" type="${packageName}.model.${className_d}">
		<#list tableCarrays as tableCarray>
		   <result property="${tableCarray.carrayName_x}" column="${tableCarray.carrayName}" /> <!-- ${tableCarray.remark}-->
		</#list>
	</resultMap>
	
	
	<sql id="${className_d}Columns">
		  ${stringCarrayNames3}
    </sql>



</mapper>