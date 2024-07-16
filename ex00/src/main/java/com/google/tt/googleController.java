package com.google.tt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class googleController {

    @PostMapping("/pro/VerifyRecaptcha")
    @ResponseBody
    public Map<String, Object> VerifyRecaptcha(HttpServletRequest request, @RequestBody Map<String, String> requestBody) {
        String gRecaptchaResponse = requestBody.get("g-recaptcha-response");
        String clientIP = request.getRemoteAddr();
        boolean isSuccess = false;

        // 클라이언트에서 받은 reCAPTCHA 응답이 null이 아니고 비어 있지 않은 경우에만 검증
        if (gRecaptchaResponse != null && !gRecaptchaResponse.isEmpty()) {
            try {
                isSuccess = VerifyRecaptcha.verify(gRecaptchaResponse, clientIP);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Map<String, Object> response = new HashMap<>();
        response.put("success", isSuccess);
        return response;
    }
}
