package com.gk.cas.test;

import org.junit.Test;

import com.gk.cas.util.MD5Util;

public class UtilTest {
	
	@Test
	public void testPassword() {
		String encryptCode = MD5Util.encryptCode("123456", "8d78869f470951332959580424d4bf4f");
		System.out.println(encryptCode);
	}

}
