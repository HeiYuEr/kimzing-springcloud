package com.kimzing.user.domain.user;

import com.kimzing.order.domain.OrderBO;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * 用户及其订单的视图对象.
 *
 * @author KimZing - kimzing@163.com
 * @since 2020/7/4 12:57
 */
@Data
@Accessors(chain = true)
public class UserOrderVO {

    /**
     * 用户信息
     */
    private UserBO userInfo;

    /**
     * 订单列表
     */
    private List<OrderBO> orderList;

}