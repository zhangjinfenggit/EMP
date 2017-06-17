package cn.edu.zzuli.emp.exception;

/**
 * 自定义异常
 * 
 * @author zhangjinfeng
 * @date 2017年6月17日下午4:23:54 TODO
 */
public class CustomExceprion extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CustomExceprion(String message) {
		super(message);
	}
}
