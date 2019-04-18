package com.develop.build;

import com.develop.connection.DataSourceConfig;
import com.develop.generator.Generator;

/**
 * @author jlon
 */
public class Build {

    public static void main(String[] args) {
        try {
            generator();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void generator() throws Exception {
        // 得到数据源 Remote@sonli2016
        // DataSourceConfig cfg = new DataSourceConfig("com.mysql.jdbc.Driver",
        // "jdbc:mysql://172.16.100.130:38066/BasePlatform_Msql",
        // "remote", "remote@mysql", DataSourceConfig.MYSQL);
//		DataSourceConfig cfg = new DataSourceConfig("com.mysql.jdbc.Driver",
//				"jdbc:mysql://172.16.100.130:38066/ChargePower_Msql", "remote",
//				"remote@mysql", DataSourceConfig.MYSQL);
        DataSourceConfig cfg = new DataSourceConfig("com.mysql.jdbc.Driver",
                "jdbc:mysql://drdshbgapg3bg6k5.drds.aliyuncs.com:3306/commonplatform", "commonplatform",
                "Aliyun_sonli2018", DataSourceConfig.MYSQL);

        /**
         *
         *
         * witparking.demo 为包名前缀 +repository.irepository +repository.repository
         * +repository.mapper +repository.cache +model
         *
         * 输出目录在项目所在盘符的根目录 generate 文件夹中
         *
         * 逻辑删除logicDelete 对应的xml中sql语句也许需要改一下
         *
         *
         */
		/*Generator generator = new Generator(new String[] { "" },
				"witparking.orders", "template20170519/", cfg);*/
        Generator generator = new Generator(new String[]{""},
                "witparking.businessparking", "template20170519/", cfg);
//		Generator generator = new Generator(new String[] { "" },
//				"org.witparking.starlight", "template20170519/", cfg);

        generator.generate(true, true, true, true, true, true, true, true);

    }
}
