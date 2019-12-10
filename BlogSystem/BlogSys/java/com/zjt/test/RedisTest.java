package com.zjt.test;

import redis.clients.jedis.Jedis;

public class RedisTest {
    public static void main(String[] args) {
        Jedis jedis = new Jedis("127.0.0.1",6380);
        System.out.println(        jedis.get("name")
        );
        String ping = jedis.ping();
        System.out.println(ping);
    }
}
