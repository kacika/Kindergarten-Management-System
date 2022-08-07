package com.bskms.service;

import java.util.List;

import com.bskms.bean.Course;
import com.bskms.bean.Pay;

public interface CourseService {
	
	public List<Course> getAllCourse();
	Course selectByPrimaryKey(Integer id);
	public Object getAllCourseByLimit(Course course);
	public void addCourse(Course course);
	public void delCourse(Integer id);
	String updateCourse(Course course);
}
