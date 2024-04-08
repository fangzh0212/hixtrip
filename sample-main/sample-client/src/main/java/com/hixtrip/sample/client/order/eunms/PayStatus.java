package com.hixtrip.sample.client.order.eunms;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 支付状态枚举
 */
@AllArgsConstructor
@Getter
public enum PayStatus {

    SUCCESS("1", "支付成功"),
    FAILED("2", "支付失败"),
    REPEATED("3", "重复支付")
    ;

    private final String code;
    private final String desc;

}

