package sensitivewdfilter.test;

import com.sensitivewdfilter.SensitivewordFilter;
import com.sensitivewdfilter.WordFilter;
import org.junit.Test;

import java.text.NumberFormat;
import java.util.Set;

/**
 * 创建时间：2016年8月30日 下午5:12:40
 * 
 * @author andy
 * @version 2.2
 */

public class TestSensitiveWdFilter {

	@Test
	public void TestFilter() {
		String s = "你是逗比吗？ｆｕｃｋ！fUcK,你竟然用法轮功，法@!轮!%%%功";
		System.out.println("解析问题： " + s);
		System.out.println("解析字数 : " + s.length());
		String re;
		long nano = System.nanoTime();
		re = WordFilter.doFilter(s);
		nano = (System.nanoTime() - nano);
		System.out.println("解析时间 : " + nano + "ns");
		System.out.println("解析时间 : " + nano / 1000000 + "ms");
		System.out.println(re);
		System.out.println();

		nano = System.nanoTime();
		System.out.println("是否包含敏感词： " + WordFilter.isContains(s));
		nano = (System.nanoTime() - nano);
		System.out.println("解析时间 : " + nano + "ns");
		System.out.println("解析时间 : " + nano / 1000000 + "ms");
	}

    @Test
    public void cal() {
        int diliverNum=1;//举例子的变量
        int queryMailNum=112;//举例子的变量
        // 创建一个数值格式化对象
        NumberFormat numberFormat = NumberFormat.getInstance();
        // 设置精确到小数点后2位
        numberFormat.setMaximumFractionDigits(2);
        String result = numberFormat.format((float)diliverNum/(float)queryMailNum*100);
        System.out.println("diliverNum和queryMailNum的百分比为:" + result + "%");
    }

}
