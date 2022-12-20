package com.isha.api.integrations.service;

import com.isha.api.integrations.payload.IECOPayload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PrsIntegrationService {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<IECOPayload> getPrsData(int prgmId){
       return  jdbcTemplate.query("select usa_participants.fname,usa_participants.lname,usa_participants.email,usa_participants.sex,usa_participants.address1,usa_participants.address2,usa_participants.city,usa_participants.state,usa_participants.zip,usa_participants.country,partprogram.pgmPartId,partprogram.partId,partprogram.pgmId,partprogram.pgmType,concat(ref_usa_program.pgmId,':',ref_usa_program.day1timing,':',ref_usa_program.pgmName) as 'pgmdetail', concat(SUBSTRING_INDEX(ref_usa_program.joomlaId, '-', 1), ':',SUBSTRING_INDEX(ref_usa_program.joomlaId, '-', -1),':',1) as 'classdetail', concat('IECO_',ref_usa_program.pgmId,'_',Date_format(ref_usa_program.programDate,'%b'),'_',Day(ref_usa_program.programDate),'_',Day(ref_usa_program.programDate)+1,'_',ref_usa_program.day1timing,'_','CT_',partprogram.partId) as 'contact_tag' from usa_participants, ref_usa_program,partprogram, country_region_mapping where usa_participants.partId=partprogram.partId and partprogram.pgmId=ref_usa_program.pgmId and ref_usa_program.programType=38 and partprogram.pgmCtry=country_region_mapping.country_code_2 and country_region_mapping.isha_region='North America' and ref_usa_program.programType=partprogram.pgmType and partprogram.cStatus='A' and partprogram.SF_UPDATE=0 and ref_usa_program.refPgmId!=0 and ref_usa_program.refPgmId=? order by partprogram.partId", BeanPropertyRowMapper.newInstance(IECOPayload.class),prgmId);
    }
}
