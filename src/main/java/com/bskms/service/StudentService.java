/**
 * 
 */
package com.bskms.service;

import java.util.List;

import com.bskms.bean.Children;

/**

 *
 */
public interface StudentService {

	Object getAllStudentByLimit(Children stuParameter);

	Children selectByPrimaryKey(Integer id); // 根据id查询幼儿

	void addStudent(Children student);

	String updateStu(Children studnet);

	void delStudentById(Integer parseInt);

	List<Children> selectAllChildren();

}
