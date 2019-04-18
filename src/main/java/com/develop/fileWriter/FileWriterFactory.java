package com.develop.fileWriter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;

import com.develop.table.Table;
import com.develop.util.DirMaker;

import com.develop.util.DirMaker;
import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 
 * @author jlon
 *
 */
public class FileWriterFactory {

	private static Configuration cfg;
	public static final int POJO = 1;
	public static final int MAPPER = 2;
	public static final int ISERVICE = 3;
	public static final int SERVICE = 4;
	public static final int IREPOSITORY = 5;
	public static final int REPOSITORY = 6;
	public static final int SQLXML = 7;
	public static final int CACHE = 8;


	/**
	 * @param url
	 * @return
	 */
	public static Configuration getConfiguration(String url) {
		if (cfg == null) {
			cfg = new Configuration();
			url = FileWriterFactory.class.getResource("/").getPath() + url;
            url.replaceAll("bin","src");
			System.out.println(url);
			File file = new File(url);
			try {
				cfg.setDirectoryForTemplateLoading(file);
				cfg.setObjectWrapper(new DefaultObjectWrapper());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return cfg;
	}

	/**
	 * 
	 * @param cfg
	 *            解析对象
	 * @param templateName
	 *            模板名称
	 */
	public static void dataSourceOut(Configuration cfg, String templateName,
			Table table, int type) {
		String fileName = null;
		Template temp = null;
		try {
			temp = cfg.getTemplate(templateName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Writer out = null;

		try {
			String packageName = "";
			switch (type) {
			case POJO:
				fileName = table.getClassName_d()+".java";
				packageName = table.getPackageName()+".model";// 获得这个文件的存储路径(外部传进来的)
				break;
			case MAPPER:
				fileName = "repository"+"/mapper/"+table.getClassName_d()+"Mapper" + ".java";
				packageName = table.getPackageName();
				break;
			case ISERVICE:
				fileName = "I"+table.getClassName_d()+"Service" + ".java";
				packageName = table.getPackageName()+".interfaces";
				break;
			case SERVICE:
				fileName = table.getClassName_d()+"Service" + ".java";
				packageName = table.getPackageName()+".service";
				break;
			case IREPOSITORY:
				fileName = "repository"+"/irepository/"+"I"+table.getClassName_d()+"Repository" + ".java";
				packageName = table.getPackageName();
				break;
			case REPOSITORY:
				fileName = "repository"+"/repository/"+table.getClassName_d()+"Repository" + ".java";
				packageName = table.getPackageName();
				break;
			case SQLXML:
				fileName = "repository"+"/mapping/"+table.getClassName_d()+"Mapper" + ".xml";
				packageName = table.getPackageName();
				break;
			case CACHE:
				fileName = "repository"+"/cache/"+table.getClassName_d()+"Cache" + ".java";
				packageName = table.getPackageName();
				break;
			}
			packageName = packageName.replace(".", "/");

			String url = "/generate/" + packageName + "/" + fileName;
//			String url = "/generate/" + packageName + "/" + table.getClassName_d() + fileName;

			File file = new File(url);

			DirMaker.createFile(file);

			out = new FileWriter(file);

			temp.process(table, out);

			temp.process(table, new OutputStreamWriter(System.out));

			out.flush();

		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 
	 * @param cfg
	 * @param templateName
	 * @param root
	 * @param fileName
	 */
	public static void dataSourceOut(Configuration cfg, String templateName,
			Object root, String fileName) {

		Template temp = null;
		try {
			temp = cfg.getTemplate(templateName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Writer out = null;
		try {
			if (fileName != null && !"".equals(fileName)) {
				String packageName = "";
				packageName = packageName.replace(".", "/");
				String url = "src/" + packageName + "/" + fileName;
				File file = new File(url);
				out = new FileWriter(file);
				temp.process(root, out);
			}
			temp.process(root, new OutputStreamWriter(System.out));
			out.flush();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
