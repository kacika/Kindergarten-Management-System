package com.bskms.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.bskms.bean.ClaTea;
import com.bskms.bean.Course;

import com.bskms.mapper.CourseMapper;
import com.bskms.model.MMGridPageVoBean;
import com.bskms.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	CourseMapper courseMapper;
	
	private final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	@Override
	public List<Course> getAllCourse() {
		return courseMapper.getAllCourse();
	}
	@Override
	public Course selectByPrimaryKey(Integer id) {
		
		return courseMapper.selectByPrimaryKey(id);
	}
	@Override
	public Object getAllCourseByLimit(Course course) {
		int size = 0;

		Integer begin = (course.getPage() - 1) * course.getLimit();
		course.setPage(begin);

		List<ClaTea> rows = new ArrayList<>();
		try {
			rows = courseMapper.getAllCourseByLimit(course);
			size = courseMapper.getAllCourseByLimitCout(course);
		} catch (Exception e) {
			e.printStackTrace();
		}
		MMGridPageVoBean<ClaTea> vo = new MMGridPageVoBean<>();
		vo.setTotal(size);
		vo.setRows(rows);

		return vo;
	}

	@Override
	public void addCourse(Course course) {
		try {
			courseMapper.insert(course);
		}catch (Exception e) {
			e.printStackTrace();
	}
		
	}

	@Override
	public void delCourse(Integer id) {
		courseMapper.deleteByPrimaryKey(id);
	}
	@Override
	public String updateCourse(Course course) {
		try {
			courseMapper.updateByPrimaryKeySelective(course);
			return "SUCCESS";
		} catch (Exception e) {
			logger.error("根据课程id更新课程异常", e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "ERR";
		}
	}
	
}
