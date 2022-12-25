package com.isha.api.integrations.controller;

import com.isha.api.integrations.models.enums.SourceEnum;
import com.isha.api.integrations.payload.IECOPayload;
import com.isha.api.integrations.service.PrsIntegrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

@RestController
@RequestMapping("/v1")
public class IntegrationController {

    PrsIntegrationService prsIntegrationService;

    public IntegrationController(PrsIntegrationService prsIntegrationService) {
        this.prsIntegrationService = prsIntegrationService;
    }

@GetMapping("/prsData/{prgmID}")
    public List<IECOPayload> getDataFromPrs(@PathVariable("prgmID") int prgmID){
        return prsIntegrationService.getPrsData(prgmID);
}
    @PutMapping("/prsData/bulkUpload")
    public void bulkUploadFile(@RequestParam("fileURL") String fileUrl,
                               @RequestParam("status") SourceEnum source) {
        try {
            URL url = new URL(fileUrl);
            prsIntegrationService.publishPGMPartsFromFile(source, url);
        } catch(Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }

    }

}
