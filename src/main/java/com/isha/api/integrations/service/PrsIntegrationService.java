package com.isha.api.integrations.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.isha.api.integrations.common.IntegrationSQLLoader;
import com.isha.api.integrations.kafkaproducer.KafkaProducerService;
import com.isha.api.integrations.models.enums.ParticipantStatusEnum;
import com.isha.api.integrations.models.enums.SourceEnum;
import com.isha.api.integrations.payload.IECOPayload;
import com.isha.api.integrations.payload.IECOPayloadToPublish;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.net.URL;
import java.util.*;

@Service
public class PrsIntegrationService {

    private JdbcTemplate jdbcTemplate;

    private IntegrationSQLLoader integrationSQLLoader;

    private KafkaProducerService kafkaProducerService;

    private ObjectMapper jsonObjectMapper;

    private static final String QUERY_NAME = "getProgramParticipants";

    public  PrsIntegrationService(JdbcTemplate jdbcTemplate, IntegrationSQLLoader integrationSQLLoader, KafkaProducerService kafkaProducerService, ObjectMapper jsonObjectMapper) {
        this.jdbcTemplate = jdbcTemplate;
        this.integrationSQLLoader = integrationSQLLoader;
        this.kafkaProducerService = kafkaProducerService;
        this.jsonObjectMapper = jsonObjectMapper;
    }

    public List<IECOPayload> getPrsData(int prgmId) {
        String sql = integrationSQLLoader.getSqlNodes().get(QUERY_NAME).asText();
        List<IECOPayload> pgmParts = jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(IECOPayload.class),prgmId);
       return pgmParts;
    }

    @Async
    public void publishPgmPartsToKafka(List<IECOPayload> pgmParts) {
        pgmParts.stream().forEach(pgmPart -> {
            try {
                this.kafkaProducerService.postMessage(pgmPart.getPgmPartId()+"_IESCO", jsonObjectMapper.writeValueAsString(pgmPart));
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        });
    }

    @Async
    public void publishPGMPartsFromFile(SourceEnum source, URL url) {
        long linesProcessedCounter = 0l;
        try {
            Scanner fileScanner = new Scanner(url.openStream());
            if (!fileScanner.hasNext()) {
                return;
            }
            List<String> fieldNames = Arrays.asList(fileScanner.next().split(","));
            while (fileScanner.hasNext()) {
                List<String> fieldValues = Arrays.asList(fileScanner.next().split(","));
                Map<String, String> participantRow = new HashMap<>();
                for (int i = 0; i < fieldNames.size(); i++) {
                    participantRow.put(fieldNames.get(i), fieldValues.get(i));
                }
                IECOPayloadToPublish payload = jsonObjectMapper.convertValue(participantRow,
                        IECOPayloadToPublish.class);
                this.kafkaProducerService.postMessage(source.toString(), jsonObjectMapper.writeValueAsString(payload));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
