package com.gk.cas.util;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;

public class MD5Util {

	public static final String algorithmName = "md5";

	/**
	 * 给定盐值进行加密
	 * @param password
	 * @param salt
	 * @return
	 */
	public static String encryptCode(String password,String salt) {
		SimpleHash simpleHash = new SimpleHash(algorithmName, password, salt, 1);
		return simpleHash.toHex();
	}
	
	/**
	 * 给定盐值进行加密,并进行times次加密
	 * @param password
	 * @param salt
	 * @return
	 */
	public static String encryptCode(String password,String salt,int times) {
		SimpleHash simpleHash = new SimpleHash(algorithmName, password, salt, times);
		return simpleHash.toHex();
	}
	
	/**
	 * 生成盐值加密
	 * @param password
	 * @return
	 */
	public static String encryptCode(String password) {
		String salt = new SecureRandomNumberGenerator().nextBytes().toHex();
		SimpleHash simpleHash = new SimpleHash(algorithmName, password, salt, 1);
		return simpleHash.toHex();
	}
	
	/**
	 * 生成盐值加密，并加密times次
	 * @param password
	 * @param times
	 * @return
	 */
	public static String encryptCode(String password,int times) {
		String salt = new SecureRandomNumberGenerator().nextBytes().toHex();
		SimpleHash simpleHash = new SimpleHash(algorithmName, password, salt, times);
		return simpleHash.toHex();
	}

}
