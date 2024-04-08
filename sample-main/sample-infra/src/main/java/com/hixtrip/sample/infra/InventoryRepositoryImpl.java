package com.hixtrip.sample.infra;

import com.hixtrip.sample.domain.inventory.model.Inventory;
import com.hixtrip.sample.domain.inventory.repository.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Objects;

/**
 * infra层是domain定义的接口具体的实现
 */
@Component
public class InventoryRepositoryImpl implements InventoryRepository {

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Override
    public Inventory getInventoryBySkuId(String skuId) {
        return (Inventory)redisTemplate.opsForValue().get(formatKey(skuId));
    }

    @Override
    public Boolean changeInventory(String skuId, Long amount) {
        String key = formatKey(skuId);
        Long decrement = redisTemplate.opsForValue().decrement(key, amount);
        if (Objects.nonNull(decrement) && decrement >= 0) {
            // 扣减成功
            return true;
        } else {
            // 库存不足，恢复库存
            redisTemplate.opsForValue().increment(key, amount);
            // 扣减失败
            return false;
        }
    }

    private String formatKey(String skuId) {
        return "inventory:" + skuId;
    }
}
