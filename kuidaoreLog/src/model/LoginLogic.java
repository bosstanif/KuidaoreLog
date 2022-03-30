package model;

import dao.AccountDAO;

public class LoginLogic {/* ⑨ */
	public Account execute(Account account) {
		AccountDAO dao = new AccountDAO();
		account = dao.findByLogin(account);
		return account;

	}

}
