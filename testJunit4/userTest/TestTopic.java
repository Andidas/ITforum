package userTest;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;

import service.TopicService;

public class TestTopic {

	@Test
	public void test() {
		TopicService ts = new TopicService();
		ts.addTopic("JAVA", "刘伟艺", "我是谁？", "aha,我是大哥");
	}
	@Test
	public void testTransform(){
		String Testcontent = "<p>请问<img style='width: 25%;' src='files/classic1.gif' data-filename='image name'></p><p>阿斯顿<img style='width: 25%;' src='files/text1.png' data-filename='image name'><img style='width: 30px;' src='files/iconx2-000000.png' data-filename='image name'>阿斯顿</p>";
		String reg = "<img.*'>";
		
		System.out.println(Testcontent.replaceAll(reg, ""));
		
//		String imgInit = Testcontent.substring(Testcontent.indexOf("<img src="));
//		
//		String img = imgInit.substring(0,imgInit.indexOf(">")+1);
//		System.out.println(img);
		
		
	}
	@Test
	public void RegexMatches()
	{
		
		String INPUT = "<p>请问<img style='width: 25%;' src='files/classic_1.gif' data-filename='image name'></p><p>阿斯顿<img src='files/a2aef601b6cc4f017f21cc429e745548a.jpg' data-filename='image name'><img style='width: 30px;' src='files/iconx2-000000.png' data-filename='image name'>阿斯顿</p>";
		
	      String REGEX = "src=\\'\\S*\\'";
	 
	       Pattern p = Pattern.compile(REGEX);
	       Matcher m = p.matcher(INPUT); // 获取 matcher 对象
	       int count = 0;
	 
	       while(m.find()) {
	         count++;
	         System.out.println("Match number "+count);
	         System.out.println("start(): "+m.start());
	         System.out.println("end(): "+m.end());
	         System.out.println(INPUT.substring(m.start(),m.end()+1));
	       }
	       
	       
	       //style='width: 50%; float: right;'
	      String newContentInit = INPUT.replaceAll("style=\\'width: [\\d+%|];\\'", "").replaceAll("style=\\'width: 30px;\\'", "");
	       String newContent = newContentInit.replaceAll(REGEX, "style='display: none;'");
	       System.out.println("_________________新内容___________________");
	       System.out.println(newContent);
	}
}
