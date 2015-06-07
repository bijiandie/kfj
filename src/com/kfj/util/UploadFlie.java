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
* @Description: TODO(������һ�仰��������������)
* @author: �°�����
* @date: 2015-1-3 ����11:35:50
*
*/ 
public class UploadFlie extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public  Baby upload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                //��Ϣ��ʾ
                String message = "";
                Baby baby = new Baby();
                try{
                    //ʹ��Apache�ļ��ϴ���������ļ��ϴ����裺
                    //1������һ��DiskFileItemFactory����
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    //���ù����Ļ������Ĵ�С�����ϴ����ļ���С�����������Ĵ�Сʱ���ͻ�����һ����ʱ�ļ���ŵ�ָ������ʱĿ¼���С�
                    factory.setSizeThreshold(1024*10240);//���û������Ĵ�СΪ100KB�������ָ������ô�������Ĵ�СĬ����10KB
                    //�����ϴ�ʱ���ɵ���ʱ�ļ��ı���Ŀ¼
                    //2������һ���ļ��ϴ�������
                    ServletFileUpload upload = new ServletFileUpload(factory);
                     //����ϴ��ļ�������������
                    upload.setHeaderEncoding("UTF-8"); 
                    //3���ж��ύ�����������Ƿ����ϴ���������
                    if(!ServletFileUpload.isMultipartContent(request)){
                        //���մ�ͳ��ʽ��ȡ����
                        return null;
                    }
                    
                    //�����ϴ������ļ��Ĵ�С�����ֵ��Ŀǰ������Ϊ1024*1024�ֽڣ�Ҳ����1MB
                    upload.setFileSizeMax(1024*10240);
                    //�����ϴ��ļ����������ֵ�����ֵ=ͬʱ�ϴ��Ķ���ļ��Ĵ�С�����ֵ�ĺͣ�Ŀǰ����Ϊ10MB
                    upload.setSizeMax(1024*1024*10);
                    //4��ʹ��ServletFileUpload�����������ϴ����ݣ�����������ص���һ��List<FileItem>���ϣ�ÿһ��FileItem��Ӧһ��Form����������
                    List<FileItem> list = upload.parseRequest(request);
                    for(FileItem item : list){
                        //���fileitem�з�װ������ͨ�����������
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
                            //�����ͨ����������ݵ�������������
                            
                            //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                            System.out.println(name + "=" + value);
                        }else{//���fileitem�з�װ�����ϴ��ļ�
                            //�õ��ϴ����ļ����ƣ�
                            String filename = item.getName();
                            System.out.println(filename);
                            if(filename==null || filename.trim().equals("")){
                                continue;
                            }
                            //ע�⣺��ͬ��������ύ���ļ����ǲ�һ���ģ���Щ������ύ�������ļ����Ǵ���·���ģ��磺  c:\a\b\1.txt������Щֻ�ǵ������ļ������磺1.txt
                            //�����ȡ�����ϴ��ļ����ļ�����·�����֣�ֻ�����ļ�������
                            filename = filename.substring(filename.lastIndexOf("\\")+1);
                            //�õ��ϴ��ļ�����չ��
                            String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
                            //�����Ҫ�����ϴ����ļ����ͣ���ô����ͨ���ļ�����չ�����ж��ϴ����ļ������Ƿ�Ϸ�
                            System.out.println("�ϴ����ļ�����չ���ǣ�"+fileExtName);
                            //��ȡitem�е��ϴ��ļ���������
                            InputStream in = item.getInputStream();
                            //�ر�������
                            in.close();
                            //�ر������

                            message = "�ļ��ϴ��ɹ���";
                            baby.setPicture(message);
                        }
                    }
                }catch (FileUploadBase.FileSizeLimitExceededException e) {
                    e.printStackTrace();
                    message="�����ļ��������ֵ������";
                }catch (FileUploadBase.SizeLimitExceededException e) {
                    e.printStackTrace();
                    message="�ϴ��ļ����ܵĴ�С�������Ƶ����ֵ������";
                }catch (Exception e) {
                    message= "�ļ��ϴ�ʧ�ܣ�";
                    e.printStackTrace();
                }
                return baby; 
    }
    
    /**
    * @Method: makeFileName
    * @Description: �����ϴ��ļ����ļ������ļ����ԣ�uuid+"_"+�ļ���ԭʼ����
    * @Anthor:�°�����
    * @param filename �ļ���ԭʼ����
    * @return uuid+"_"+�ļ���ԭʼ����
    */ 
    private String makeFileName(String filename){  //2.jpg
        //Ϊ��ֹ�ļ����ǵ���������ҪΪ�ϴ��ļ�����һ��Ψһ���ļ���
        return UUID.randomUUID().toString() + "_" + filename;
    }
    
    /**
     * Ϊ��ֹһ��Ŀ¼�������̫���ļ���Ҫʹ��hash�㷨��ɢ�洢
    * @Method: makePath
    * @Description: 
    * @Anthor:�°�����
    *
    * @param filename �ļ�����Ҫ�����ļ������ɴ洢Ŀ¼
    * @param savePath �ļ��洢·��
    * @return �µĴ洢Ŀ¼
    */ 
    private String makePath(String filename,String savePath){
        //�õ��ļ�����hashCode��ֵ���õ��ľ���filename����ַ����������ڴ��еĵ�ַ
        int hashcode = filename.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //�����µı���Ŀ¼
        String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
        //File�ȿ��Դ����ļ�Ҳ���Դ���Ŀ¼
        File file = new File(dir);
        //���Ŀ¼������
        if(!file.exists()){
            //����Ŀ¼
            file.mkdirs();
        }
        return dir;
    }

}