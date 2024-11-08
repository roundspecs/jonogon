package com.example.backend;

import java.time.LocalDate;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.backend.entity.Initiative;
import com.example.backend.entity.Jonogon;
import com.example.backend.services.InitiativeService;
import com.example.backend.services.JonogonService;

@SpringBootApplication
public class BackendApplication implements CommandLineRunner {

	@Autowired
	JonogonService jonogonService;
	@Autowired
	InitiativeService initiativeService;

	public static void main(String[] args) {
		SpringApplication.run(BackendApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Set<String> skills = Set.of("Programming", "Logistics", "Leadership");
		Jonogon[] jonogons = new Jonogon[] {
				new Jonogon("saimun", "Saifullah Saimun", "048594584", "password", LocalDate.now(), skills,
						"https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2415")
		};

		for (Jonogon jonogon : jonogons) {
			jonogonService.save(jonogon);
		}

		Initiative[] initiatives = new Initiative[] {
				new Initiative("des", "sol", LocalDate.now(), "https://cdn.pixabay.com/photo/2017/09/08/18/20/garbage-2729608_640.jpg", jonogons[0])
		};

		for (Initiative initiative : initiatives) {
			initiativeService.save(initiative);
		}

	}

}
