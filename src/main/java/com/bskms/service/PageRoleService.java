/*
 * All rights Reserved, Copyright (C) Aisino LIMITED 2019
 * FileName: PageRoleService.java
 * Version:  1.0
 * Modify record:
 * NO. |     Date       |    Name        |      Content
 * 1   | 2019年1月29日        | Aisino)Jack    | original version
 */
package com.bskms.service;

/**
 * class name: PageRoleService <BR>
 * class description: please write your description <BR>
 * 

 */
public interface PageRoleService {

	boolean delPageRoleByRoleId(Integer id);

	boolean addPageRoles(Integer roleId, Integer[] pageIds);

}
