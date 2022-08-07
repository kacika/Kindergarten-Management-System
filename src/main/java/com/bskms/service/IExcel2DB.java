/*

 * FileName: ImportExcel.java
 * Version:  $Revision$
 * Modify record:

 */
package com.bskms.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * class name:ImportExcel <BR>
 * class 从Excel导入到数据库<BR>
 * Remark: <BR>
 * 

 */
public interface IExcel2DB {
	public String importUserExcel2DB(MultipartFile file);
	
}
