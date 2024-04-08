package com.hixtrip.sample.app.service;

import com.hixtrip.sample.app.handler.PayCallbackHandler;
import com.hixtrip.sample.domain.pay.model.CommandPay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class PayCallbackService {

    private final Map<String, PayCallbackHandler> handlerMap = new ConcurrentHashMap<>();

    @Autowired
    private ApplicationContext applicationContext;

    @PostConstruct
    public void init() {
        Map<String, PayCallbackHandler> beansOfType = applicationContext.getBeansOfType(PayCallbackHandler.class);
        beansOfType.forEach((key, value) -> handlerMap.put(value.getType(), value));
    }

    public void handleCallback(CommandPay commandPay) {
        PayCallbackHandler payCallbackHandler = handlerMap.get(commandPay.getPayStatus());
        payCallbackHandler.handle(commandPay.getOrderId());
    }

}
