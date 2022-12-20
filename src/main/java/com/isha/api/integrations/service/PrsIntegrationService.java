package com.isha.integrations.service;

import com.isha.integrations.payload.test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrsIntegrationService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<test> getPrsData(int programId){
       return  jdbcTemplate.query("select * from partprogram where pgmId=?", BeanPropertyRowMapper.newInstance(test.class),programId);
    }
}
