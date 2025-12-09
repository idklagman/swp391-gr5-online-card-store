// src/java/utils/PasswordUtil.java
package utils;
import java.security.MessageDigest;
public class PasswordUtil {
    public static String sha256(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] b = md.digest(input.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for (byte x: b) sb.append(String.format("%02x", x));
            return sb.toString();
        } catch (Exception e) { throw new RuntimeException(e); }
    }
    public static boolean matches(String plain, String storedHash) {
        if (plain == null || storedHash == null) return false;
        return sha256(plain).equalsIgnoreCase(storedHash);
    }
}