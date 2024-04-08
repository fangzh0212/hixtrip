package com.hixtrip.sample.app.handler;

import com.hixtrip.sample.client.order.eunms.PayStatus;
import org.springframework.stereotype.Component;

@Component
public class PayRepeatHandler implements PayCallbackHandler {
    @Override
    public void handle(String orderId) {
        // 处理重复支付
    }

    @Override
    public String getType() {
        return PayStatus.REPEATED.getCode();
    }
}
