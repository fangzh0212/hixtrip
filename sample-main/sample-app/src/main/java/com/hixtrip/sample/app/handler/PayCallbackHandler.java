package com.hixtrip.sample.app.handler;

/**
 * 支付回调结果策略接口
 */
public interface PayCallbackHandler {
    void handle(String orderId);
    String getType();
}
