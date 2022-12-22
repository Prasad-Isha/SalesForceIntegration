package com.isha.api.integrations.service;

import com.isha.api.integrations.common.IntegrationSQLLoader;
import com.isha.api.integrations.models.enums.ParticipantStatusEnum;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class PrsParticipantService {

    private static final String STATUS_UPDATE_QUERY_KEY  = "updateParticipantStatus";
    private JdbcTemplate jdbcTemplate;
    private IntegrationSQLLoader integrationSQLLoader;

    public  PrsParticipantService(JdbcTemplate jdbcTemplate, IntegrationSQLLoader integrationSQLLoader) {
        this.jdbcTemplate = jdbcTemplate;
        this.integrationSQLLoader = integrationSQLLoader;
    }

    public boolean updateParticipant(int partId, ParticipantStatusEnum status) {
        String sql = integrationSQLLoader.getSqlNodes().get(STATUS_UPDATE_QUERY_KEY).asText();
        int recordsUpdated = jdbcTemplate.update(sql, status.getStatusCode(), partId);
        return recordsUpdated > 0;
    }
}
