package com.isha.api.integrations.service;

import com.isha.api.integrations.common.IntegrationSQLLoader;
import com.isha.api.integrations.payload.IECOPayload;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PrsIntegrationService {

    private JdbcTemplate jdbcTemplate;

    private IntegrationSQLLoader integrationSQLLoader;

    private static final String QUERY_NAME = "getProgramParticipants";

    public  PrsIntegrationService(JdbcTemplate jdbcTemplate, IntegrationSQLLoader integrationSQLLoader) {
        this.jdbcTemplate = jdbcTemplate;
        this.integrationSQLLoader = integrationSQLLoader;
    }

    public List<IECOPayload> getPrsData(int prgmId) {
        String sql = integrationSQLLoader.getSqlNodes().get(QUERY_NAME).asText();
       return  jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(IECOPayload.class),prgmId);
    }
}
