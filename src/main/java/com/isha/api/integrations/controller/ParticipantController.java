package com.isha.api.integrations.controller;

import com.isha.api.integrations.models.enums.ParticipantStatusEnum;
import com.isha.api.integrations.service.PrsParticipantService;
import org.springframework.web.bind.annotation.*;

import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

@RestController
@RequestMapping("/v1")
public class ParticipantController {

    private PrsParticipantService participantService;

    public ParticipantController(PrsParticipantService participantService) {
        this.participantService = participantService;
    }

    @PutMapping("/prsData/participant/{partId}")
    public boolean getDataFromPrs(@PathVariable("partId") int partId,
                                  @RequestParam("source") ParticipantStatusEnum status){
        return participantService.updateParticipant(partId, status);
    }

}
