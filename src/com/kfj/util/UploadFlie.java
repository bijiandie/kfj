package com.kfj.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.kfj.entity.Baby;

/**
* @ClassName: UploadHandleServlet
* @Description: TODO(这里用一句话描述这个类的作用)
* @author: 孤傲苍狼
* @date: 2015-1-3 下午11:35:50
*
*/ 
public class UploadFlie extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public  Baby upload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                //消息提示
                String message = "";
                Baby baby = new Baby();
                try{
                    //使用Apache文件上传组件处理文件上传步骤：
                    //1、创建一个DiskFileItemFactory工厂
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
                    factory.setSizeThreshold(1024*10240);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
                    //设置上传时生成的临时文件的保存目录
                    //2、创建一个文件上传解析器
                    ServletFileUpload upload = new ServletFileUpload(factory);
                     //解决上传文件名的中文乱码
                    upload.setHeaderEncoding("UTF-8"); 
                    //3、判断提交上来的数据是否是上传表单的数据
                    if(!ServletFileUpload.isMultipartContent(request)){
                        //按照传统方式获取数据
                        return null;
                    }
                    
                    //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
                    upload.setFileSizeMax(1024*10240);
                    //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
                    upload.setSizeMax(1024*1024*10);
                    //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
                    List<FileItem> list = upload.parseRequest(request);
                    for(FileItem item : list){
                        //如果fileitem中封装的是普通输入项的数据
                        if(item.isFormField()){
                            String name = item.getFieldName();
                            String value = item.getString("UTF-8");
                            if(name.equals("name")){
                            	baby.setName(value);
                            }else if(name.equals("sex")){
                            	baby.setSex(value);
                            }else if(name.equals("age")){
                            	baby.setAge(value);
                            }else if(name.equals("phone")){
                            	baby.setPhone(value);
                            }else if(name.equals("ywydm")){
                            	baby.setYwydm(value);
                            }else if(name.equals("picture")){
                            	baby.setPicture(value);
                            }else if(name.equals("talent")){
                            	baby.setTalent(value);
                            }else if(name.equals("czjy")){
                            	baby.setCzjy(value);
                            }
                            //解决普通输入项的数据的中文乱码问题
                            
                            //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                            System.out.println(name + "=" + value);
                        }else{//如果fileitem中封装的是上传文件
                            //得到上传的文件名称，
                            String filename = item.getName();
                            System.out.println(filename);
                            if(filename==null || filename.trim().equals("")){
                                continue;
                            }
                            //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                            //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                            filename = filename.substring(filename.lastIndexOf("\\")+1);
                            //得到上传文件的扩展名
                            String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
                            //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
                            System.out.println("上传的文件的扩展名是："+fileExtName);
                            //获取item中的上传文件的输入流
                            InputStream in = item.getInputStream();
                            //关闭输入流
                            in.close();
                            //关闭输出流

                            message = "文件上传成功！";
                            baby.setPicture(message);
                        }
                    }
                }catch (FileUploadBase.FileSizeLimitExceededException e) {
                    e.printStackTrace();
                    message="单个文件超出最大值！！！";
                }catch (FileUploadBase.SizeLimitExceededException e) {
                    e.printStackTrace();
                    message="上传文件的总的大小超出限制的最大值！！！";
                }catch (Exception e) {
                    message= "文件上传失败！";
                    e.printStackTrace();
                }
                return baby; 
    }
    
    /**
    * @Method: makeFileName
    * @Description: 生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称
    * @Anthor:孤傲苍狼
    * @param filename 文件的原始名称
    * @return uuid+"_"+文件的原始名称
    */ 
    private String makeFileName(String filename){  //2.jpg
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        return UUID.randomUUID().toString() + "_" + filename;
    }
    
    /**
     * 为防止一个目录下面出现太多文件，要使用hash算法打散存储
    * @Method: makePath
    * @Description: 
    * @Anthor:孤傲苍狼
    *
    * @param filename 文件名，要根据文件名生成存储目录
    * @param savePath 文件存储路径
    * @return 新的存储目录
    */ 
    private String makePath(String filename,String savePath){
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        int hashcode = filename.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //构造新的保存目录
        String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
        //File既可以代表文件也可以代表目录
        File file = new File(dir);
        //如果目录不存在
        if(!file.exists()){
            //创建目录
            file.mkdirs();
        }
        return dir;
    }

}