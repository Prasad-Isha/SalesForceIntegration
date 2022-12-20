package com.isha.integrations.control;

import com.isha.integrations.payload.test;
import com.isha.integrations.service.PrsIntegrationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/v1")
public class IntegrationController {

@Autowired
    PrsIntegrationService prsIntegrationService;

@GetMapping("/getPrsData/{programID}")
    public List<test> getDataFromPrs(@PathVariable("programID") int programID){
        return prsIntegrationService.getPrsData(programID);
}


}
