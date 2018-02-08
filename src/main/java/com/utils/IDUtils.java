package com.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 各种id生成策略
 * <p>Title: IDUtils</p>
 */
public class IDUtils {



	public static Integer genIntegerId() {
		//取当前时间的长整形值包含毫秒
		long millis = System.currentTimeMillis();
		SimpleDateFormat formatter = new SimpleDateFormat("MMddHH");
		Date date = new Date(millis);
//		System.out.println(formatter.format(date));
		//加上三位随机数
		Random random = new Random();
		int end3 = random.nextInt(899) + 100;
		//如果不足三位前面补0
		String str = formatter.format(date) + String.valueOf(end3);
		return Integer.valueOf(str);
	}
	public static void main(String[] args) {
		for(int i=0;i< 10;i++)
		System.out.println(genIntegerId());
	}
}
