package com.develop.generator;

import java.sql.Connection;
import java.util.List;

import com.develop.connection.ConnectionFactory;
import com.develop.connection.DataSourceConfig;
import com.develop.fileWriter.FileWriterFactory;
import com.develop.table.Table;
import com.develop.util.TableUtil;

import com.develop.connection.ConnectionFactory;
import com.develop.connection.DataSourceConfig;
import com.develop.fileWriter.FileWriterFactory;
import com.develop.util.TableUtil;
import freemarker.template.Configuration;

/**
 * 
 * @author jlon
 *
 */
public class Generator {

    private String packageName;

    private String templateUrl;

    private String[] tableNames;

    private DataSourceConfig cfg;

    /**
     * @throws Exception
     */
    public Generator(String packageName, String templateUrl, DataSourceConfig cfg) {
        super();
        this.packageName = packageName;
        this.templateUrl = templateUrl;
        this.cfg = cfg;
    }

    /**
     * @throws Exception
     */
    public Generator(String[] tableNames, String packageName, String templateUrl, DataSourceConfig cfg) {
        super();
        this.packageName = packageName;
        this.tableNames = tableNames;
        this.templateUrl = templateUrl;
        this.cfg = cfg;
    }

    /**
     * 
     * {方法功能中文描述}
     * 
     * @throws Exception
     * @author: cuicong
     * @datetime:2015年9月15日下午3:25:45
     */
    public void generate(boolean pojo, boolean mapper, boolean iservice, boolean service,
            boolean irepository, boolean repository,boolean sqlXml,boolean cache) throws Exception {

        //获得数据库连接
        Connection conn = ConnectionFactory.getConnection(cfg);

        //获取所有的表名
        List<Table> tables = TableUtil.getTables(conn, packageName, tableNames);

        //获取模板
        Configuration configuration = FileWriterFactory.getConfiguration(templateUrl);

        for (Table table : tables) {
            if (pojo) {
                buildFactory(table, configuration, FileWriterFactory.POJO);
            }
            if (mapper) {
                buildFactory(table, configuration, FileWriterFactory.MAPPER);
            }
            if (iservice) {
                buildFactory(table, configuration, FileWriterFactory.ISERVICE);
            }
            if (service) {
                buildFactory(table, configuration, FileWriterFactory.SERVICE);
            }
            if (irepository) {
                buildFactory(table, configuration, FileWriterFactory.IREPOSITORY);
            }
            if (repository) {
                buildFactory(table, configuration, FileWriterFactory.REPOSITORY);
            }
            if (sqlXml) {
                buildFactory(table, configuration, FileWriterFactory.SQLXML);
            }
            if (cache) {
                buildFactory(table, configuration, FileWriterFactory.CACHE);
            }

        }
        System.err.println("祝贺你,生成成功！");
    }

    /**
     * 
     */
    public void buildFactory(Table table, Configuration configuration, int type) {
        String templateUrl = "";
        switch (type) {
        case FileWriterFactory.POJO:
            templateUrl = "pojo.ftl";
            break;
        case FileWriterFactory.MAPPER:
            templateUrl = "mapper.ftl";
            break;
        case FileWriterFactory.ISERVICE:
            templateUrl = "Iservice.ftl";
            break;
        case FileWriterFactory.SERVICE:
            templateUrl = "service.ftl";
            break;
        case FileWriterFactory.IREPOSITORY:
            templateUrl = "Irepository.ftl";
            break;
        case FileWriterFactory.REPOSITORY:
            templateUrl = "repository.ftl";
            break;
        case FileWriterFactory.SQLXML:
            templateUrl = "sqlXml.ftl";
            break;
        case FileWriterFactory.CACHE:
            templateUrl = "cache.ftl";
            break;
        }
        build(table, configuration, templateUrl, type);
    }

    /**
    * 
    * @param table
    * @param configuration
    */
    public void build(Table table, Configuration configuration, String templateUrl, int type) {
        FileWriterFactory.dataSourceOut(configuration, // 解析对象
                templateUrl, //模板名称
                table, //数据对象
                type);
    }

}
