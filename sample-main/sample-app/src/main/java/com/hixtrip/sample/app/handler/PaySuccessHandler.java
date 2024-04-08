package com.hixtrip.sample.app.handler;

import com.hixtrip.sample.client.order.eunms.PayStatus;
import org.springframework.stereotype.Component;

@Component
public class PaySuccessHandler implements PayCallbackHandler {
    @Override
    public void handle(String orderId) {
        // 处理支付成功
    }

    @Override
    public String getType() {
        return PayStatus.SUCCESS.getCode();
    }
}
