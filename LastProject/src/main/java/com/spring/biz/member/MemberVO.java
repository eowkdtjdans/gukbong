package com.spring.biz.member;

import java.sql.Date;

public class MemberVO {
	    // 아이디 
	    private String m_id;
	    // 비밀번호 
	    private String m_pwd;
	    // 이름 
	    private String m_name;
	    // 전화번호 
	    private String m_phone;
	    // 성별 
	    private String m_gender;
	    // 생일 
	    private String m_birthday;
	    // 주소 
	    private double lat;
	    
	    private String m_certify;
	 

		public String getM_certify() {
			return m_certify;
		}

		public void setM_certify(String m_certify) {
			this.m_certify = m_certify;
		}

		private double lng;
	    private String m_address;
	    // 가입일 
	    private Date m_regdate;

		public String getM_id() {
			return m_id;
		}

		public String setM_id(String m_id) {
			return this.m_id = m_id;
		}

		public String getM_pwd() {
			return m_pwd;
		}

		public void setM_pwd(String m_pwd) {
			this.m_pwd = m_pwd;
		}

		public String getM_name() {
			return m_name;
		}

		public void setM_name(String m_name) {
			this.m_name = m_name;
		}

		public String getM_phone() {
			return m_phone;
		}

		public void setM_phone(String m_phone) {
			this.m_phone = m_phone;
		}

		public String getM_gender() {
			return m_gender;
		}

		public void setM_gender(String m_gender) {
			this.m_gender = m_gender;
		}

		public String getM_birthday() {
			return m_birthday;
		}

		public void setM_birthday(String m_birthday) {
			this.m_birthday = m_birthday;
		}


		public Date getM_regdate() {
			return m_regdate;
		}

		public void setM_regdate(Date m_regdate) {
			this.m_regdate = m_regdate;
		}

		public double getLat() {
			return lat;
		}

		public void setLat(double lat) {
			this.lat = lat;
		}

		public double getLng() {
			return lng;
		}

		public void setLng(double lng) {
			this.lng = lng;
		}

		public String getM_address() {
			return m_address;
		}

		public void setM_address(String m_address) {
			this.m_address = m_address;
		}

		@Override
		public String toString() {
			return "MemberVO [m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_name=" + m_name + ", m_phone=" + m_phone
					+ ", m_gender=" + m_gender + ", m_birthday=" + m_birthday + ", lat=" + lat + ", m_certify="
					+ m_certify + ", lng=" + lng + ", m_address=" + m_address + ", m_regdate=" + m_regdate + "]";
		}


	
		
	    
	
	    
	    
		
	    
	  
	
	
}
