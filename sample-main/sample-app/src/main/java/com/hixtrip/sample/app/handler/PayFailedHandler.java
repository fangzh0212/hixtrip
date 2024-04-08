package com.hixtrip.sample.app.handler;

import com.hixtrip.sample.client.order.eunms.PayStatus;
import org.springframework.stereotype.Component;

@Component
public class PayFailedHandler implements PayCallbackHandler {
    @Override
    public void handle(String orderId) {
        // 处理支付失败
    }

    @Override
    public String getType() {
        return PayStatus.FAILED.getCode();
    }
}
