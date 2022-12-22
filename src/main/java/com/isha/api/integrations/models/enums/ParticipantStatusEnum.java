package com.isha.api.integrations.models.enums;

public enum ParticipantStatusEnum {
    READ_TO_PROCESS (0),
    SUCCESS (1),
    FAIL (2);

    private int statusCode;

    ParticipantStatusEnum(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getStatusCode() {
        return this.statusCode;
    }

    public static ParticipantStatusEnum fromCode(int statusCode) {
        for (ParticipantStatusEnum b : ParticipantStatusEnum.values()) {
            if (b.statusCode == statusCode) {
                return b;
            }
        }
        return null;
    }
}
