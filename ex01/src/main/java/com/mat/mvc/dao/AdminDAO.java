package com.mat.mvc.dao;

import java.util.*;
import com.mat.mvc.vo.*;

public interface AdminDAO {
	
	// 카테고리
	public List<CategoryVO> category() throws Exception;

}
