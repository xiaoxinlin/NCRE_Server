package com.ncre.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.ncre.model.FileClass;

public class FileController extends Controller implements
		BaseControllerI<FileController> {
	/**
	 * 增加一个文件，前台的表单中的enctype必须为multipart/form-data
	 * 
	 * @param fileClass
	 *            .title,fileClass.type,file
	 * @return
	 */
	@Before(Tx.class)
	public void add() {

		// 保存文件到WebRoot/upload中，同时把文件信息封装到uploadFile对象中
		UploadFile uploadFile = getFile();

		// 系统修改后的上传文件的名字
		String oldUri = uploadFile.getSaveDirectory()
				+ uploadFile.getFileName();

		// 上传文件的原始名字
		String newUri = uploadFile.getSaveDirectory()
				+ uploadFile.getOriginalFileName();

		// 修改文件的名字，使得文件名相同的文件只在文件夹中存在一份
		File file = new File(oldUri);
		File newFile = new File(newUri);

		if (!oldUri.equals(newUri)) {
			if (!newFile.exists()) {
				file.renameTo(newFile);
			} else {
				if(file.exists())file.delete();
			}
		}

		// 把文件信息保存到数据库中
		FileClass fileClass = getModel(FileClass.class);
		fileClass.set("uri", newUri).set("upload_date", new java.util.Date())
				.save();

		renderJson(fileClass);
	}

	/**
	 * 删除一个文件对象（并删除文件对象）
	 * 
	 * @param id
	 * @return
	 */
	@Before(Tx.class)
	public void delete() {

		String id = getPara("id");
		FileClass fileClass = null;
		File file = null;
		try {
			fileClass = FileClass.dao.findById(id);
			fileClass.delete();

			// 删除文件
			// file = new File(fileClass.get("uri").toString());
			//
			// if (file != null || file.exists()) {
			// file.delete();
			// renderText("success");
			// } else {
			// renderText("file not exist!");
			// }

		} catch (Exception e) {
			renderText("id not exist!");
		}
	}
	/**
	 * 获取文件第一页列表,每一页为14条记录
	 * @param pageNum
	 * @return 返回一个page对象
	 */
	public void index() {
		int pageNumber = 1;
		if(getPara("page") != null){
			pageNumber = Integer.parseInt( getPara("page") );
		}
		
		int pageSize = 14;
		Page<FileClass> fileList = FileClass.dao.paginate(pageNumber, pageSize,
				"select *", " from file " );
		renderJson(fileList);
	}
	/**
	 * 通过类型获取文件第一页列表,每一页为14条记录
	 * 
	 * @param type
	 *            -- 需要传入一个文件类型
	 *        pageNum
	 *        	  -- 页码
	 * @return 返回一个page对象
	 */
	public void indexByType() {
		String type = getPara("type");
		int pageNumber = 1;
		if(getPara("page") != null){
			pageNumber = Integer.parseInt( getPara("page") );
		}
		int pageSize = 14;
		Page<FileClass> fileList = FileClass.dao.paginate(pageNumber, pageSize,
				"select *", " from file where type = ?", type);

		renderJson(fileList);
	}

	/**
	 * 显示一个文件对象的详细信息
	 * 
	 * @param id
	 * @return
	 */
	public void show() {

		String id = getPara("id");

		FileClass fileClass = FileClass.dao.findById(id);

		renderJson(fileClass);
	}
	
	/**
	 * 修改一个文件对象，前台的表单中的enctype必须为multipart/form-data
	 * 如果修改对象中的文件，若文件在upload文件夹中存在，则不会再次保存，不存在则保存
	 * 
	 * @param fileClass.id,fileClass.title,fileClass.type,file
	 * @return
	 */
	public void update() {

		// 保存文件到WebRoot/upload中，同时把文件信息封装到uploadFile对象中
		UploadFile uploadFile = getFile();

		// 把文件信息保存到对象中
		FileClass fileClass = getModel(FileClass.class);


		// 系统修改后的上传文件的名字
		String oldUri = uploadFile.getSaveDirectory()
				+ uploadFile.getFileName();

		// 上传文件的原始名字
		String newUri = uploadFile.getSaveDirectory()
				+ uploadFile.getOriginalFileName();

		// 修改文件的名字，使得文件名相同的文件只在文件夹中存在一份
		File file = new File(oldUri);
		File newFile = new File(newUri);

		if (!oldUri.equals(newUri)) {
			if (!newFile.exists()) {
				file.renameTo(newFile);
			} else {
				if(file.exists())file.delete();
			}
		}

		// 修改文件对象的uri
		fileClass.set(
				"uri",
				uploadFile.getSaveDirectory()
						+ uploadFile.getOriginalFileName()).set("upload_date",
				new java.util.Date());

		// 更新数据库里面的信息
		fileClass.update();

		renderJson(fileClass);
	}
	
	/**文件下载功能
	 *@param id 
	 */
	public void download(){
		String id = getPara("id");
		
		FileClass file = FileClass.dao.findById(id);
		
		String path= file.get("uri");
		try{
	        if(!"".equals(path)){
	            path=new String(path.getBytes("ISO-8859-1"),"UTF-8");
	            File downloadFile=new File(path);//构造要下载的文件   
	            if(downloadFile.exists()){
	                InputStream ins=new FileInputStream(path);//构造一个读取文件的IO流对象
	                BufferedInputStream bins=new BufferedInputStream(ins);//放到缓冲流里面
	                OutputStream outs=this.getResponse().getOutputStream();//获取文件输出IO流
	                BufferedOutputStream bouts=new BufferedOutputStream(outs);
	                this.getResponse().setContentType("application/x-download");//设置response内容的类型
	                this.getResponse().setHeader("Content-disposition","attachment;filename="+ URLEncoder.encode(path, "UTF-8"));//设置头部信息
	                int bytesRead = 0;
	                byte[] buffer = new byte[8192];
	                //开始向网络传输文件流
	                while ((bytesRead = bins.read(buffer, 0, 8192)) != -1) {
	                    bouts.write(buffer, 0, bytesRead);
	                }
	                bouts.flush();//这里一定要调用flush()方法
	                ins.close();
	                bins.close();
	                outs.close();
	                bouts.close();
	            }else{
	                System.out.println("下载的文件不存在");
	            }
	        }else{
	            System.out.println("下载文件时参数错误");
	        }
		}catch(Exception e){
			e.printStackTrace();
		}
		
        renderText("success");
	}
}
