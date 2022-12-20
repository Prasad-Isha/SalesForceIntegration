package com.isha.api.integrations.controller;

import com.isha.api.integrations.payload.IECOPayload;
import com.isha.api.integrations.service.PrsIntegrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/v1")
public class IntegrationController {

@Autowired
    PrsIntegrationService prsIntegrationService;

@GetMapping("/getPrsData/{prgmID}")
    public List<IECOPayload> getDataFromPrs(@PathVariable("prgmID") int prgmID){
        return prsIntegrationService.getPrsData(prgmID);
}


}
