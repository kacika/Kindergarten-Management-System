/**
 * 
 */
package com.bskms.service;

import java.util.List;

import com.bskms.bean.UserChildren;

/**
 * @author samsung
 *
 */
public interface UserChildrenService {

	void addUserChildren(UserChildren userChildern);

	UserChildren selectByPrimaryKey(Integer id);

	List<UserChildren> selectAllJiazhang();

	UserChildren selectById(Integer id);

	UserChildren selectByUCId(String string); // 根据家长id查询家长幼儿信息表

	void updateUC(UserChildren uc);

//	void delByUCId(Integer childrenId);

	String delUserChildrenById(Integer id);

}
