package com.jersey;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.hibernate4.Hibernate4Module;

public class ObjectMapperFactory {
    private static final ObjectMapper objectMapper;
    static {
        objectMapper = new ObjectMapper()
                .registerModule(new Hibernate4Module());
    }

    public static ObjectMapper create() {
        return objectMapper;
    }
}