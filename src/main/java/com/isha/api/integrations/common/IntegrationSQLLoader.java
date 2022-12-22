package com.isha.api.integrations.common;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

@Component
public class IntegrationSQLLoader {

    private static final String SQL_RESOURCE_FILE = "classpath:sql.json";

    private ObjectMapper jsonObjectMapper;

    private JsonNode sqlNodes;

    public static String readFile(String path, Charset encoding) throws IOException
    {
        byte[] encoded = Files.readAllBytes(Paths.get(path));
        return new String(encoded, encoding);
    }

    public IntegrationSQLLoader(ObjectMapper jsonObjectMapper) throws IOException {
        this.jsonObjectMapper = jsonObjectMapper;
        String sqlContent = readFile(ResourceUtils.getFile(SQL_RESOURCE_FILE).getAbsolutePath(), StandardCharsets.UTF_8);
        setSqlNodes(jsonObjectMapper.readTree(sqlContent.replace("\\n", "")));
    }

    public JsonNode getSqlNodes() {
        return sqlNodes;
    }

    public void setSqlNodes(JsonNode sqlNodes) {
        this.sqlNodes = sqlNodes;
    }



}
