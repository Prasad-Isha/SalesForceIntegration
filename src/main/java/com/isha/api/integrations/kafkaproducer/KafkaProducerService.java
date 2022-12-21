package com.isha.api.integrations.kafkaproducer;

import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.support.SendResult;
import org.springframework.stereotype.Service;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.util.concurrent.ListenableFutureCallback;

@Service
public class KafkaProducerService {

    private KafkaTemplate<String, String> template;

    public KafkaProducerService(KafkaTemplate template) {
            this.template = template;
    }

    public void postMessage(String topicName, String key,  String payload) {
        ListenableFuture<SendResult<String, String>> future = template.send(topicName, key, payload);
        future.addCallback(new ListenableFutureCallback<SendResult<String, String>>() {

            @Override
            public void onSuccess(SendResult<String, String> result) {
                System.out.println("Sent message=[ " + key + " " + payload +
                        "] with offset=[" + result.getRecordMetadata().offset() + "]");
            }
            @Override
            public void onFailure(Throwable ex) {
                System.out.println("Unable to send message=[ " + key + " " + payload + "] due to : " + ex.getMessage());
            }
        });

    }
}
