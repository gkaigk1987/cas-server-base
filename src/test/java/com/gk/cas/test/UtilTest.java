package com.gk.cas.test;

import org.apache.shiro.crypto.hash.ConfigurableHashService;
import org.apache.shiro.crypto.hash.DefaultHashService;
import org.apache.shiro.crypto.hash.HashRequest;
import org.apereo.cas.util.crypto.DefaultPasswordEncoder;
import org.junit.Test;

import com.gk.cas.util.MD5Util;

public class UtilTest {
	
	@Test
	public void testPassword() {
		String encryptCode = MD5Util.encryptCode("123456", "8d78869f470951332959580424d4bf4f");
		System.out.println(encryptCode);	//4e590c849a4dbaed111d88ff8e027695
	}

	@Test
	public void testDefalutPassword() {
		DefaultPasswordEncoder passwordEncoder = new DefaultPasswordEncoder("MD5","UTF-8");
		String encode = passwordEncoder.encode("123456");
		System.out.println("加密后的密文：" + encode);
	}

	@Test
	public void testShiroDefaultHashService() {
		ConfigurableHashService hashService = new DefaultHashService();
		hashService.setHashAlgorithmName("MD5");
		hashService.setHashIterations(1);
		HashRequest hashRequest = new HashRequest.Builder().setSalt("8d78869f470951332959580424d4bf4f")
				.setSource("123456")
				.build();
		String password = hashService.computeHash(hashRequest).toHex();
		System.out.println(password);	//4e590c849a4dbaed111d88ff8e027695
	}

}
