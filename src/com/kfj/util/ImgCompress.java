package com.kfj.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
/**
 * ͼƬѹ������
 * @author ����ǿ
 */
public class ImgCompress {
	private Image img;
	private int width;
	private int height;
	private String imgFormat;
	/**
	 * ���캯��
	 */
	public ImgCompress(InputStream inputStream,String imgFormat) throws IOException {
		img = ImageIO.read(inputStream);      // ����Image����
		width = img.getWidth(null);    // �õ�Դͼ��
		height = img.getHeight(null);  // �õ�Դͼ��
		this.imgFormat = imgFormat;
	}
	/**
	 * ���տ�Ȼ��Ǹ߶Ƚ���ѹ��
	 * @param w int �����
	 * @param h int ���߶�
	 */
	public byte[] resizeFix(int w, int h) throws IOException {
		if (width / height > w / h) {
			return resizeByWidth(w);
		} else {
			return resizeByHeight(h);
		}
	}
	/**
	 * �Կ��Ϊ��׼���ȱ�������ͼƬ
	 * @param w int �¿��
	 */
	public byte[] resizeByWidth(int w) throws IOException {
		int h = (int) (height * w / width);		
		return resize(w, h);
	}
	/**
	 * �Ը߶�Ϊ��׼���ȱ�������ͼƬ
	 * @param h int �¸߶�
	 */
	public byte[] resizeByHeight(int h) throws IOException {
		int w = (int) (width * h / height);
		return resize(w, h);
	}
	/**
	 * ǿ��ѹ��/�Ŵ�ͼƬ���̶��Ĵ�С
	 * @param w int �¿��
	 * @param h int �¸߶�
	 */
	public byte[] resize(int w, int h) throws IOException {
		// SCALE_SMOOTH �������㷨 ��������ͼƬ��ƽ���ȵ� ���ȼ����ٶȸ� ���ɵ�ͼƬ�����ȽϺ� ���ٶ���
		BufferedImage image = new BufferedImage(w, h,BufferedImage.TYPE_INT_RGB ); 
		image.getGraphics().drawImage(img, 0, 0, w, h, null); // ������С���ͼ
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ImageIO.write(image, imgFormat, out);		
		return out.toByteArray();
	}
	/**
	* ת��Image����Ϊbyte����
	* @param image
	* Image����
	* @param format
	* image��ʽ�ַ���.��"gif","png"
	����ȡ��byte[]������û��ʲô����ģ���Ȼ���ǲ�����ʵ�֣���ImageIO�࣮ 
	return image;
	* @return byte����
	*/
	public static byte[] imageToBytes(BufferedImage bImage, String format) {
		Graphics bg = bImage.getGraphics();
		//bg.drawImage(image, 0, 0, null);
		//bg.dispose();
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		try {
		ImageIO.write(bImage, format, out);
		} catch (IOException e) {
		e.printStackTrace();
		}
		return out.toByteArray();
	}
}