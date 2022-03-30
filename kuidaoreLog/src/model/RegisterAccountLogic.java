package model;

import dao.AccountDAO;

public class RegisterAccountLogic {/*⑳*/
	public boolean execute (Account registerAccount) {/*㉒*/
		AccountDAO dao = new AccountDAO(); //DAO呼び出し /*㉓*/
		boolean registed = dao.findByCheck(registerAccount); ///*㉕（右辺が実行）㉗（左辺に代入）*/ 入力されたアカウントが既にあるかを確認
		if (!registed) {
			dao.create(registerAccount); //アカウントが登録されていないので、INSERTする
			return true;
		} else {
			return false; //アカウント登録済み

		}
	}

}
