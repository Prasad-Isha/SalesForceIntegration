package com.isha.api.integrations.payload;

import lombok.Data;

@Data
public class specialevent {
    private int evtId;
    private String evtDesc;
    private String evtStTime;
    private String evtEnTime;
    private int evtStatus;
    private int evtFee;
}
