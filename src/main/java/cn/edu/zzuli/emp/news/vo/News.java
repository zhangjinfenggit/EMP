package cn.edu.zzuli.emp.news.vo;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月20日上午8:01:07 TODO
 */
public class News {

	private int id;
	private String title;
	private String time;

	private String content;
	private int type;

	public int getId() {
		return id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

}
