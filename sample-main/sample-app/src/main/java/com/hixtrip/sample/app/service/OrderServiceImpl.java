package com.hixtrip.sample.app.service;

import com.hixtrip.sample.app.api.OrderService;
import com.hixtrip.sample.app.convertor.OrderConvertor;
import com.hixtrip.sample.client.order.dto.CommandOderCreateDTO;
import com.hixtrip.sample.client.order.dto.CommandPayDTO;
import com.hixtrip.sample.client.order.vo.OrderVO;
import com.hixtrip.sample.domain.commodity.CommodityDomainService;
import com.hixtrip.sample.domain.inventory.InventoryDomainService;
import com.hixtrip.sample.domain.order.model.Order;
import com.hixtrip.sample.domain.order.repository.OrderRepository;
import com.hixtrip.sample.domain.pay.PayDomainService;
import com.hixtrip.sample.domain.pay.model.CommandPay;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Objects;

/**
 * app层负责处理request请求，调用领域服务
 */
@Component
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private CommodityDomainService commodityDomainService;
    @Autowired
    private InventoryDomainService inventoryDomainService;
    @Autowired
    private PayDomainService payDomainService;
    @Autowired
    private PayCallbackService payCallbackService;

    @Override
    @Transactional
    public OrderVO createOrder(CommandOderCreateDTO createDTO) {
        Order order = OrderConvertor.INSTANCE.dtoToDomain(createDTO);

        // 判断库存是否充足
        Integer inventory = inventoryDomainService.getInventory(order.getSkuId());
        if (Objects.isNull(inventory) || inventory < order.getAmount()) {
            throw new RuntimeException("库存不足");
        }
        // 扣减库存
        inventoryDomainService.changeInventory(order.getSkuId(), Long.valueOf(inventory), Long.valueOf(order.getAmount()), Long.valueOf(order.getAmount()));

        // 创建订单
        BigDecimal skuPrice = commodityDomainService.getSkuPrice(order.getSkuId());
        order.order(skuPrice);
        orderRepository.save(order);

        return OrderConvertor.INSTANCE.domainToVO(order);
    }

    @Override
    public void payCallback(CommandPayDTO commandPayDTO) {
        CommandPay commandPay = OrderConvertor.INSTANCE.dtoToDomain(commandPayDTO);
        payDomainService.payRecord(commandPay);
        // 处理支付回调结果
        payCallbackService.handleCallback(commandPay);
    }
}
