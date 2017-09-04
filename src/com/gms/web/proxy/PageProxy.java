package com.gms.web.proxy;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import lombok.Getter;
import lombok.Setter;


public class PageProxy extends proxy{
	@Getter @Setter protected int
	pageSize, blockSize, theNumberOfRows, pageNumber;
	
	public PageProxy(HttpServletRequest request){
		super(request);
	}
	
	public void execute(int[] arr, List<?> list) {
		super.getRequest().setAttribute("pageNumber", arr[0]);
		super.getRequest().setAttribute("theNumberOfPages", arr[1]);
		super.getRequest().setAttribute("startPage", arr[2]);
		super.getRequest().setAttribute("endPage", arr[3]);
		super.getRequest().setAttribute("prevBlock", arr[4]);
		super.getRequest().setAttribute("nextBlock", arr[5]);
		super.getRequest().setAttribute("list", list);
		
		System.out.println("pageno:"+pageNumber);
	}	

}
