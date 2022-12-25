package com.isha.api.integrations.payload;

import lombok.Data;

// We will change this once the data format is ready
@Data
public class IECOPayloadToPublish {
    private String fname;
    private String lname;
    private String email;
    private String pPhone;
    private String sex;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private String pgmPartId;
    private String partId;
    private String pgmId;
    private String pgmType;
    private String pgmdetail;
    private String classdetail;
    private String contact_tag;
}
