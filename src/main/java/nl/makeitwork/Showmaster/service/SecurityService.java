package nl.makeitwork.Showmaster.service;

/**
 * @author Gert Postma
 */

public interface SecurityService {
    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
