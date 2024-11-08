package com.example.backend;

import java.time.LocalDate;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.example.backend.entity.Initiative;
import com.example.backend.entity.Jonogon;
import com.example.backend.entity.Step;
import com.example.backend.service.InitiativeService;
import com.example.backend.service.JonogonService;

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
				new Jonogon("Zarif", "Zarif Muhtasim", "01800000000", "password", "imageurl", skills),
		};

		for (Jonogon jonogon : jonogons) {
			jonogonService.save(jonogon);
		}

		Initiative[] initiatives = new Initiative[] {
				new Initiative("Learn Java", LocalDate.now(), "Learn Java from scratch", 0, 0, 0, "image", jonogons[0],
						Set.of(jonogons[0]), Set.of(jonogons[0]), "asdf", "asdf", "asdf"),
		};

		for (Initiative initiative : initiatives) {
			initiativeService.save(initiative);
		}

		Step[] steps = new Step[] {
			new Step("Step 1", initiatives[0], true),
		};

		for (Step step : steps) {
			// TODO: Saimun
		}
	}

}
