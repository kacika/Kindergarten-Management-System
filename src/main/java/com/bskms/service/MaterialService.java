/**
 * 
 */
package com.bskms.service;

import com.bskms.bean.Material;

/**

 *
 */
public interface MaterialService {

	Object getAllMaterialByLimit(Material materialParameter);

	Material selectByPrimaryKey(Integer id);

	void addMaterial(Material material);

	String updateMaterial(Material material);

	void delMaterialById(Integer parseInt);

}
