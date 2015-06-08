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
 * 图片压缩处理
 * @author 崔素强
 */
public class ImgCompress {
	private Image img;
	private int width;
	private int height;
	private String imgFormat;
	/**
	 * 构造函数
	 */
	public ImgCompress(InputStream inputStream,String imgFormat) throws IOException {
		img = ImageIO.read(inputStream);      // 构造Image对象
		width = img.getWidth(null);    // 得到源图宽
		height = img.getHeight(null);  // 得到源图长
		this.imgFormat = imgFormat;
	}
	/**
	 * 按照宽度还是高度进行压缩
	 * @param w int 最大宽度
	 * @param h int 最大高度
	 */
	public byte[] resizeFix(int w, int h) throws IOException {
		if (width / height > w / h) {
			return resizeByWidth(w);
		} else {
			return resizeByHeight(h);
		}
	}
	/**
	 * 以宽度为基准，等比例放缩图片
	 * @param w int 新宽度
	 */
	public byte[] resizeByWidth(int w) throws IOException {
		int h = (int) (height * w / width);		
		return resize(w, h);
	}
	/**
	 * 以高度为基准，等比例缩放图片
	 * @param h int 新高度
	 */
	public byte[] resizeByHeight(int h) throws IOException {
		int w = (int) (width * h / height);
		return resize(w, h);
	}
	/**
	 * 强制压缩/放大图片到固定的大小
	 * @param w int 新宽度
	 * @param h int 新高度
	 */
	public byte[] resize(int w, int h) throws IOException {
		// SCALE_SMOOTH 的缩略算法 生成缩略图片的平滑度的 优先级比速度高 生成的图片质量比较好 但速度慢
		BufferedImage image = new BufferedImage(w, h,BufferedImage.TYPE_INT_RGB ); 
		image.getGraphics().drawImage(img, 0, 0, w, h, null); // 绘制缩小后的图
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ImageIO.write(image, imgFormat, out);		
		return out.toByteArray();
	}
	/**
	* 转换Image数据为byte数组
	* @param image
	* Image对象
	* @param format
	* image格式字符串.如"gif","png"
	我想取得byte[]数组是没有什么意义的．当然不是不可以实现．用ImageIO类． 
	return image;
	* @return byte数组
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