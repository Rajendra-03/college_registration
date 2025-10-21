package com.cttc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class SupabaseService {

    @Value("${SUPABASE_URL}")
    private String supabaseUrl;

    @Value("${SUPABASE_KEY}")
    private String supabaseKey;

    private final RestTemplate restTemplate = new RestTemplate();

    private HttpHeaders headers() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("apikey", supabaseKey);
        headers.set("Authorization", "Bearer " + supabaseKey);
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setAccept(List.of(MediaType.APPLICATION_JSON));
        return headers;
    }

    // ------------------ COLLEGES ------------------
    public String getAllColleges() {
        String url = supabaseUrl + "/rest/v1/college_master";
        HttpEntity<String> entity = new HttpEntity<>(headers());
        ResponseEntity<String> resp = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        return resp.getBody();
    }

    public String getCollegeById(Integer id) {
        String url = supabaseUrl + "/rest/v1/college_master?id=eq." + id;
        HttpEntity<String> entity = new HttpEntity<>(headers());
        ResponseEntity<String> resp = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        return resp.getBody();
    }

    // ------------------ BRANCHES ------------------
    public String getAllBranches() {
        String url = supabaseUrl + "/rest/v1/branch_master";
        HttpEntity<String> entity = new HttpEntity<>(headers());
        ResponseEntity<String> resp = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        return resp.getBody();
    }

    public String getBranchesByCollegeId(Integer collegeId) {
        String url = supabaseUrl + "/rest/v1/branch_master?college_id=eq." + collegeId;
        HttpEntity<String> entity = new HttpEntity<>(headers());
        ResponseEntity<String> resp = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        return resp.getBody();
    }

    // ------------------ REGISTRATION ------------------
    public String getAllRegistrations() {
        String url = supabaseUrl + "/rest/v1/registration_details";
        HttpEntity<String> entity = new HttpEntity<>(headers());
        ResponseEntity<String> resp = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        return resp.getBody();
    }

    public String addRegistration(String jsonPayload) {
        String url = supabaseUrl + "/rest/v1/registration_details";
        HttpEntity<String> entity = new HttpEntity<>(jsonPayload, headers());
        ResponseEntity<String> resp = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
        return resp.getBody();
    }
}
