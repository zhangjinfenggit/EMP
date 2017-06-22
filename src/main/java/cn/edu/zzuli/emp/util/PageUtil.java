package cn.edu.zzuli.emp.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 分页工具类
 * 
 * @author zhangjinfeng
 * @date May 17, 2017 5:23:07 PM TODO
 */
public class PageUtil implements Serializable {

	private int currPage = 1;// 当前页 ******** 一般必须设置

	private int pageCount = 0;// 总页数

	private int dataCount = 0; // 数据总条数

	private int currPageIndex; // 当前页的索引
	// 从第几条数据开始限制 例如 limit currPageIndex ,pageSize;currPageIndex就是查询的起点

	private int pageSize = 20;// 每页显示多少条

	private List<Integer> eachPage; // 显示导航栏

	private int indexSize = 10; // 显示导航栏索引的数量

	private boolean hasPrePage; // 是否还有上一页

	private boolean hasNextPage; // 是否拥有下一页

	public int getCurrPageIndex() {

		currPageIndex = (currPage - 1) * pageSize;

		return currPageIndex;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public List<Integer> getEachPage() {

		eachPage = new ArrayList<Integer>();

		if (indexSize <= pageCount && currPage <= indexSize / 2) {

			for (int i = 1; i <= indexSize; i++) {

				eachPage.add(i);
			}

		} else if (pageCount - indexSize > 0 && currPage + indexSize > pageCount) {

			for (int i = pageCount - indexSize + 1; i <= pageCount; i++) {

				eachPage.add(i);

			}

		} else {

			for (int i = indexSize / 2; i > 0; i--) {
				if (currPage - i >= 1) {
					eachPage.add(currPage - i);
				}
			}

			eachPage.add(currPage);

			for (int i = 1; i <= indexSize / 2; i++) {
				if (currPage + i <= pageCount) {

					eachPage.add(currPage + i);
				}

			}

			if (indexSize % 2 == 0 && indexSize < pageCount) {

				eachPage.remove(0);
			}

		}

		return eachPage;
	}

	public boolean getHasPrePage() {

		if (currPage <= 1) {

			return false;
		}
		return true;
	}

	public boolean getHasNextPage() {

		if (currPage >= pageCount) {

			return false;
		}

		return true;
	}

	public int getPageCount() {
		if (pageCount < 1) {
			pageCount = 1;
		}
		return pageCount;
	}

	public void setDataCount(int dataCount) {

		if (dataCount % pageSize == 0) {
			this.pageCount = dataCount / pageSize;
		} else {
			this.pageCount = dataCount / pageSize + 1;
		}

		this.dataCount = dataCount;
	}

	public int getIndexSize() {
		return indexSize;
	}

	public void setIndexSize(int indexSize) {
		this.indexSize = indexSize;
	}

	public static void main(String[] args) {

		PageUtil page = new PageUtil();

		page.setIndexSize(46);
		List<Integer> each = page.getEachPage();

		for (Integer integer : each) {

			System.out.print(integer + " ");
		}

		System.out.println();

		System.out.println("pre = " + page.getHasPrePage());
		System.out.println("next = " + page.getHasNextPage());

	}
}
