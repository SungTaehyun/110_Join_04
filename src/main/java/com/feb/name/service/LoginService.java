package com.feb.name.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import com.feb.name.dao.LoginDao;
import com.feb.name.util.Member;
import com.feb.name.util.Sha512Encoder;

@Service
public class LoginService {

	@Autowired
	private LoginDao logindao;

	public boolean login(HashMap<String, String> params) {//HashMap은 사용자가 입력한 회원 아이디와 비밀번호를 포함하고 있다.
		String memberId = params.get("memberId");//HashMap에서 "memberId"라는 키를 얻어와서 사용자가 입력한 회원 아이디를 가져옴.
		Member member = logindao.login(memberId);//DAO인 loginDao객체의 login메서드를 호출하여  이를 통해 회원 정보를 데이터베이스에서 가져옴.

		if (ObjectUtils.isEmpty(member)) {// 만약 member객체가 비어 있다면
			System.out.println("member99999999999999999 : " + member);
			// member99999999999999999가 콘솔에 안나오는건 객체가 비어있지 않다는 뜻.(즉, 회원정보가 있다)
			
			return false; // 회원 정보가 비어있으면 false를 반환(회원정보가 없으니 돌려보낸다.)
		}
		
		// 2. 비밀번호 비교
				String passwd = params.get("passwd"); // 사용자가 입력한 비밀번호
				String memberPw = member.getPasswd(); // DB에 저장되어 있는 암호화 된 비밀번호 
				Sha512Encoder encoder = Sha512Encoder.getInstance();
				
				String encodeTxt = encoder.getSecurePassword(passwd); // 사용자가 입력한 값을 암호화한 거다 
				System.out.println("memberPw333333333 : " + memberPw);
				System.out.println("encodeTxt88888888888888888888 : " + encodeTxt);
						
				return StringUtils.pathEquals(memberPw, encodeTxt); // 비교해서 틀리면 false반환
			}
		}



