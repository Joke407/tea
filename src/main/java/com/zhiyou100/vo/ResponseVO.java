package com.zhiyou100.vo;

public class ResponseVO<T> {
	
	private int errorCode;
	
	
	private String message;
	
	private T data;

	public ResponseVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResponseVO(int errorCode, String message, T data) {
		super();
		this.errorCode = errorCode;
		this.message = message;
		this.data = data;
	}

	@Override
	public String toString() {
		return "ResponseVO [errorCode=" + errorCode + ", message=" + message + ", data=" + data + "]";
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	
	
}
