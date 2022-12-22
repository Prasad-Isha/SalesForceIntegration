package com.isha.api.integrations.controller;

import com.isha.api.integrations.models.enums.ParticipantStatusEnum;
import com.isha.api.integrations.service.PrsParticipantService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/v1")
public class ParticipantController {

    private PrsParticipantService participantService;

    public ParticipantController(PrsParticipantService participantService) {
        this.participantService = participantService;
    }

    @PutMapping("/prsData/participant/{partId}")
    public boolean getDataFromPrs(@PathVariable("partId") int partId,
                                  @RequestParam("status") ParticipantStatusEnum status){
        return participantService.updateParticipant(partId, status);
    }


}
